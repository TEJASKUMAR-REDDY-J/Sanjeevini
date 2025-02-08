import requests
from bs4 import BeautifulSoup
import json

# Step 1: Scrape Data from the MedIndia article
url = "https://www.medindia.net/news/swine-flu-death-toll-rises-to-663-in-india-146689-1.htm"
headers = {"User-Agent": "Mozilla/5.0"}
response = requests.get(url, headers=headers)
soup = BeautifulSoup(response.text, "html.parser")

# Step 2: Extract Data
title = soup.find("h1").text.strip()

# Locate the Symptoms section
symptoms_section = soup.find("strong", string=lambda text: text and "Symptoms" in text)
symptoms = []
if symptoms_section:
    symptoms_list = symptoms_section.find_next("ul")  # Find next UL (unordered list)
    if symptoms_list:
        symptoms = [li.text.strip() for li in symptoms_list.find_all("li")]

# Locate the Prevention section
prevention = []
# We'll search for all <li> tags and look for prevention-related items
li_tags = soup.find_all("li")
for li in li_tags:
    text = li.get_text(strip=True).lower()
    if "maintain" in text or "drink" in text or "cover" in text or "wear" in text:
        prevention.append(text)

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
