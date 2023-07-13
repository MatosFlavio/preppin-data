--Summer of SQL
--Preppin' Data 2023 Week 01


-- Input the data
--Split the Transaction Code to extract the letters at the start of the transaction code
    --Rename the new field with the Bank code 'Bank'
--Rename the values in the Online or In-person field, Online of the 1 values and In-Person for the 2 values.
--Change the date to be the day of the week
--Different LOD are required in the outputs. You will need to sum up the values of the transactions in three ways:
    --1. Total Values of Transactions by each bank
    --2. Total Values by Bank, Day of the Week and Type of Transaction (Online or In-Person)
    --3. Total Values by Bank and Customer Code


--1. Total Values of Transactions by each bank
SELECT SPLIT_PART(TRANSACTION_CODE,'-',1) as Bank,
SUM(Value) AS "Total Transactions"
FROM PD2023_WK01
GROUP BY Bank;


--2. Total Values by Bank, Day of the Week and Type of Transaction (Online or In-Person)
SELECT
SPLIT_PART(TRANSACTION_CODE,'-',1) as Bank,
CASE 
WHEN online_or_in_person=1 THEN 'Online'
WHEN online_or_in_person=2 THEN 'In-Person'
END as online_in_person,
DAYNAME(TO_DATE(transaction_date,'DD/MM/YYYY HH24:MI:SS')) as Day_of_the_week,
SUM(Value) AS "Total Transactions"
FROM PD2023_WK01
GROUP BY Bank, Day_of_the_week, online_in_person, 'Total Transactions';


--3. Total Values by Bank and Customer Code
SELECT
SPLIT_PART(TRANSACTION_CODE,'-',1) as Bank,
Customer_code,
SUM(Value) as "Total Transactions"
FROM PD2023_WK01
GROUP BY Bank, CUSTOMER_CODE;
