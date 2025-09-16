from typing import List
from sentence_transformers import SentenceTransformer
import numpy as np
class SortSourceService:
    # creating an init function , where we gonna instantiate embedding model
    def __init__(self):
        self.embedding_model = SentenceTransformer("all-miniLM-L6-v2")
    def sort_sources(self, query: str, search_results: List[dict]):
        try:
            relevant_docs = []
            query_embedding = self.embedding_model.encode(query)

            for res in search_results:
                res_embedding = self.embedding_model.encode(res['content'])
                # here, we need to calculate the dot product, so we use numpy
                # calculating the do tproduct of query_emb & res_emb
                # np.linalg.norm(value) is used to calculate magnitude, so the similarity eqn will give cos theta
                similarity = float(np.dot(query_embedding, res_embedding)/(np.linalg.norm(query_embedding) * np.linalg.norm(res_embedding)))

                res['relevance_score'] = similarity
                # we need to filter the content.so..
                #similarity always will be < 1

                if similarity > 0.4:
                    relevant_docs.append(res)
            return sorted(relevant_docs, key=lambda x: x['relevance_score'], reverse=True)
        except Exception as e:
            print(e)
            return []