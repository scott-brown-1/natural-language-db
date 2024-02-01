import os
from dotenv import load_dotenv
from openai import OpenAI
from query_db import get_schema_string
from constants import GPT_MODEL, MAX_TOKENS

## Connect to OpenAI client
load_dotenv()
openai_client: OpenAI = OpenAI(api_key=os.environ.get("OPENAI_KEY"))

def query_openai(prompt: str) -> str:
    """
    Queries the OpenAI chat model with the given prompt and returns the generated response.

    Args:
        prompt (str): The prompt to be used for the chat model.

    Returns:
        str: The generated response from the chat model.
    """
    
    completion: dict = openai_client.chat.completions.create(
        model="gpt-3.5-turbo-1106",
        messages=[
            {"role": "system", "content": "You are a helpful assistant."},
            {"role": "user", "content": prompt}
        ]
    )

    return completion.choices[0].message.content

def prompt_to_sql(prompt: str) -> str:
    """
    Queries the user for a prompt and uses the OpenAI chat model to generate a SQL query that answers the prompt.
    """

    ## Define prompt for LLM given schema and user input
    schema: str = get_schema_string()
    engineered_prompt = f"""Given the following database schema: {schema}, 
        create a SQL query that answers the following question.
        Return ONLY the raw SQL code with no natural language. Question: {prompt}"""
    
    ## Query GPT to get SQL code
    response: str = query_openai(engineered_prompt)

    return response

def sql_to_answer(question: str, query: str, query_results: list) -> str:
    """
    Given a question and the results of a SQL query ansewring it, use an OpenAI chat model to generate a
    natural language response to the question.
    """

    ## Define prompt for LLM given schema and user input
    engineered_prompt = f"""To answer to the question "{question}," the SQL query "{query}"
        returned the following results: {query_results}. Using these results, answer the question in natural language.
        Reply with only the answer and to not reference any SQL code."""
    
    ## Query GPT to get SQL code
    response: str = query_openai(engineered_prompt)

    return response