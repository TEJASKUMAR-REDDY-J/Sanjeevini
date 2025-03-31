import os

class Config:
    # Base URL for the website
    BASE_URL = "https://www.medindia.net"
    NEWS_URL = f"{BASE_URL}/news/swine-flu-death-toll-rises-to-663-in-india-146689-1.htm"
    
    # Headers for web scraping (User-Agent)
    HEADER = {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3"
    }
    
    # Use environment variables for sensitive data like API keys
    GROQ_API_KEY = os.getenv("GROQ_API_KEY")  # Set your API key in environment variables
    if not GROQ_API_KEY:
        raise ValueError("GROQ API Key is missing. Please set the 'GROQ_API_KEY' environment variable.")

    # API URL for Groq
    GROQ_API_URL = "https://api.groq.com/v1/chat/completions"
    
    # Model and temperature for API calls
    MODEL = "mixtral-8x7b-32768"
    TEMPERATURE = 0.7

    # Default System Prompt for Groq API
    SYSTEM_PROMPT = "You are a helpful QnA chatbot. Answer concisely."
