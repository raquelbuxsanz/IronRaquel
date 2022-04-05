-- 1. Review the tables in the database.
select * from sakila.Staff
select * from sakila.Inventory
select * from sakila.Language 

-- 2. Explore tables by selecting all columns from each table or using the in built review features for your client.
SELECT name, language_id, last_update FROM sakila.Language
Select last_update, store_id, film_id, inventory_id from sakila.Inventory


-- 3. Select one column from a table. Get film titles.
select title from sakila.Film

-- 4. Select one column from a table and alias it. Get unique list of film languages under the alias language. 
select title as Film_titles from sakila.Film 
select name as language from sakila.Language

-- 5.1 Find out how many stores does the company have?
SELECT COUNT(store_id) FROM sakila.Store; 

-- 5.2 Find out how many employees staff does the company have?
SELECT COUNT(first_name) FROM sakila.Staff;

-- 5.3 Return a list of employee first names only?
SELECT first_name FROM sakila.Staff;


-- BANK DATABASE
-- 1. Get the id values of the first 5 clients from district_id with a value equals to 1.
Select client_id from bank.client where district_id = 1 limit 5;

-- 2. In the client table, get an id value of the last client where the district_id equals to 72.
Select client_id from bank.client where district_id = 72 ORDER BY client_id DESC limit 1;

-- 3. Get the 3 lowest amounts in the loan table.
select amount FROM bank.loan order by amount ASC limit 3;

-- 4. What are the possible values for status, ordered alphabetically in ascending order in the loan table?
select distinct status FROM bank.loan order by status ASC 

-- 5.What is the loan_id of the highest payment received in the loan table? 
select loan_id from bank.loan where payments order by payments DESC limit 1 

-- 6. What is the loan amount of the lowest 5 account_ids in the loan table? Show the account_id and 
--    the corresponding amount
SELECT amount, account_id from bank.loan order by amount limit 5

-- 7. What are the top 5 account_ids with the lowest 
-- loan amount that have a loan duration of 60?
select account_id from bank.loan order by account_id ASC limit 5 where duration = 60

-- 8. What are the unique values of k_symbol in the order table?
select distinct k_symbol FROM bank.`order`
where k_symbol <>''
order by k_symbol

-- 9. In the order table, what are the order_ids of the client with the account_id 34?
select order_id from bank.order where account_id = 34

-- 10. In the order table, which account_ids were responsible for orders 
-- between order_id 29540 and order_id 29560 (inclusive)?
select distinct account_id from bank.order where order_id between 29540 and 29560

-- 11. In the order table, what are the individual amounts that were
-- sent to (account_to) id 30067122?
select amount from bank.order where account_to = 30067122

-- 12. In the trans table, show the trans_id, date, type and amount of the 10 
-- first transactions from account_id 793 in chronological order, from newest to oldest.
select trans_id, date, type, amount from bank.trans where account_id = 793 order by date DESC limit 10








