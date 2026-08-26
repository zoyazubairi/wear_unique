import os
from dotenv import load_dotenv
from google import genai

load_dotenv()

client = genai.Client(
    api_key=os.getenv("GEMINI_API_KEY")
)

prompt = """
You are a clothing size recommendation assistant.

A customer has provided:

Gender: Female
Height: 165 cm
Weight: 55 kg
Bust: 86 cm
Waist: 68 cm
Hip: 92 cm

PRODUCT SIZE CHART:

S: Bust 84-88 cm, Waist 66-70 cm
M: Bust 89-93 cm, Waist 71-75 cm
L: Bust 94-98 cm, Waist 76-80 cm
XL: Bust 99-104 cm, Waist 81-86 cm

TASK:
Comapre the customer's measurements with the product's size chart and recommend the most suitable size.

Return your answer in this format:

Reason: [Give a short explanation based on the measurements and size chart.]

Important:
- Do not determine the size from gender alone.
- Do not assume body measurements from height or wight.
- Give priority to the customer's actual measurements.
- If the measurements do not provide enough information, clearly say so.
"""

response = client.models.generate_content(
    model = "gemini-3.6-flash",
    contents = prompt
)

print(response.text)