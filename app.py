from fastapi import FastAPI, Request
from fastapi.staticfiles import StaticFiles
from fastapi.templating import Jinja2Templates
import mysql.connector

app = FastAPI()

app.mount("/static", StaticFiles(directory="static"), name="static")
templates = Jinja2Templates(directory="templates")

mydb = mysql.connector.connect(host="localhost", user="root", password="", database="wear_unique")
mycursor = mydb.cursor(dictionary=True)

@app.get("/product/{id}")
async def product_page(request: Request, id: str):
    mycursor.execute("SHOW * FROM products WHERE id = %s", (id,))
        
    product = mycursor.fetchnone()
    return templates.TemplateResponse(request, "product.html", {
        "product": product})


