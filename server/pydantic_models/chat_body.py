from pydantic import BaseModel


class ChatBody(BaseModel):
    #created a class of chat body which extends BaseModel
    #it'll convert it to a string, otherwise throw an error
    query: str
