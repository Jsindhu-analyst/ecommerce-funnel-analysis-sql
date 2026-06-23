# E-commerce Funnel Analysis using SQL

## Project Overview 

This project analyzes customer behavior across an e-commerce conversion funnel using Oracle SQL.

The objective is to identify user drop-off points, measure conversion rates, and evaluate performance across devices, channels, regions, and product categories. The analysis helps uncover bottlenecks in the customer journey and provides insights for improving conversion performance.

---

## Dataset Source

Dataset sourced from Kaggle:

https://www.kaggle.com/datasets/dhruvkp07/funnel-analysis-dataset

### Dataset Summary

* Total Records: 21,409
* Funnel Stages:

  * Browse
  * Add to Cart
  * Checkout
  * Purchase

### Columns Included

* User ID
* Session ID
* Event
* Device
* Region
* Channel
* Product Category
* Revenue
* Bonus Flag

---

## Business Questions

1. What is the overall funnel conversion rate?
2. Which funnel stage experiences the highest drop-off?
3. Which device has the highest conversion rate?
4. Which marketing channel performs best?
5. Which region converts best?
6. Which product category has the highest conversion rate?

---

## SQL Techniques Used

* CASE WHEN
* COUNT(DISTINCT)
* GROUP BY
* ORDER BY
* Aggregate Functions
* Data Quality Checks
* Conditional Aggregation
* Funnel Analysis

---

## Data Quality Checks

* Checked for null values
* Checked for duplicate records
* Investigated Bonus_Flag distribution
* Verified funnel stage counts

---

## Key Findings

### Funnel Performance

| Stage       |  Users |
| ----------- | -----: |
| Browse      | 10,000 |
| Add to Cart |  6,949 |
| Checkout    |  3,456 |
| Purchase    |  1,004 |

**Overall Conversion Rate:** 10.04%

### Funnel Drop-Off Rates

| Stage Transition       | Drop-Off Rate |
| ---------------------- | ------------: |
| Browse → Add to Cart   |        30.51% |
| Add to Cart → Checkout |        50.27% |
| Checkout → Purchase    |        70.95% |

The highest customer loss occurred between Checkout and Purchase stages.

### Device-wise Conversion Analysis

* Desktop: 10.58%
* Tablet: 10.06%
* Mobile: 9.47%

**Best Performing Device:** Desktop

![Device Analysis](screenshots/device_analysis.png)

---

### Channel-wise Conversion Analysis

* Google Ads: 10.63%
* Social Media: 10.22%
* Email: 9.86%
* Organic: 9.45%

**Best Performing Channel:** Google Ads

![Channel Analysis](screenshots/channel_analysis.png)

---

## Region-wise Conversion Analysis

- South: 10.54%
- North: 10.27%
- West: 9.73%
- East: 9.62%

**Best Performing Region:** South

![Region Analysis](screenshots/region_analysis.png)

---

## Product Category Conversion Analysis

- Electronics: 11.16%
- Fashion: 10.54%
- Sports: 9.70%
- Beauty: 9.45%
- Home: 9.30%

**Best Performing Category:** Electronics

![Product Category Analysis](screenshots/product_category_analysis.png)



---

## Files

* `funnel_analysis_queries.sql` — Complete SQL analysis queries
* `README.md` — Project documentation
* `screenshots/` — Analysis output screenshots

---

## Conclusion

This analysis revealed that only **10.04% of users completed a purchase**, indicating significant opportunities to improve customer progression through the sales funnel. The most critical bottleneck was identified between the **Checkout and Purchase stages**, where **70.95% of users abandoned the journey before completing a transaction**.

Segment-level analysis showed that **Desktop users, Google Ads traffic, the South region, and the Electronics category consistently achieved the highest conversion rates**, highlighting the characteristics of the most valuable customer segments.

These findings suggest that improving the checkout experience, reducing purchase friction, and replicating the strategies driving success in high-performing channels and customer segments could substantially increase conversions and overall business performance. By addressing the largest drop-off point and optimizing underperforming segments, the business can unlock significant revenue growth without necessarily increasing customer acquisition efforts.

