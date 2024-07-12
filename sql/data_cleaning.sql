CREATE DATABASE Nutrients;
USE Nutrients;

-- ALTER TABLE nutrition_data_long
-- ADD COLUMN `index` int FIRST;

-- LOAD DATA INFILE '/Users/rindhujajohnson/Documents/GitHub/nutrition-analysis-of-us-food-products/data/nutrition_data_long.csv'
-- INTO TABLE nutrition_data_long
-- FIELDS TERMINATED BY ',' ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 LINES;

-- Data uploaded directly from Python using mysql-connector-python

-- SET GLOBAL local_infile = 1;
-- SHOW VARIABLES LIKE 'secure_file_priv';
SHOW COLUMNS FROM nutrition_data_long;

SELECT * FROM nutrition_data_long;

DESCRIBE nutrition_data_long;

-- TRUNCATE TABLE nutrition_data_long;
-- DROP TABLE nutrition_data;

CREATE TABLE nutrition_new LIKE nutrition_data_long;
INSERT INTO nutrition_new
SELECT * FROM nutrition_data_long;

SET SQL_SAFE_UPDATES = 0;

UPDATE nutrition_new
SET Produce = CONCAT_WS(' ',Produce, NULLIF(Characteristic_0,'0'), NULLIF(Characteristic_1, '0'));

SET SQL_SAFE_UPDATES = 1;

ALTER TABLE `Nutrients`.`nutrition_new` 
DROP COLUMN `Characteristic_0`,
DROP COLUMN `Characteristic_1`,
DROP COLUMN `Characteristic_11`,
DROP COLUMN `Characteristic_10`,
DROP COLUMN `Characteristic_9`,
DROP COLUMN `Characteristic_8`,
DROP COLUMN `Characteristic_7`,
DROP COLUMN `Characteristic_6`,
DROP COLUMN `Characteristic_5`,
DROP COLUMN `Characteristic_4`,
DROP COLUMN `Characteristic_3`,
DROP COLUMN `Characteristic_2`;

SELECT * FROM nutrition_new;

CREATE TABLE IF NOT EXISTS weight_desc (
    Produce VARCHAR(255),
    Characteristic_0 VARCHAR(255),
    Characteristic_1 VARCHAR(255),
    GmWt_1 FLOAT,
    GmWt_Desc1 VARCHAR(255),
    GmWt_2 FLOAT,
    GmWt_Desc2 VARCHAR(255));
    
UPDATE weight_desc
SET Produce = CONCAT_WS(' ',Produce, NULLIF(Characteristic_0,'0'), NULLIF(Characteristic_1, '0'));

ALTER TABLE `Nutrients`.`weight_desc` 
DROP COLUMN `Characteristic_0`,
DROP COLUMN `Characteristic_1`;

SET SESSION group_concat_max_len = 10000;
CREATE TABLE serving_size AS (
SELECT 
    Produce,
    GROUP_CONCAT(DISTINCT GmWt_1 ORDER BY GmWt_1 SEPARATOR ' / ') AS GmWt_1,
    GROUP_CONCAT(DISTINCT GmWt_2 ORDER BY GmWt_2 SEPARATOR ' / ') AS GmWt_2,
    GROUP_CONCAT(DISTINCT GmWt_Desc1 ORDER BY GmWt_Desc1 SEPARATOR ' / ') AS GmWt_Desc1,
    GROUP_CONCAT(DISTINCT GmWt_Desc2 ORDER BY GmWt_Desc2 SEPARATOR ' / ') AS GmWt_Desc2
FROM 
    weight_desc
GROUP BY 
    Produce
);

SELECT * FROM serving_size;