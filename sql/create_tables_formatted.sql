-- Create table of pricing plans for users of the software
CREATE TABLE "Plan" (
    plan_id INTEGER PRIMARY KEY AUTOINCREMENT,
    plan_name VARCHAR(15) NOT NULL,
    monthly_price DECIMAL(5, 2) NOT NULL
);

-- Create table of software users
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

/*
Example "User" table data
('user99', 'password99', 'timothy.bennett@gmail.com', 'Timothy', 'Bennett', 3)
('user14', 'password14, 'lumpkindonny@gmail.com', 'Donald', 'Lumpkin', 1)
*/

-- Create table of projects users have created
CREATE TABLE "Project" (
    project_id INTEGER PRIMARY KEY AUTOINCREMENT,
    project_name VARCHAR(31) NOT NULL,
    project_description VARCHAR(255) NOT NULL,
    create_date DATE DEFAULT CURRENT_DATE,
    user_id INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES "User"(user_id)
);

/*
Example "Project" table data
('Project outcome classification', 'Classifying if new entrepreneurs will exit', 21)
('Weight from height', 'Given someone's height, predict their weight.', 64)
*/

-- Create table of data files uploaded to projects
CREATE TABLE "Data" (
    data_id INTEGER PRIMARY KEY AUTOINCREMENT,
    data_name VARCHAR(31) NOT NULL,
    data_type VARCHAR(7),
    data_file BLOB NOT NULL
);

/*
Example "Data" table data
('clouds', 'tiff', '01100100 01100001 01110100 01100001')
('batting', 'tsv', '01100100 01100001 01110100 01100001')
*/

-- Create table linking projects to data files (many-to-many relationship)
CREATE TABLE "Project_Data" (
    project_id INTEGER NOT NULL,
    data_id INTEGER NOT NULL,
    PRIMARY KEY (project_id, data_id),
    FOREIGN KEY (project_id) REFERENCES "Project"(project_id),
    FOREIGN KEY (data_id) REFERENCES "Data"(data_id)
);

-- Create table of ML models that can be used in projects
CREATE TABLE "Model" (
    model_id INTEGER PRIMARY KEY AUTOINCREMENT,
    model_name VARCHAR(31) NOT NULL
);

-- Create table linking projects to ML models (many-to-many relationship)
CREATE TABLE "Project_Model" (
    project_id INTEGER NOT NULL,
    model_id INTEGER NOT NULL,
    PRIMARY KEY (project_id, model_id),
    FOREIGN KEY (project_id) REFERENCES "Project"(project_id),
    FOREIGN KEY (model_id) REFERENCES "Model"(model_id)
);

-- Create table of broad ML model categories
CREATE TABLE "Model_Family" (
    family_id INTEGER PRIMARY KEY AUTOINCREMENT,
    family_name VARCHAR(32) NOT NULL
);

-- Create table linking ML models to model categories (many-to-many relationship)
CREATE TABLE "Model_Family_Model" (
    family_id INTEGER NOT NULL,
    model_id INTEGER NOT NULL,
    PRIMARY KEY (family_id, model_id),
    FOREIGN KEY (family_id) REFERENCES "Model_Family"(family_id),
    FOREIGN KEY (model_id) REFERENCES "Model"(model_id)
);
