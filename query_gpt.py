import os
from dotenv import load_dotenv
from openai import OpenAI
from query_db import get_schema_string
from constants import GPT_MODEL, MAX_TOKENS

## Connect to OpenAI client
load_dotenv()
openai_client: OpenAI = OpenAI(api_key=os.environ.get("OPENAI_KEY"))

def query_openai(prompt: str, 
                 system_prompt:str='You respond to plain text questions with appropriate SQLite code.') -> str:
    """
    Queries the OpenAI chat model with the given prompt and returns the generated response.

    Args:
        prompt (str): The prompt to be used for the chat model.
        system_prompt (str): The system prompt to be used for the chat model.

    Returns:
        str: The generated response from the chat model.
    """
    
    completion: dict = openai_client.chat.completions.create(
        model=GPT_MODEL,
        messages=[
            {"role": "system", "content": "{system_prompt}"},
            {"role": "user", "content": prompt}
        ]
    )

    return completion.choices[0].message.content

def prompt_to_sql(prompt: str) -> str:
    """
    Queries the user for a prompt and uses the OpenAI chat model to generate a valid SQLite query that answers the prompt.
    """

    ## Define prompt for LLM given schema and user input
    schema: str = get_schema_string()
    engineered_prompt = f"""
        /* {schema} */ 
        -- Write valid SQLite to answer the foldlowing question for the tables provided above. Reply only with the SQL code and no comments.

        Question: {prompt}
        """
    
    system_prompt = """You are given a database schema and a question. You respond with valid SQLite code to retrieve the answer from the database. 
    You can only reply with code and no natural language or markdown."""
    
    ## Query GPT to get SQL code
    response: str = query_openai(engineered_prompt, system_prompt=system_prompt)

    return response

def sql_to_answer(question: str, query: str, query_results: list) -> str:
    """
    Given a question and the results of a SQL query ansewring it, use an OpenAI chat model to generate a
    natural language response to the question.
    """

    ## Define prompt for LLM given schema and user input
    engineered_prompt = f"""Answer the question using the SQL query and query results. Reply with a friendly answer to the question.
        -- Question: {question}
        -- SQL query: {query}
        -- Query's results: {query_results}
    """

    system_prompt = """You are given SQL queries and their results to answer a question. 
    Use this information to nswer the question with natural language. Reply only with the answer and no reference to the code."""
   
    ## Query GPT to get SQL code
    response: str = query_openai(engineered_prompt, system_prompt=system_prompt)

    return response