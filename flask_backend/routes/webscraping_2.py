import requests
from bs4 import BeautifulSoup
import json
import config

# Step 1: Scrape Data from the MedIndia article
response = requests.get(URL, headers=HEADER)
soup = BeautifulSoup(response.text, "html.parser")

# Step 2: Extract Data
title = soup.find("h1").text.strip()

# Locate the Symptoms section
def extract_symptoms(soup):
    symptoms = []
    symptoms_section = soup.find("strong", string=lambda text: text and "Symptoms" in text)
    if symptoms_section:
        symptoms_list = symptoms_section.find_next("ul")  # Find next UL (unordered list)
        if symptoms_list:
            symptoms = [li.text.strip() for li in symptoms_list.find_all("li")]
    return symptoms

# Function to extract prevention information from the page
def extract_prevention(soup):
    prevention = []
    li_tags = soup.find_all("li")
    for li in li_tags:
        text = li.get_text(strip=True).lower()
        if "maintain" in text or "drink" in text or "cover" in text or "wear" in text:
            prevention.append(text)
    return prevention

# Extract all paragraphs as content (if needed)
content = "\n".join([p.text.strip() for p in soup.find_all("p")])

# Step 3: Save as JSON 
data = {
    "Title": title,
    "Symptoms": symptoms,
    "Prevention": prevention,
    "Content": content
}

with open("scraped_data.json", "w", encoding="utf-8") as f:
    json.dump(data, f, indent=4, ensure_ascii=False)

print("Data Scraped & Saved to JSON!")
