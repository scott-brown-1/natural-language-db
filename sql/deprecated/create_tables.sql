-- Queries to create tables
CREATE TABLE "Plan" (
    plan_id INTEGER PRIMARY KEY AUTOINCREMENT,
    plan_name VARCHAR(15) NOT NULL,
    monthly_price DECIMAL(5, 2) NOT NULL
);

CREATE TABLE "User" (
    user_id INTEGER PRIMARY KEY AUTOINCREMENT,
    username VARCHAR(15) NOT NULL,
    password VARCHAR(31) NOT NULL,
    email VARCHAR(63) NOT NULL,
    first_name VARCHAR(31) NOT NULL,
    last_name VARCHAR(63) NOT NULL,
    join_date DATE DEFAULT CURRENT_DATE,
    plan_id INTEGER NOT NULL,
    FOREIGN KEY (plan_id) REFERENCES "Plan"(plan_id)
);

CREATE TABLE "Project" (
    project_id INTEGER PRIMARY KEY AUTOINCREMENT,
    project_name VARCHAR(31) NOT NULL,
    project_description VARCHAR(255) NOT NULL,
    create_date DATE DEFAULT CURRENT_DATE,
    user_id INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES "User"(user_id)
);

CREATE TABLE "Data" (
    data_id INTEGER PRIMARY KEY AUTOINCREMENT,
    data_name VARCHAR(31) NOT NULL,
    data_type VARCHAR(7),
    data_file BLOB NOT NULL
);

CREATE TABLE "Project_Data" (
    project_id INTEGER NOT NULL,
    data_id INTEGER NOT NULL,
    PRIMARY KEY (project_id, data_id),
    FOREIGN KEY (project_id) REFERENCES "Project"(project_id),
    FOREIGN KEY (data_id) REFERENCES "Data"(data_id)
);

CREATE TABLE "Model" (
    model_id INTEGER PRIMARY KEY AUTOINCREMENT,
    model_name VARCHAR(31) NOT NULL
);

CREATE TABLE "Project_Model" (
    project_id INTEGER NOT NULL,
    model_id INTEGER NOT NULL,
    PRIMARY KEY (project_id, model_id),
    FOREIGN KEY (project_id) REFERENCES "Project"(project_id),
    FOREIGN KEY (model_id) REFERENCES "Model"(model_id)
);

CREATE TABLE "Model_Family" (
    family_id INTEGER PRIMARY KEY AUTOINCREMENT,
    family_name VARCHAR(32) NOT NULL
);

CREATE TABLE "Model_Family_Model" (
    family_id INTEGER NOT NULL,
    model_id INTEGER NOT NULL,
    PRIMARY KEY (family_id, model_id),
    FOREIGN KEY (family_id) REFERENCES "Model_Family"(family_id),
    FOREIGN KEY (model_id) REFERENCES "Model"(model_id)
);
