from fastapi import FastAPI, Request
from fastapi.staticfiles import StaticFiles
from fastapi.templating import Jinja2Templates
import mysql.connector

app = FastAPI()

app.mount("/static", StaticFiles(directory="static"), name="static")
templates = Jinja2Templates(directory="templates")

mydb = mysql.connector.connect(host="127.0.0.1", user="root", password="", database="wear_unique")
mycursor = mydb.cursor(dictionary=True)

@app.api_route("/product/{id}", methods=["GET", "POST"])
async def product_page(request: Request, id: str):
    
    chosenpic = None
    showupload = False
    
    if request.method == "POST":
        showupload = True
        form = await request.form()
        clickedimg = form.get("chosenimg")
        
        if clickedimg:
            chosenpic = clickedimg
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
        "showupload": showupload
        })


