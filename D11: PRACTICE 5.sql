-- EXERCISE 1 
SELECT A.CONTINENT,
FLOOR(AVG(B.POPULATION)) AS AVG_CITY_POPULATIONS 
FROM COUNTRY AS A
INNER JOIN CITY AS B
ON A.CODE = B.COUNTRYCODE
GROUP BY A.CONTINENT;

-- EXERCISE 2
SELECT 
ROUND(CAST(COUNT(CASE
  WHEN T.SIGNUP_ACTION = 'Confirmed' THEN 1
END) AS DECIMAL)/COUNT(*), 2) AS CONFIRM_RATE
FROM EMAILS AS E
JOIN TEXTS AS T
ON E.EMAIL_ID = T.EMAIL_ID;

-- EXERCISE 3
SELECT AB.AGE_BUCKET,
ROUND(100.0*SUM(CASE
  WHEN ACTIVITY_TYPE = 'send' THEN AC.TIME_SPENT
  ELSE 0
END)/SUM(AC.TIME_SPENT), 2) AS SEND_PERC,
ROUND(100.0*SUM(CASE
  WHEN ACTIVITY_TYPE = 'open' THEN AC.TIME_SPENT
  ELSE 0
END)/SUM(AC.TIME_SPENT), 2) AS OPEN_PERC
FROM ACTIVITIES AS AC
JOIN AGE_BREAKDOWN AS AB
ON AC.USER_ID = AB.USER_ID
WHERE ACTIVITY_TYPE IN ('send', 'open')
GROUP BY AB.AGE_BUCKET;

-- EXERCISE 4
SELECT CUSTOMER_ID
FROM CUSTOMER_CONTRACTS AS C
JOIN PRODUCTS AS P
ON C.PRODUCT_ID = P.PRODUCT_ID
GROUP BY CUSTOMER_ID
HAVING COUNT(DISTINCT PRODUCT_CATEGORY) = 3;

-- EXERCISE 5
SELECT MNG.EMPLOYEE_ID, MNG.NAME AS NAME,
COUNT(EMP.REPORTS_TO) AS REPORTS_COUNT, 
ROUND(AVG(EMP.AGE), 0) AS AVG_AGE
FROM EMPLOYEES AS EMP
LEFT JOIN EMPLOYEES AS MNG
ON EMP.REPORTS_TO = MNG.EMPLOYEE_ID
WHERE EMP.REPORTS_TO IS NOT NULL
GROUP BY MNG.EMPLOYEE_ID
ORDER BY MNG.EMPLOYEE_ID;

-- EXERCISE 6
SELECT P.PRODUCT_NAME,
SUM(O.UNIT) AS UNITS_ORDERED
FROM PRODUCTS AS P
JOIN ORDERS AS O
ON P.PRODUCT_ID = O.PRODUCT_ID
WHERE ORDER_DATE BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY P.PRODUCT_NAME
HAVING SUM(O.UNIT) >= 100;

-- EXERCISE 7
SELECT P.PAGE_ID
FROM PAGES AS P
LEFT JOIN PAGE_LIKES AS L
ON P.PAGE_ID = L.PAGE_ID
WHERE L.LIKED_DATE IS NULL
ORDER BY P.PAGE_ID;

-- QUESTION 1
SELECT DISTINCT MIN(REPLACEMENT_COST) FROM FILM
GROUP BY REPLACEMENT_COST;

-- QUESTION 2
SELECT 
SUM(CASE
  WHEN REPLACEMENT_COST <= 19.99 THEN 1
  ELSE 0
END) AS LOW
FROM FILM;

-- QUESTION 3

-- QUESTION 4

-- QUESTION 5

-- QUESTION 6

-- QUESTION 7

-- QUESTION 8

--
