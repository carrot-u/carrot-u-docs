# Week 2 Assignment: Instacart Queries

This week's assignment is to use your knowledge of SQL and our internal too, [Blazer](https://blazer.instacart.com/), to write some queries on Instacart data.

## Assignment submission process

- Use Blazer to write and test your queries
- Once tested and validated, please compile your answers in a `.sql` file. You can use **atom** to write your SQL. 
  - File naming convention: `firstname-lastname.sql`
  - Template of the file: here()
- Once done, push your file to the `submissions` directory in git. How to do that? All details [here](https://github.com/carrot-u/assignments-2019)

## Assignment

### Question 1

**_Find the most recent completed order where the basket size was > $500._**

Table to look at:
- Fact_order

Things to keep in mind
- The basket size is stored in the charge_amount column
- We want to focus on completed orders.

Concepts:
- Ordering
- Filtering

### Question 2

**_What GMV have we generated, how many orders were made per week in the last 8 weeks in Canada? Order the results from the most recent week to the oldest._**

Table to look at:
- fact_order
- zones
- regions
- countries

Things to keep in mind
- We’ll assume GMV is based on the charged_amount column in fact_order
- Zones refers to the regions table through the region_id column
- Regions refer to countries through the country_id column

Concepts:
- Filtering
- Joining multiple tables
- Operations on dates. DATE_TRUNC function.

### Question 3

**_What percentage of our active shoppers are in each of those age ranges:_**
**_- (0-20(_**
**_- (20-30(_**
**_- (30-40(_**
**_- (40-50(_**
**_- (50-60(_**
**_- 60+_**

Table / columns to look at:
- drivers
- `birthday` in drivers table

Concepts:
- GROUP BY
- Operation on dates: DATEDIFF
- Operations on the group by

### Question 4

**_For each of the age range categories you created in the previous question, what is the:
**_- Average delivery counts per age range of shoppers_**
**_- Average mpi_**
**_Rank those ranges from the highest average mpi to the lowest._**

You’ll use a subquery structure: WITH xxxx AS (), SELECT

Table / columns to look at:
- Drivers
- shopper_metrics
- Columns: `total_delivery_count` / `total_mpi`

Concepts:
- Storing intermediate results in a sub query: WITH xxxx AS ( ), SELECT 
- Table joins
- GROUP BY

### Question 5

**_Are there duplicate driver ID records in the drivers table? (Column to check: “id”)._**
**_Are there duplicate batch ID records in the fact_batch table? (Column to check: “batch_id”)_**

**_If so, return: the ID that’s duplicated in column 1, and the number of occurrences of the dupe in column 2_**
**_Order the results by the dupes that are the most duplicated_**
**_Limit your result to only 10 records._**

**_Can you figure out why there are duplicates?_**

Table / columns to look at:
- fact_batch
- drivers

Concepts:
- GROUP BY
- HAVING operation in an aggregation

## Bonus assignment

Some tables you might use are:
- users
- orders
- order_deliveries

1) Find your user (the user who's email is your instacart.com email address)

2) Count the number of orders made by Dave's account (user id: 22438411)

3) Find the most recent order where the total is greater than $500

4) Count the number of deliveries (table name: order_deliveries) from The Garden (warehouse id: 1000) that have been completed in the last day

5) List the user_ids of the first 10 people to have a delivery from The Garden (warehouse id: 1000)


**Fun Fact**: Blazer is open source software that was developed by one of our early engineers. It is used at Instacart and by many other people. You can look at the source code for Blazer [here](https://github.com/ankane/blazer).
