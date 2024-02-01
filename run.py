import argparse
import os
from query_gpt import prompt_to_sql, sql_to_answer
from query_db import read_from_db
from constants import DB_PATH, OUT_FILE

## Parse question from command line
parser: argparse.ArgumentParser = argparse.ArgumentParser()
parser.add_argument("question", help='A natural language question with which to query the database.', type=str)
args = parser.parse_args()
question: str = args.question

## Create database if it doesn't exist
if not os.path.exists(DB_PATH):
    print("Database does not exist. Creating database...")
    from query_db import create_db
    create_db()

## Get SQL query from question using OpenAI chat model
query = prompt_to_sql(prompt=question)

## Execute SQL query and get results
query_results = read_from_db(query=query)

## Get natural language answer from SQL query results using OpenAI chat model
answer = sql_to_answer(question=question, query=query, query_results=query_results)
print(answer)

## Write results to file for debugging
if os.path.exists(OUT_FILE):
    os.remove(OUT_FILE)

with open(OUT_FILE, "w") as f:
    f.write(f"Question: {question}\n")
    f.write(f"SQL query: {query}\n")
    f.write(f"Query results: {query_results}\n")
    f.write(f"Natural language answer: {answer}\n")