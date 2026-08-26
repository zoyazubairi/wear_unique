import os
import json
from dotenv import load_dotenv
from google import genai

load_dotenv()

gemini_client = genai.Client(
    api_key = os.getenv("GEMINI_API_KEY")
)

SIZE_CHARTS = {
    1: {
        "S": "Bust 84-88 cm, Waist 66-70 cm, Hip 90-94 cm",
        "M": "Bust 89-93 cm, Waist 71-75 cm, Hip 95-99 cm",
        "L": "Bust 94-98 cm, Waist 76-80 cm, Hip 100-104 cm",
        "XL": "Bust 99-104 cm, Waist 81-86 cm, Hip 105-110 cm",
    },
    
    2: {
        "S": "Chest 86-91 cm, Waist 71-76 cm",
        "M": "Chest 92-97 cm, Waist 77-82 cm",
        "L": "Chest 98-103 cm, Waist 83-88 cm",
        "XL": "Chest 104-109 cm, Waist 89-94 cm",
    },
}

def build_size_prompt(gender, height, weight, bust, waist, hip, chart_text):
    
    return f"""
    You are a clothing size recommendation assistant.

    A customer has provided:
    
    Gender: {gender}
    Height: {height} cm
    Weight: {weight} kg
    Bust/Chest: {bust} cm
    Waist: {waist} cm
    Hip: {hip if hip else "not provided"} cm
    
    PRODUCT SIZE_CHART:
    {chart_text}
    
    TASK:
    Compare the customer's measurements with the product's size chart
    and recommend the most suitable size.

    Important:
    - Do not determine the size from gender alone.
    - Do not assume body measurements from height or weight.
    - Give priority to the customer's actual measurements.
    - The short explanation should start with "Your".
    - If the measurements do not provide enough information, clearly say so.

    Respond with ONLY valid JSON, no markdown fences, in this exact shape:

    {{"size": "S", "reason": "short explanation"}}
"""

def get_size_recommendation(gender, height, weight, bust, waist, hip, category_id):
    chart = SIZE_CHARTS.get(category_id, SIZE_CHARTS[1])
    
    chart_text = "\n".join(
        f"{size}: {description}"
        for size, description in chart.items()
    )
    
    prompt = build_size_prompt(
        gender,
        height, 
        weight, 
        bust,
        waist,
        hip,
        chart_text
    )
    
    try:
        response = gemini_client.models.generate_content(
            model = "gemini-3.6-flash",
            contents = prompt
        )
        
        text = response.text.strip()
        
        if text.startswith("json"):
            text = text[4:]
            
        result = json.loads(text.strip())
        
        return(
            result.get("size", ""),
            result.get("reason", "")
        )
        
    except Exception:
        return(
            "",
            "We couldn't generate a size recommendation right now."
            "Please try again in a moment."
        )