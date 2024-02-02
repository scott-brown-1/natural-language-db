# natural-language-db
Exploratory, work-in-progress project to extract information from an SQLite database with natural language queries. Users can ask questions of the database and the questions are then converted into a SQL query by an LLM. The query is then executed on the database and results are returned the the LLM. The LLM with then use the query results to answer the original question with natural language.

Prompt engineering and normalization strategies inspired by [Chang, Shuaichen, and Eric Fosler-Lussier. "How to Prompt LLMs for Text-to-SQL: A Study in Zero-shot, Single-domain, and Cross-domain Settings." arXiv preprint arXiv:2305.11853 (2023)](https://arxiv.org/abs/2305.11853).

## Quickstart

To query the database:

`python3 run.py "your natural language query"`

## Default database

This database represents the backend of a machine learning application where users can create projects, upload data to their projects, and fit machine learning models to the data.

`run.py` will automatically create and populate a sample database if one has not already been set or created. The target database can be set in `constants.py`.

The sample database schema is:

![alt text](resources/schema.png)

