import os
from dotenv import load_dotenv
from groq import Groq

# Load API key from .env
load_dotenv()

class SimpleQnAChatbot:
    def __init__(self, model_name="llama3-8b"):
        api_key = os.getenv("GROQ_API_KEY")
        if not api_key:
            raise ValueError("GROQ_API_KEY is not set. Please check your .env file or environment variables.")
        self.client = Groq(api_key=api_key)
        self.model_name = "mixtral-8x7b-32768"

    def get_response(self, question: str):
        messages = [{"role": "user", "content": question}]
        completion = self.client.chat.completions.create(
            messages=messages,
            model=self.model_name,
            temperature=0.1
        )
        return completion.choices[0].message.content

if __name__ == "__main__":
    bot = SimpleQnAChatbot()
    while True:
        user_input = input("You: ")
        if user_input.lower() in ["exit", "quit"]:
            print("Goodbye!")
            break
        print("Bot:", bot.get_response(user_input))
