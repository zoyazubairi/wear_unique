from fastapi import FastAPI, Request, Form, File, UploadFile
from fastapi.responses import RedirectResponse
from fastapi.staticfiles import StaticFiles
from fastapi.templating import Jinja2Templates
from datetime import date
import mysql.connector
import httpx
import uuid
from urllib.parse import quote

app = FastAPI()

app.mount("/static", StaticFiles(directory="static"), name="static")
templates = Jinja2Templates(directory="templates")

mydb = mysql.connector.connect(host="127.0.0.1", user="root", password="", database="wear_unique")
mycursor = mydb.cursor(dictionary=True)

@app.get("/category/{id}")
async def category_page(request: Request, id: str):
    mycursor.execute("SELECT * FROM categories WHERE id = %s", (id,))
    category = mycursor.fetchone()
    
    mycursor.execute("SELECT * FROM products WHERE category_id = %s", (id,))
    productlist = mycursor.fetchall()
    
    for item in productlist:
        mycursor.execute("SELECT * FROM variants WHERE product_id = %s LIMIT 1", (item["id"],))
        first = mycursor.fetchone()
        item["image"] = first["image"]
    
    return templates.TemplateResponse(request, "shop.html", {
        "category": category,
        "productlist": productlist
    })

@app.api_route("/product/{id}", methods=["GET", "POST"])
async def product_page(request: Request, id: str):
    
    chosenpic = request.query_params.get("chosen")
    uploadedpic = request.query_params.get("uploaded")
    resultpic = request.query_params.get("result")
    tryerror = request.query_params.get("tryerror")
    showupload = False
    
    if request.method == "POST":
        showupload = True
        form = await request.form()
        clickedimg = form.get("chosenimg")
        
        if clickedimg:
            chosenpic = clickedimg
            showupload = True
    
    if chosenpic or uploadedpic:
        showupload = True
            
    mycursor.execute("SELECT * FROM products WHERE id = %s", (id,))
    product = mycursor.fetchone()

    mycursor.execute("SELECT * FROM variants WHERE product_id = %s AND size = 'S'", (product["id"],))
    colorlist = mycursor.fetchall()
    
    mycursor.execute("SELECT * FROM variants WHERE product_id = %s AND color = %s", (product["id"], colorlist[0]["color"]))
    sizelist = mycursor.fetchall()
    
    return templates.TemplateResponse(request, "product.html", {
        "product": product,
        "colorlist": colorlist,
        "sizelist": sizelist,
        "chosenpic": chosenpic,
        "uploadedpic": uploadedpic,
        "showupload": showupload,
        "resultpic": resultpic,
        "tryerror": tryerror
        })

TRYON_URL = "http://127.0.0.1:8005/tryon/"
TRYON_TIMEOUT = 300

def run_tryon(person_bytes, chosenimg):
    try:
        with open("static/" + chosenimg, "rb") as garment:
            reply = httpx.post(
                TRYON_URL, 
                files = {
                    "person": person_bytes,
                    "cloth": garment.read()
                },
                timeout = TRYON_TIMEOUT
                ).json()
            
            if not reply.get("success"):
                return "", reply.get("error") or "Try-on failed"
            
            image = httpx.get(
                reply["output"]["image_url"],
                timeout = 120
            ).content
            
            result_name = "result_" + uuid.uuid4().hex[:12] + ".jpg"
            
            with open("static/uploads/" + result_name, "wb") as f:
                f.write(image)
                
            return result_name, ""
        
    except httpx.ConnectError:
        return "", "Try-on service is not running. Start virtual_try_on on port 8001"
    except Exception as e:
        return "", f"Try-on failed: {e}"

@app.post("/upload")
async def upload_photo(pid: str = Form(...), chosenimg: str = Form(""), photo: UploadFile = File(...)):
    result_name = ""
    
    # with open("static/uploads/" + photo.filename, "wb") as f:
    #     f.write(await photo.read())
    
    if not chosenimg:
        error = "Pick a garment with Try Now first"
    elif not photo.filename:
        error =" Choose a photo first"
    else:
        result_name, error = run_tryon(
            await photo.read(),
            chosenimg
        )
    
    return RedirectResponse(
        f"/product/{pid}?chosen={quote(chosenimg)}"
        f"&uploaded={quote(photo.filename)}"
        f"&result={quote(result_name)}&tryerror={quote(error)}",
        status_code=303
    )