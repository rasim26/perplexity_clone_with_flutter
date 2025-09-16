from config import Settings
from tavily import TavilyClient
import trafilatura
settings = Settings()
# importing tavily client & passing api key
tavily_client = TavilyClient(api_key=settings.TAVILY_API_KEY)
class SearchService:
    def web_search(self, query: str):
        results = []
        response = tavily_client.search(query, max_results=10) #it'll go & search for 10 sources every single time.
        search_results = response.get("results", [])

        # trafilatura used here will fetch the url to extract main content
        for result in search_results:
            # fetching means downloading the content
            downloaded = trafilatura.fetch_url(result.get('url'))
            content = trafilatura.extract(downloaded, include_comments = False) # so it'll not include the html comments
            results.append(
                {
                "title": result.get("title", ""),
                "url": result.get("url", ""),
                "content": content or ""
                }
            )

        return results

        




        