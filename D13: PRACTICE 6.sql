-- EXERCISE 1
SELECT COUNT(*) AS DUPLICATED_COMPANIES 
FROM
  (SELECT COMPANY_ID, TITLE, DESCRIPTION
  FROM JOB_LISTINGS
  GROUP BY COMPANY_ID, TITLE, DESCRIPTION
  HAVING COUNT(*) > 1) AS DUPLICATED_JOBS_PER_COMPANY;

-- EXERCISE 2
WITH ELECTRONICS_RANKED_PRODUCTS
AS
  (SELECT CATEGORY, PRODUCT,
  SUM(SPEND) AS TOTAL_SPEND
  FROM PRODUCT_SPEND
  WHERE EXTRACT(YEAR FROM TRANSACTION_DATE) = 2022
  GROUP BY CATEGORY, PRODUCT
  HAVING CATEGORY = 'electronics'
  ORDER BY TOTAL_SPEND DESC
  LIMIT 2),
APPLIANCE_RANKED_PRODUCTS 
AS
  (SELECT CATEGORY, PRODUCT,
  SUM(SPEND) AS TOTAL_SPEND
  FROM PRODUCT_SPEND
  WHERE EXTRACT(YEAR FROM TRANSACTION_DATE) = 2022
  GROUP BY CATEGORY, PRODUCT
  HAVING CATEGORY = 'appliance'
  ORDER BY TOTAL_SPEND DESC
  LIMIT 2)
SELECT CATEGORY, PRODUCT, TOTAL_SPEND
FROM APPLIANCE_RANKED_PRODUCTS
UNION ALL 
SELECT CATEGORY, PRODUCT, TOTAL_SPEND
FROM ELECTRONICS_RANKED_PRODUCTS 

-- EXERCISE 3
WITH CALLS_PER_MEMBERS
AS 
  (SELECT POLICY_HOLDER_ID, 
  COUNT(CASE_ID) AS CALL_COUNT
  FROM CALLERS
  GROUP BY POLICY_HOLDER_ID
  HAVING COUNT(CASE_ID) >= 3)
SELECT COUNT(POLICY_HOLDER_ID) AS POLICY_HOLDER_COUNT
FROM CALLS_PER_MEMBERS

-- EXERCISE 4
SELECT P.PAGE_ID
FROM PAGES AS P
LEFT JOIN PAGE_LIKES AS L
ON P.PAGE_ID = L.PAGE_ID
WHERE L.LIKED_DATE IS NULL
ORDER BY P.PAGE_ID;

-- EXERCISE 5
WITH LAST_MONTH_ACTIVE
AS 
  (SELECT DISTINCT USER_ID
  FROM USER_ACTIONS
  WHERE EXTRACT(MONTH FROM EVENT_DATE) = 6),
CUR_MONTH_ACTIVE
AS
  (SELECT DISTINCT USER_ID, MONTH
  FROM USER_ACTIONS
  WHERE EXTRACT(MONTH FROM EVENT_DATE) = 7)
SELECT C.MONTH,
COUNT(DISTINCT C.USER_ID) AS MONTHLY_ACTIVE_USERS
FROM CUR_MONTH_ACTIVE C
JOIN LAST_MONTH_ACTIVE L
ON C.USER_ID = L.USER_ID
GROUP BY C.MONTH

-- EXERCISE 6
SELECT 
DATE_FORMAT(TRANS_DATE, '%Y-%m') AS MONTH,
COUNTRY,
COUNT(*) AS TRANS_COUNT,
COUNT(CASE WHEN STATE = 'approved' THEN 1 END) AS APPROVED_COUNT,
SUM(AMOUNT) AS TRANS_TOTAL_AMOUNT,
SUM(CASE WHEN STATE = 'approved' THEN AMOUNT ELSE 0 END) APPROVED_TOTAL_AMOUNT
FROM TRANSACTIONS
GROUP BY DATE_FORMAT(TRANS_DATE, '%Y-%m'), COUNTRY

-- EXERCISE 7
SELECT 
PRODUCT_ID,
YEAR AS FIRST_YEAR,
QUANTITY,
PRICE
FROM SALES
GROUP BY PRODUCT_ID
HAVING MIN(YEAR)

-- EXERCISE 8
WITH MIN_YEAR
AS
    (SELECT PRODUCT_ID,
    MIN(YEAR) AS MINYEAR
    FROM SALES
    GROUP BY PRODUCT_ID)
SELECT S.PRODUCT_ID,
S.YEAR AS FIRST_YEAR,
S.QUANTITY,
S.PRICE 
FROM SALES S
JOIN MIN_YEAR M
ON S.PRODUCT_ID = M.PRODUCT_ID
WHERE S.YEAR = M.MINYEAR
GROUP BY S.PRODUCT_ID, S.QUANTITY, S.PRICE

-- EXERCISE 9
SELECT EMPLOYEE_ID
FROM EMPLOYEES 
WHERE SALARY < 30000
AND MANAGER_ID NOT IN 
    (SELECT EMPLOYEE_ID
    FROM EMPLOYEES)
ORDER BY EMPLOYEE_ID

-- EXERCISE 10
SELECT COUNT(*) AS DUPLICATED_COMPANIES 
FROM
  (SELECT COMPANY_ID, TITLE, DESCRIPTION
  FROM JOB_LISTINGS
  GROUP BY COMPANY_ID, TITLE, DESCRIPTION
  HAVING COUNT(*) > 1) AS DUPLICATED_JOBS_PER_COMPANY;

-- EXERCISE 11
WITH TOP_USER
AS
    (SELECT S.NAME AS RESULTS
    FROM USERS S
    JOIN MOVIERATING MR
    ON S.USER_ID = MR.USER_ID
    GROUP BY S.NAME
    ORDER BY COUNT(*) DESC, S.NAME
    LIMIT 1),
TOP_MOVIE AS
    (SELECT M.TITLE AS RESULTS
    FROM MOVIES M
    JOIN MOVIERATING MR
    ON M.MOVIE_ID = MR.MOVIE_ID
    WHERE MONTH(CREATED_AT) = 2
    AND YEAR(CREATED_AT) = 2020
    GROUP BY M.TITLE
    ORDER BY AVG(RATING) DESC, M.TITLE
    LIMIT 1)
SELECT * FROM TOP_USER
UNION ALL
SELECT * FROM TOP_MOVIE

-- EXERCISE 12
WITH FRIENDS_COUNT
AS 
    (SELECT USER_ID,
    COUNT(*) AS FRIENDS
    FROM
        (SELECT REQUESTER_ID AS USER_ID FROM REQUESTACCEPTED
        UNION ALL
        SELECT ACCEPTER_ID AS USER_ID FROM REQUESTACCEPTED) 
        AS USERS
    GROUP BY USER_ID)
SELECT USER_ID, FRIENDS
FROM FRIENDS_COUNT
WHERE FRIENDS = (SELECT MAX(FRIENDS) FROM FRIENDS_COUNT)

--
