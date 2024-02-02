# natural-language-db
Exploratory project to extract information from an SQLite database with natural language queries. Users can ask questions of the database and the questions are converted into a SQL query by an LLM. The query is then executed on the database and results are returned to the LLM. Finally,the LLM uses the query results to answer the original question with natural language.

Prompt engineering and normalization strategies inspired by [Chang, Shuaichen, and Eric Fosler-Lussier. "How to Prompt LLMs for Text-to-SQL: A Study in Zero-shot, Single-domain, and Cross-domain Settings." arXiv preprint arXiv:2305.11853 (2023)](https://arxiv.org/abs/2305.11853).

## Quickstart

To query the database:

`python3 run.py "your natural language query"`

## Example

**Question**: "Which plan makes us the most money each month?"

**Generated query:** 

`SELECT plan_name, COUNT(*) * monthly_price AS monthly_revenue
FROM user 
JOIN plan ON user.plan_id = plan.plan_id 
GROUP BY plan_name 
ORDER BY monthly_revenue DESC 
LIMIT 1;`

**Friendly anwer:** ""The plan that makes us the most money each month is the 'Enterprise' plan."

## Default database

This database represents the backend of a machine learning application that allows users to create projects, upload data to their projects, and fit machine learning models to the data.

`run.py` will automatically create and populate a sample database if one does not already exist.

The sample database schema is:

![alt text](resources/schema.png)

