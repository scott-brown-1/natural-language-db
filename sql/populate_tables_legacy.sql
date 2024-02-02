-- Add fake data to Plan table
INSERT INTO "Plan" (plan_name, monthly_price)
VALUES ('Free', 0.00),
       ('Basic', 9.99),
       ('Professional', 99.99),
       ('Enterprise', 499.99);

-- Add fake data to User table
INSERT INTO "User" (username, password, email, first_name, last_name, plan_id)
VALUES ('user1', 'password1', 'lorihayes@gmail.com', 'Lori', 'Hayes', 1),
       ('user2', 'password2', 'edwinthompson@gmail.com', 'Edwin', 'Thompson', 1),
       ('user3', 'password3', 'levihodgson@gmail.com', 'Levi', 'Hodgson', 1),
       ('user4', 'password4', 'debbiew@gmail.com', 'Debbie', 'Wheeler', 2),
       ('user5', 'password5', 'tonyp@gmail.com', 'Anthony', 'Piscitelli', 2),
       ('user6', 'password6', 'paris.miles@gmail.com', 'Paris', 'Miles', 2),
       ('user7', 'password7', 'edgarli@gmail.com', 'Edgar ', 'Li', 2),
       ('user8', 'password8', 'carlos.b.barlow@gmail.com', 'Carlos', 'Barlow', 3),
       ('user9', 'password9', 'lor1hayes@gmail.com', 'Lori', 'Hayes', 3),
       ('user10', 'password10', 'davis.rafael1@gmail.com', 'Rafael', 'Davis', 3),
       ('user11', 'password11', 'kathyhop@gmail.com', 'Kathleen', 'Hopkins', 3),
       ('user12', 'password12', 'geraldinehogan@gmail.com', 'Geraldine', 'Hogan', 3),
       ('user13', 'password13', 'ronnygarcia@gmail.com', 'Ronald', 'Garcia', 3),
       ('user14', 'password14', 'jodiphillips@gmail.com', 'Jodi', 'Phillips', 4),
       ('user15', 'password15', 'sherryh@gmail.com', 'Sherry', 'Henkel', 4);

-- Add fake data to Project table
INSERT INTO "Project" (project_name, project_description, user_id)
VALUES ('Iris prediction', 'Predicting iris flower species', 16),
       ('Forest cover classification', 'Classifying forest cover types', 17),
       ('Chess match outcomes', 'Predicting chess match outcomes', 18),
       ('Optical digit recognition', 'Recognizing handwritten digits', 19),
       ('Titanic survival', 'Predicting survival on the Titanic', 20),
       ('Zoo animal classification', 'Classifying zoo animal species', 21),
       ('Diabetes prediction', 'Predicting diabetes diagnosis', 22),
       ('Audiology segmentation', 'Segmenting audiology training data', 23),
       ('Predict balance scale', 'Predicting balance scale outcomes', 24),
       ('Cancer recognition in CT scans', 'Recognizing cancer in CT scans', 25),
       ('Car lifetime prediction', 'Predicting car lifetime', 26),
       ('PPGDP regression', 'Performing PPGDP regression analysis', 27),
       ('Aging biomarkers', 'Identifying aging biomarkers', 28),
       ('Water polo shot prediction', 'Predicting water polo shot outcomes', 29),
       ('Otto products classification', 'Classifying Otto products', 30),
       ('Bike rental forecasting', 'Forecasting bike rental demand', 18),
       ('Tree characteristics', 'Predicting tree height from seed characteristics', 20),
       ('Parkinsons development', 'Predicting Parkinsons disease development', 22),
       ('Facial recognition', 'Recognizing faces in images', 24),
       ('Snow forecasting', 'Forecasting snowfall', 26),
       ('SQL query error detection', 'Detecting errors in SQL queries', 28);

-- Add fake data to Data table
INSERT INTO "Data" (data_name, data_type, data_file)
VALUES ('iris', 'fth', '01100100 01100001 01110100 01100001'),
       ('forest', 'tsv', '01100100 01100001 01110100 01100001'),
       ('chess', 'csv', '01100100 01100001 01110100 01100001'),
       ('digits', 'jpg', '01100100 01100001 01110100 01100001'),
       ('titanic', 'csv', '01100100 01100001 01110100 01100001'),
       ('zoo', 'txt', '01100100 01100001 01110100 01100001'),
       ('diabetes', 'fth', '01100100 01100001 01110100 01100001'),
       ('audiology', 'csv', '01100100 01100001 01110100 01100001'),
       ('balance_scale', 'tsv', '01100100 01100001 01110100 01100001'),
       ('cancer', 'tsv', '01100100 01100001 01110100 01100001'),
       ('car', 'csv', '01100100 01100001 01110100 01100001'),
       ('ppgdp', 'txt', '01100100 01100001 01110100 01100001'),
       ('aging_bio', 'fth', '01100100 01100001 01110100 01100001'),
       ('wopo', 'txt', '01100100 01100001 01110100 01100001'),
       ('otto_products', 'csv', '01100100 01100001 01110100 01100001'),
       ('bikes', 'fth', '01100100 01100001 01110100 01100001'),
       ('trees', 'csv', '01100100 01100001 01110100 01100001'),
       ('parkinsons', 'txt', '01100100 01100001 01110100 01100001'),
       ('faces', 'tiff', '01100100 01100001 01110100 01100001'),
       ('snowdays', 'tsv', '01100100 01100001 01110100 01100001'),
       ('sql_queries', 'fth', '01100100 01100001 01110100 01100001');

-- Add fake data to Project_Data table
INSERT INTO "Project_Data" (project_id, data_id)
VALUES 
    (22, 24),
    (23, 25),
    (24, 26),
    (25, 27),
    (26, 28),
    (27, 29),
    (28, 30),
    (29, 31),
    (30, 32),
    (31, 33),
    (32, 34),
    (33, 35),
    (34, 36),
    (35, 37),
    (36, 38),
    (37, 39),
    (38, 40),
    (39, 41),
    (40, 42),
    (41, 43),
    (42, 44);

-- Add fake data to Model table
INSERT INTO "Model" (model_name)
VALUES ('Random Forest'),
       ('ARIMA'),
       ('Logistic Regression'),
       ('K-Nearest Neighbors'),
       ('Support Vector Machine'),
       ('Naive Bayes'),
       ('Neural Network'),
       ('Gradient Boosting'),
       ('Penalized Regression'),
       ('K-Means'),
       ('Prophet'),
       ('Poisson Regression');

-- Add fake data to Project_Model table
INSERT INTO "Project_Model" (project_id, model_id)
VALUES 
    (22, 4), -- iris
    (23, 1), -- forest
    (24, 9), -- chess
    (25, 7), -- optical digits
    (26, 6), -- titanic
    (27, 6), -- zoo
    (28, 4), -- diabetes
    (29, 10), -- audiology
    (30, 3), -- balance scale
    (31, 7), -- cancer
    (32, 12), -- car
    (33, 11), -- ppgdp
    (34, 8), -- aging biomarkers
    (35, 8), -- water polo
    (36, 5), -- otto products
    (37, 2), -- bike rental
    (38, 4), -- trees
    (39, 3), -- parkinsons
    (40, 7), -- faces
    (41, 2), -- snowdays
    (42, 7); -- sql queries

-- Add fake data to Model_Family table
INSERT INTO "Model_Family" (family_name)
VALUES ('Time Series'), -- ARIMA, Prophet
       ('Boosting'), -- Gradient Boosting
       ('Clustering'), -- K-Means
       ('Neural Network'), -- Neural Network
       ('Kernel method'), -- Support Vector Machine
       ('Ensemble'), -- Random Forest, Gradient Boosting
       ('Generalized Linear Model'), -- Logistic Regression, Poisson Regression
       ('Penalized '), -- Penalized Regression, Prophet
       ('Probabilistic'), -- Naive Bayes
       ('Lazy Learning'), -- K-Nearest Neighbors
       ('Parametric'), -- Logistic Regression, Poisson Regression, ARIMA
       ('Nonparametric'), -- Random Forest, K-Nearest Neighbors, Support Vector Machine, Naive Bayes, Neural Network, Gradient Boosting, K-Means, Prophet
       ('Tree-based'), -- Random Forest, Gradient Boosting
       ('Supervised'), -- Random forest, ARIMA, Logistic Regression, K-Nearest Neighbors, Support Vector Machine, Naive Bayes, Neural Network, Gradient Boosting, Penalized Regression, Poisson Regression, Prophet
       ('Unsupervised'), -- K-Means
       ('Bayesian'), -- Naive Bayes
       ('Generative'), 
       ('Geospatial'),
       ('Deep learning'); -- Neural Network

-- Add fake data to Model_Family_Model table
INSERT INTO "Model_Family_Model" (family_id, model_id)
VALUES 
    (1, 2), -- Time Series: ARIMA
    (1, 11), -- Time Series: Prophet
    (2, 8), -- Boosting: Gradient Boosting
    (3, 10), -- Clustering: K-Means
    (4, 7), -- Neural Network: Neural Network
    (5, 5), -- Kernel method: Support Vector Machine
    (6, 1), -- Ensemble: Random Forest
    (6, 8), -- Ensemble: Gradient Boosting
    (7, 3), -- Generalized Linear Model: Logistic Regression
    (7, 12), -- Generalized Linear Model: Poisson Regression
    (8, 9), -- Penalized: Penalized Regression
    (8, 11), -- Penalized: Prophet
    (9, 6), -- Probabilistic: Naive Bayes
    (10, 4), -- Lazy Learning: K-Nearest Neighbors
    (11, 3), -- Parametric: Logistic Regression
    (11, 12), -- Parametric: Poisson Regression
    (11, 2), -- Parametric: ARIMA
    (12, 1), -- Nonparametric: Random Forest
    (12, 4), -- Nonparametric: K-Nearest Neighbors
    (12, 5), -- Nonparametric: Support Vector Machine
    (12, 6), -- Nonparametric: Naive Bayes
    (12, 7), -- Nonparametric: Neural Network
    (12, 8), -- Nonparametric: Gradient Boosting
    (12, 10), -- Nonparametric: K-Means
    (12, 11), -- Nonparametric: Prophet
    (13, 1), -- Tree-based: Random Forest
    (13, 8), -- Tree-based: Gradient Boosting
    (14, 1), -- Supervised: Random Forest
    (14, 2), -- Supervised: ARIMA
    (14, 3), -- Supervised: Logistic Regression
    (14, 4), -- Supervised: K-Nearest Neighbors
    (14, 5), -- Supervised: Support Vector Machine
    (14, 6), -- Supervised: Naive Bayes
    (14, 7), -- Supervised: Neural Network
    (14, 8), -- Supervised: Gradient Boosting
    (14, 9), -- Supervised: Penalized Regression
    (14, 12), -- Supervised: Poisson Regression
    (14, 11), -- Supervised: Prophet
    (15, 10), -- Unsupervised: K-Means
    (16, 6), -- Bayesian: Naive Bayes
    (18, 7), -- Generative: Neural Network
    (19, 1), -- Geospatial: Random Forest
    (19, 8), -- Geospatial: Gradient Boosting
    (20, 7); -- Deep learning: Neural Network