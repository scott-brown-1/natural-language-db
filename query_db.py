import sqlite3
from sqlite3 import Connection
from sqlite3 import Cursor
from sqlite3 import Error
from constants import DB_PATH, CREATE_TABLES_PATH, POPULATE_TABLES_PATH

def get_db_connection() -> Connection:
    """
    Create a database connection to the SQLite database specified by the db_file, or create a new one if it doesn't exist.

    Returns:
        sqlite3.Connection: Connection object or None
    """

    conn: Connection = None
    try:
        conn = sqlite3.connect(DB_PATH)
    except Error as e:
        print(f'Error connecting to database: {e}')

    return conn

def write_to_db(query: str, full_script: bool=False) -> None:
    """
    Execute SQL query on the database and commit the changes

    Args:
        query (str): The SQL query to be executed.
        full_script (bool): Whether or not the query is a full script or just a single query.
    """

    ## Get a connection to the database and define cursor object
    conn: Connection = get_db_connection()

    if conn is None:
        return None
    
    cursor: Cursor = conn.cursor()

    ## Execute query and commit changes
    try:
        if full_script:
            cursor.executescript(query)
        else:
            cursor.execute(query)

        conn.commit()
    except Error as e:
        print(f'Error executing query: {e}')
        return None

    conn.close()

def read_from_db(query: str) -> list:
    """
    Read data from the database using the provided query and return the result

    Args:
        query (str): The SQL query to be executed.
    """

    conn: Connection = get_db_connection()

    ## Get a connection to the database and define cursor object
    if conn is None:
        return None

    cursor: Cursor = conn.cursor()

    ## Execute query and commit changes
    try:
        cursor.execute(query)
    except Error as e:
        print(f'Error executing query: {e}')
        return None

    rows: list = cursor.fetchall()

    conn.close()

    return rows

def create_tables() -> None:
    """
    Create tables for the database as specified in the schema given at CREATE_TABLES_PATH
    """

    ## Read and execute schema from the file
    with open(CREATE_TABLES_PATH, 'r') as create_tables:
        sql: str = create_tables.read()
        write_to_db(sql, full_script=True)
        print('Tables created successfully.')

def populate_tables() -> None:
    """
    Populate tables with dummy data as specified in the SQL given at POPULATE_TABLES_PATH
    """

    ## Read and execute schema from the file
    with open(POPULATE_TABLES_PATH, 'r') as populate_tables:
        sql: str = populate_tables.read()
        write_to_db(sql, full_script=True)
        print('Tables populated successfully.')

def get_schema_string() -> str:
    """Returns a string of all CREATE TABLE statements for the given tables."""
   
   ## Read and execute schema from the file
    with open(CREATE_TABLES_PATH, 'r') as create_tables:
        sql: str = create_tables.read()
    
    ## Unify spaces and convert to lowercase for consistency in prompt
    sql_cleaned:str = ' '.join(sql.lower().split())
    return sql_cleaned

def create_db() -> None:
    """
    Create the database and populate it with tables and dummy data
    """

    create_tables()
    populate_tables()
    print('Database created successfully.')
