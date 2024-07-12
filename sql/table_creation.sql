SELECT * FROM Nutrients.nutrition_new;
USE Nutrients;

SELECT Produce, COUNT(Produce) AS Number_of_types 
FROM nutrition_new
GROUP BY Produce
ORDER BY Produce;

ALTER TABLE nutrition_data_long MODIFY COLUMN Characteristic_0 TEXT AFTER Produce;

-- SET GLOBAL interactive_timeout = 28800;
-- SET GLOBAL wait_timeout = 28800;
-- SET GLOBAL net_read_timeout = 600;
-- SET GLOBAL net_write_timeout = 600;
-- SHOW VARIABLES LIKE 'interactive_timeout';
-- SHOW VARIABLES LIKE 'wait_timeout';
-- SHOW VARIABLES LIKE 'net_read_timeout';
-- SHOW VARIABLES LIKE 'net_write_timeout';
-- SET GLOBAL max_allowed_packet = 1073741824; -- Example to set it to 1GB

CREATE TABLE Macronutrients AS (
SELECT Produce, ROUND(AVG(Water_g),2) AS Water_in_gms, ROUND(AVG(Energ_Kcal),1) AS Energy_Kcal, ROUND(AVG(Protein_g),2) AS Protein_in_gms, 
ROUND(AVG(Lipid_Tot_g),2) AS Total_Lipid_gms, ROUND(AVG(Carbohydrt_g),2) AS Carbohydrates_in_gms, ROUND(AVG(Fiber_TD_g),2) AS Fiber_in_gms, ROUND(AVG(Sugar_Tot_g),2) AS Total_Sugar_gms
FROM nutrition_data_long
GROUP BY Produce
ORDER BY Produce
);

CREATE TABLE Vitamins AS (
SELECT Produce, 
       ROUND(AVG(Vit_C_mg), 2) AS Vitamin_C_mg, 
       ROUND(AVG(Thiamin_mg), 2) AS Thiamin_mg, 
       ROUND(AVG(Riboflavin_mg), 2) AS Riboflavin_mg, 
       ROUND(AVG(Niacin_mg), 2) AS Niacin_mg, 
       ROUND(AVG(Vit_B6_mg), 2) AS Vitamin_B6_mg, 
       ROUND(AVG(Folate_Tot_3qtrg), 2) AS Folate_Total_µg, 
       ROUND(AVG(Vit_B12_3qtrg), 2) AS Vitamin_B12_µg, 
       ROUND(AVG(Vit_A_IU), 2) AS Vitamin_A_IU, 
       ROUND(AVG(Vit_D_3qtrg), 2) AS Vitamin_D_µg, 
       ROUND(AVG(Vit_E_mg), 2) AS Vitamin_E_mg, 
       ROUND(AVG(Vit_K_3qtrg), 2) AS Vitamin_K_µg
FROM nutrition_data_long
GROUP BY Produce
ORDER BY Produce
);

SELECT * FROM Vitamins;

CREATE TABLE Minerals AS(
SELECT Produce, 
       ROUND(AVG(Calcium_mg), 2) AS Calcium_mg, 
       ROUND(AVG(Iron_mg), 2) AS Iron_mg, 
       ROUND(AVG(Magnesium_mg), 2) AS Magnesium_mg, 
       ROUND(AVG(Phosphorus_mg), 2) AS Phosphorus_mg, 
       ROUND(AVG(Potassium_mg), 2) AS Potassium_mg, 
       ROUND(AVG(Sodium_mg), 2) AS Sodium_mg, 
       ROUND(AVG(Zinc_mg), 2) AS Zinc_mg, 
       ROUND(AVG(Copper_mg), 2) AS Copper_mg, 
       ROUND(AVG(Manganese_mg), 2) AS Manganese_mg, 
       ROUND(AVG(Selenium_3qtrg), 2) AS Selenium_µg
FROM nutrition_data_long
GROUP BY Produce
ORDER BY Produce
);

SELECT * FROM Minerals;

CREATE TABLE Harmful AS (
SELECT Produce, 
       ROUND(AVG(Sodium_mg), 2) AS Sodium_mg, 
       ROUND(AVG(FA_Sat_g), 2) AS Saturated_Fat_g, 
       ROUND(AVG(Cholestrl_mg), 2) AS Cholesterol_mg
FROM nutrition_data_long
GROUP BY Produce
ORDER BY Produce
);

SELECT * FROM Harmful;

-- Updated Nutrients table 
CREATE TABLE Macronutrients_1 AS (
SELECT Produce, ROUND(AVG(Water_g),2) AS Water_in_gms, ROUND(AVG(Energ_Kcal),1) AS Energy_Kcal, ROUND(AVG(Protein_g),2) AS Protein_in_gms, 
ROUND(AVG(Lipid_Tot_g),2) AS Total_Lipid_gms, ROUND(AVG(Carbohydrt_g),2) AS Carbohydrates_in_gms, ROUND(AVG(Fiber_TD_g),2) AS Fiber_in_gms, ROUND(AVG(Sugar_Tot_g),2) AS Total_Sugar_gms
FROM nutrition_new
GROUP BY Produce
ORDER BY Produce
);

CREATE TABLE Vitamins_1 AS (
SELECT Produce, 
       ROUND(AVG(Vit_C_mg), 2) AS Vitamin_C_mg, 
       ROUND(AVG(Thiamin_mg), 2) AS Thiamin_mg, 
       ROUND(AVG(Riboflavin_mg), 2) AS Riboflavin_mg, 
       ROUND(AVG(Niacin_mg), 2) AS Niacin_mg, 
       ROUND(AVG(Vit_B6_mg), 2) AS Vitamin_B6_mg, 
       ROUND(AVG(Folate_Tot_3qtrg), 2) AS Folate_Total_µg, 
       ROUND(AVG(Vit_B12_3qtrg), 2) AS Vitamin_B12_µg, 
       ROUND(AVG(Vit_A_IU), 2) AS Vitamin_A_IU, 
       ROUND(AVG(Vit_D_3qtrg), 2) AS Vitamin_D_µg, 
       ROUND(AVG(Vit_E_mg), 2) AS Vitamin_E_mg, 
       ROUND(AVG(Vit_K_3qtrg), 2) AS Vitamin_K_µg
FROM nutrition_new
GROUP BY Produce
ORDER BY Produce
);

CREATE TABLE Minerals_1 AS(
SELECT Produce, 
       ROUND(AVG(Calcium_mg), 2) AS Calcium_mg, 
       ROUND(AVG(Iron_mg), 2) AS Iron_mg, 
       ROUND(AVG(Magnesium_mg), 2) AS Magnesium_mg, 
       ROUND(AVG(Phosphorus_mg), 2) AS Phosphorus_mg, 
       ROUND(AVG(Potassium_mg), 2) AS Potassium_mg, 
       ROUND(AVG(Sodium_mg), 2) AS Sodium_mg, 
       ROUND(AVG(Zinc_mg), 2) AS Zinc_mg, 
       ROUND(AVG(Copper_mg), 2) AS Copper_mg, 
       ROUND(AVG(Manganese_mg), 2) AS Manganese_mg, 
       ROUND(AVG(Selenium_3qtrg), 2) AS Selenium_µg
FROM nutrition_new
GROUP BY Produce
ORDER BY Produce
);

CREATE TABLE Harmful_1 AS (
SELECT Produce, 
       ROUND(AVG(Sodium_mg), 2) AS Sodium_mg, 
       ROUND(AVG(FA_Sat_g), 2) AS Saturated_Fat_g, 
       ROUND(AVG(Cholestrl_mg), 2) AS Cholesterol_mg
FROM nutrition_new
GROUP BY Produce
ORDER BY Produce
);

SELECT * FROM Macronutrients_1;
SELECT * FROM Vitamins_1;
SELECT * FROM Minerals_1;
SELECT * FROM Harmful_1;

DESCRIBE Minerals_1;