/*
E-commerce Funnel Analysis using SQL

Dataset Source:
https://www.kaggle.com/datasets/dhruvkp07/funnel-analysis-dataset

Objective:
Analyze customer progression through the e-commerce funnel,
measure conversion rates, identify drop-off points, and
compare performance across devices, channels, regions,
and product categories.
*/

--==========================
--Check for Null Values
--==========================

SELECT *
FROM funnel_data
WHERE user_id IS NULL
   OR session_id IS NULL
   OR event IS NULL;

--==============================
--Check for Duplicate Records
--==============================

SELECT
user_id,
session_id,
event,
COUNT(*)
FROM funnel_data
GROUP BY user_id, session_id, event
HAVING COUNT(*) > 1;

--========================================
--Standardize Event Names
--========================================

SELECT DISTINCT event
FROM funnel_data;

--========================================
--Check Revenue Values
--========================================

SELECT *
FROM funnel_data
WHERE revenue < 0;

--========================================
--Check Missing Revenue for Purchases
--========================================

SELECT *
FROM funnel_data
WHERE event='Purchase'
AND revenue IS NULL;

--========================================
--Standardize Device Values
--========================================

SELECT DISTINCT device
FROM funnel_data;

--========================================
--Standardize Channel Values
--========================================

SELECT DISTINCT channel
FROM funnel_data;

--========================================
--Verify User Journey Completeness
--========================================

SELECT DISTINCT user_id
FROM funnel_data
WHERE event='Purchase';

--========================================
--Users at Each Stage
--========================================

SELECT
event,
COUNT(DISTINCT user_id) AS users
FROM funnel_data
GROUP BY event
ORDER BY users DESC;

--==========================================================================
--Funnel Summary
--==========================================================================

SELECT
COUNT(DISTINCT CASE WHEN event='Browse' THEN user_id END) AS browse_users,
COUNT(DISTINCT CASE WHEN event='Add to Cart' THEN user_id END) AS cart_users,
COUNT(DISTINCT CASE WHEN event='Checkout' THEN user_id END) AS checkout_users,
COUNT(DISTINCT CASE WHEN event='Purchase' THEN user_id END) AS purchase_users
FROM funnel_data;

--==============================================================================
--Overall Conversion Rate
--==============================================================================
SELECT
ROUND(
COUNT(DISTINCT CASE WHEN event='Purchase' THEN user_id END)
*100.0/
COUNT(DISTINCT CASE WHEN event='Browse' THEN user_id END),
2
) AS conversion_rate
FROM funnel_data;

--=============================================================================
--Drop-off Analysis
--=============================================================================

SELECT ROUND(
       (
         COUNT(DISTINCT CASE WHEN EVENT = 'Browse' THEN USER_ID END)
         -
         COUNT(DISTINCT CASE WHEN EVENT = 'Add to Cart' THEN USER_ID END)
       ) * 100.0
       /
       COUNT(DISTINCT CASE WHEN EVENT = 'Browse' THEN USER_ID END)
       ,2
) AS BROWSE_TO_CART_DROPOFF
FROM FUNNEL_DATA;


SELECT ROUND(
       (
         COUNT(DISTINCT CASE WHEN EVENT = 'Add to Cart' THEN USER_ID END)
         -
         COUNT(DISTINCT CASE WHEN EVENT = 'Checkout' THEN USER_ID END)
       ) * 100.0
       /
       COUNT(DISTINCT CASE WHEN EVENT = 'Add to Cart' THEN USER_ID END)
       ,2
) AS CART_TO_CHECKOUT_DROPOFF
FROM FUNNEL_DATA;

SELECT ROUND(
       (
         COUNT(DISTINCT CASE WHEN EVENT = 'Checkout' THEN USER_ID END)
         -
         COUNT(DISTINCT CASE WHEN EVENT = 'Purchase' THEN USER_ID END)
       ) * 100.0
       /
       COUNT(DISTINCT CASE WHEN EVENT = 'Checkout' THEN USER_ID END)
       ,2
) AS CHECKOUT_TO_PURCHASE
FROM FUNNEL_DATA;

--===========================================================================
--CONVERSION RATE ANALYSIS
--===========================================================================

--BROWSE_TO_CART_CONVERSION_RATE

SELECT
ROUND(
COUNT(DISTINCT CASE WHEN EVENT='Add to Cart' THEN user_id END)
*100.0/
COUNT(DISTINCT CASE WHEN event='Browse' THEN user_id END),
2
) AS BROWSE_TO_CART_CONVERSION_RATE
FROM FUNNEL_DATA;

--CART_TO_CHECKOUT_CONVERSION_RATE

SELECT ROUND(
       COUNT(DISTINCT CASE WHEN event = 'Checkout' THEN user_id END)
       * 100.0
       /
       COUNT(DISTINCT CASE WHEN event = 'Add to Cart' THEN user_id END)
       ,2
) AS cart_to_checkout_conversion
FROM funnel_data;

--CHECKOUT_TO_PURCHASE_CONVERSION_RATE

SELECT
ROUND(
COUNT(DISTINCT CASE WHEN EVENT='Purchase' THEN user_id END)
*100.0/
COUNT(DISTINCT CASE WHEN event= 'Checkout' THEN user_id END),
2
) AS CHECKOUT_TO_PURCHASE
FROM FUNNEL_DATA;

--====================================================================================
--Device Conversion Analysis
--====================================================================================

SELECT
    DEVICE,
    COUNT(DISTINCT CASE WHEN EVENT='Browse' THEN USER_ID END) AS BROWSE_USERS,
    COUNT(DISTINCT CASE WHEN EVENT='Purchase' THEN USER_ID END) AS PURCHASE_USERS,
    ROUND(
        COUNT(DISTINCT CASE WHEN EVENT='Purchase' THEN USER_ID END)
        *100.0/
        COUNT(DISTINCT CASE WHEN EVENT='Browse' THEN USER_ID END)
    ,2) AS CONV_RATE
FROM FUNNEL_DATA
GROUP BY DEVICE
ORDER BY CONV_RATE DESC;

--=====================================================================================
--Channel Conversion Analysis
--=====================================================================================

SELECT
    CHANNEL,
    COUNT(DISTINCT CASE WHEN EVENT='Browse' THEN USER_ID END) AS BROWSE_USERS,
    COUNT(DISTINCT CASE WHEN EVENT='Purchase' THEN USER_ID END) AS PURCHASE_USERS,
    ROUND(
        COUNT(DISTINCT CASE WHEN EVENT='Purchase' THEN USER_ID END)
        * 100.0
        /
        COUNT(DISTINCT CASE WHEN EVENT='Browse' THEN USER_ID END)
    ,2) AS CONV_RATE
FROM FUNNEL_DATA
GROUP BY CHANNEL
ORDER BY CONV_RATE DESC;

--=====================================================================================
--Region Analysis
--=====================================================================================

SELECT
    REGION,
    COUNT(DISTINCT CASE WHEN EVENT='Browse' THEN USER_ID END) AS BROWSE_USERS,
    COUNT(DISTINCT CASE WHEN EVENT='Purchase' THEN USER_ID END) AS PURCHASE_USERS,
    ROUND(
        COUNT(DISTINCT CASE WHEN EVENT='Purchase' THEN USER_ID END)
        * 100.0
        /
        COUNT(DISTINCT CASE WHEN EVENT='Browse' THEN USER_ID END)
    ,2) AS CONV_RATE
FROM FUNNEL_DATA
GROUP BY REGION
ORDER BY CONV_RATE DESC;

--======================================================================================
--Product Analysis
--======================================================================================

SELECT
    PRODUCT_CATEGORY,
    COUNT(DISTINCT CASE WHEN EVENT='Browse' THEN USER_ID END) AS BROWSE_USERS,
    COUNT(DISTINCT CASE WHEN EVENT='Purchase' THEN USER_ID END) AS PURCHASE_USERS,
    ROUND(
        COUNT(DISTINCT CASE WHEN EVENT='Purchase' THEN USER_ID END)
        * 100.0
        /
        COUNT(DISTINCT CASE WHEN EVENT='Browse' THEN USER_ID END)
    ,2) AS CONV_RATE
FROM FUNNEL_DATA
GROUP BY PRODUCT_CATEGORY
ORDER BY CONV_RATE DESC;
=========================================================================================




