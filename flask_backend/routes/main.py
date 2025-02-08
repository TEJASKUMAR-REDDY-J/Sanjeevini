import requests
from bs4 import BeautifulSoup
from config import Config  # Importing the Config class from config.py

# Function to scrape the webpage
def scrape_website():
    response = requests.get(Config.URL, headers=Config.HEADER)
    soup = BeautifulSoup(response.text, "html.parser")
    
    # Extracting the title of the webpage
    title = soup.find("h1").text.strip()

    # Function to extract symptoms
    def extract_symptoms(soup):
        symptoms = []
        symptoms_section = soup.find("strong", string=lambda text: text and "Symptoms" in text)
        if symptoms_section:
            symptoms_list = symptoms_section.find_next("ul")
            if symptoms_list:
                symptoms = [li.text.strip() for li in symptoms_list.find_all("li")]
        return symptoms

    # Function to extract prevention information
    def extract_prevention(soup):
        prevention = []
        li_tags = soup.find_all("li")
        for li in li_tags:
            text = li.get_text(strip=True).lower()
            if "maintain" in text or "drink" in text or "cover" in text or "wear" in text:
                prevention.append(text)
        return prevention

    # Extracting symptoms and prevention
    symptoms = extract_symptoms(soup)
    prevention = extract_prevention(soup)

    # Output results
    print("Title:", title)
    print("Symptoms:", symptoms)
    print("Prevention:", prevention)

# Run the scraping function
if __name__ == "__main__":
    scrape_website()

