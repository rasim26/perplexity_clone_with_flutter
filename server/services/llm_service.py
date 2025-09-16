import google.generativeai as genai

from config import Settings

settings = Settings()
class LLMService:
    def __init__(self):
        genai.configure(api_key=settings.GEMINI_API_KEY)
        self.model = genai.GenerativeModel("learnlm-2.0-flash-experimental")
    def generate_response(self, query: str, search_results: list[dict]):
       # the basic prompt for response
       # Source 1: <url>
        # <content>
        # Source 2: <url>
        # <content>
        # Query: 
        context_text = "\n\n".join([
            f"Source {i+1} {result['url']}:\n{result['content']}"
            # i+1 is because we need to start from 1 not 0
            for i, result in enumerate(search_results)
        ]
        )

        full_prompt = f"""
        Context from websearch:
        {context_text}

        Query: {query}

        Please provide a comprehensive, detailed, well-cited accurate response using the above context.
        Think and reason deeply. Ensure it answers the query the user is asking. Do not use your knowledge until it is absolutely necessary.
        Answers should be just like perplexity responses.
        """

        #we need to provide this prompt to gemini

        response = self.model.generate_content(full_prompt, stream=True)

        for chunk in response:
            yield chunk.text 