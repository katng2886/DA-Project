-- Determine the avarage fare amount and Total fare amount from 2 vendors
SELECT VENDORID, AVG(FARE_AMOUNT) Avg_fare_amount, SUM(fare_amount) Total_fare_amount FROM `datasetid.dataname.fact_table` GROUP BY VENDORID;

-- Find the average amount of tip categorized by payment type:
select b.payment_type_name, round(AVG(a.tip_amount),2) Avg_tip_amount from `datasetid.dataname.fact_table` a join `hopeful-text-419519.uber_data_engineering.payment_type_dim` b on a.payment_type_id = b.payment_type_id group by b.payment_type_name;

-- Find the total amount of tip categorized by payment type:
select b.payment_type_name, round(SUM(a.tip_amount),2) total_tip_amount from `datasetid.dataname.fact_table` a join `hopeful-text-419519.uber_data_engineering.payment_type_dim` b on a.payment_type_id = b.payment_type_id group by b.payment_type_name;

