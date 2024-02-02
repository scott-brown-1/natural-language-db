## Define script constants

## Database paths
DB_PATH: str = './ml-app-db.db'
CREATE_TABLES_PATH: str = './sql/create_tables_formatted.sql' # TODO: fix relative pathing #/natural-language-db
POPULATE_TABLES_PATH: str = './sql/populate_tables_fixed.sql' # TODO: fix relative pathing

## GPT paths
GPT_MODEL: str = 'gpt-4' #'gpt-3.5-turbo-1106' # model list at https://platform.openai.com/docs/models/overview
MAX_TOKENS = 150

## Runtime constants
OUT_FILE: str = 'run.out'
