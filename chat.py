import requests
import os

# Set up your Groq API Key (store in environment variable for security)
GROQ_API_KEY = str(os.environ.get("GROQ_API_KEY"))

# Correct Groq API Endpoint - updated to latest version
GROQ_API_URL = "https://api.groq.com/openai/v1/chat/completions"  # Updated endpoint

def get_groq_response(user_input):
    """Send user input to Groq API and return response."""
    if not GROQ_API_KEY:
        return "Error: API key not found. Set the GROQ_API_KEY environment variable."

    headers = {
        "Authorization": f"Bearer {GROQ_API_KEY}",
        "Content-Type": "application/json"
    }

    data = {
        "model": "mixtral-8x7b-32768",  # One of Groq's supported models
        "messages": [
            {"role": "system", "content": "You are a helpful QnA chatbot. Answer concisely."},
            {"role": "user", "content": user_input}
        ],
        "temperature": 0.7,
        "stream": False  # Important: Disable streaming for this example if you're not handling streams
    }

    try:
        response = requests.post(GROQ_API_URL, json=data, headers=headers)
        response.raise_for_status()

        # Parse the response correctly
        return response.json()["choices"][0]["message"]["content"]

    except requests.exceptions.HTTPError as e:
        # Handle HTTP errors (e.g., 404, 500)
        print(f"HTTP Error: {e.response.status_code}")
        print(f"Response text: {e.response.text}")
        return f"HTTP Error: {e.response.status_code} - {e.response.text}"
    except requests.exceptions.RequestException as e:
        # Handle other request-related errors (e.g., connection errors)
        return f"Request Error: {e}"
    except Exception as e:
        # Handle any other unexpected errors
        return f"Unexpected Error: {e}"

def chatbot():
    """Simple command-line chatbot loop."""
    print("Groq QnA Chatbot: Ask me anything! Type 'exit' to quit.")

    while True:
        user_input = input("You: ").strip()

        if user_input.lower() == "exit":
            print("Chatbot: Goodbye!")
            break

        if not user_input:
            print("Chatbot: Please enter a question.\n")
            continue

        response = get_groq_response(user_input)
        print(f"Chatbot: {response}\n")

if __name__ == "__main__":
    chatbot()
