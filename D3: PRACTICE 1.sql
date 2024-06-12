-- EXERCISE 1
SELECT NAME FROM CITY
WHERE COUNTRYCODE = 'USA'
AND WHERE POPULATION > 120000;

-- EXERCISE 2
SELECT * FROM CITY
WHERE COUNTRYCODE = 'JPN';

-- EXERCISE 3
SELECT CITY, STATE FROM STATION;

-- EXERCISE 4
SELECT DISTINCT CITY FROM STATION
WHERE CITY LIKE 'U%' OR CITY LIKE 'E%' OR CITY LIKE 'O%' OR CITY LIKE 'A%' OR CITY LIKE 'I%';

-- EXERCISE 5
SELECT DISTINCT CITY FROM STATION
WHERE CITY LIKE '%U' OR CITY LIKE '%E' OR CITY LIKE '%O' OR CITY LIKE '%A' OR CITY LIKE '%I';

-- EXERCISE 6
SELECT DISTINCT CITY FROM STATION
WHERE NOT (CITY LIKE 'U%' OR CITY LIKE 'E%' OR CITY LIKE 'O%' OR CITY LIKE 'A%' OR CITY LIKE 'I%');

-- EXERCISE 7
SELECT NAME FROM EMPLOYEE
ORDER BY NAME;

-- EXERCISE 8
SELECT NAME FROM EMPLOYEE
WHERE SALARY > 2000 
AND MONTHS < 10
ORDER BY EMPLOYEE_ID;

-- EXERCISE 9
SELECT PRODUCT_ID FROM PRODUCTS
WHERE LOW_FATS = 'Y'
AND RECYCLABLE = 'Y';

-- EXERCISE 10
SELECT NAME FROM CUSTOMER
WHERE NOT REFEREE_ID = 2
OR REFEREE_ID IS NULL;

-- EXERCISE 11
SELECT NAME, POPULATION, AREA FROM WORLD
WHERE AREA >= 3000000
OR POPULATION >= 25000000;

-- EXERCISE 12
SELECT DISTINCT AUTHOR_ID AS ID FROM VIEWS
WHERE AUTHOR_ID = VIEWER_ID
ORDER BY AUTHOR_ID;

-- EXERCISE 13
SELECT PART, ASSEMBLY_STEP FROM PARTS_ASSEMBLY
WHERE FINISH_DATE IS NULL;

-- EXERCISE 14
SELECT * FROM LYFT_DRIVERS
WHERE YEARLY_SALARY <= 30000 
OR YEARLY_SALARY >= 70000;

-- EXERCISE 15
SELECT ADVERTISING_CHANNEL FROM UBER_ADVERTISING
WHERE YEAR = 2019
AND MONEY_SPENT > 100000;
