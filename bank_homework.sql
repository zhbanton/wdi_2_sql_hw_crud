DROP DATABASE IF EXISTS bank_homework;
CREATE DATABASE bank_homework;
\c bank_homework

CREATE TABLE payments (
  id SERIAL PRIMARY KEY,
  created_at TIMESTAMP,
  amount MONEY,
  payer_name TEXT,
  recipient_name TEXT,
  description TEXT
);

ALTER TABLE payments ADD zipcode INTEGER;

INSERT INTO payments (created_at, amount, payer_name, recipient_name, description, zipcode) VALUES
  ('2014-02-01 10:45:56', '100.00', 'Zack', 'Bank of America', 'deposit', 02139),
  ('2014-02-13 14:45:10', '32.00', 'Zack', 'Bank of America', 'deposit', 02445),
  ('2014-04-19 10:45:56', '80.00', 'Zack', 'Bank of America', 'deposit', 02139),
  ('2014-06-01 8:32:01', '11500.00', 'Zack', 'General Assembly', 'wdi', 02139),
  ('2014-04-29 16:45:56', '10000000.00', 'Nike', 'Lebron James', null, 88888),
  ('2014-04-29 16:46:45', '10000.00', 'Lebron James', 'Zack', null, 02199),
  ('2014-03-01 10:45:56', '125.00', 'Corey', 'David', 'gambling', 02139),
  ('2014-05-21 11:45:56', '1000.00', 'Will', 'Matt', 'gambling', 02445),
  ('2013-07-11 10:45:56', '1.00', 'Zack', '711', 'cigarettes', 02139),
  ('2014-06-18 04:05:06', '1.00', 'Corey', 'Zack', 'gambling', 02139),
  ('2014-06-01 01:02:02', '85600.00', 'Corey', 'Zack', null, 02139),
  ('2014-06-17 10:45:56', '250.00', 'Will', 'Bills', 'bar tab', 02139),
  ('2014-06-14 08:45:56', '0.50', 'Paul', 'Zack', 'parking', 02139),
  ('2014-06-11 10:45:56', '28.00', 'Liz', 'Zack', 'cable', 02139),
  ('2014-01-01 01:01:01', '600.00', 'Will', 'Zack', 'food', 02139),
  ('2014-06-19 12:30:00', '22.00', 'Bank of America', 'Zack', null, 02139),
  ('2014-02-11 10:45:56', '1.00', 'Paul', 'Liz', null, 02139),
  ('2014-01-09 10:04:09', '10.09', 'Will', 'Paul', 'pizza', 02139),
  ('2014-01-01 10:54:00', '1000.00', 'Zack', 'Liz', 'rent', 02139),
  ('2014-06-14 09:45:03', '200.00', 'Bank of America', 'Zack', 'Bank error in your favor', 02139);

-- You receive notice that the payment with id of 9 is $10 too low.
-- Alter that row so that it is corrected
UPDATE payments SET amount = (amount + '10.00') WHERE id = 9;

-- Delete all payments with an amount under $2
DELETE FROM payments WHERE amount < '2.00';

-- Select all entries from the payments table
SELECT * FROM payments;

-- In a single query, output all payments ordered from the largest to the smallest
SELECT * FROM payments ORDER BY amount DESC;

-- In a single query, output the names of all distinct recipients
SELECT DISTINCT recipient_name FROM payments;

-- In a single query, select all payments created in the past week
SELECT * FROM payments WHERE created_at >= current_date - interval '7 days';

-- In a single query, select all payments with a blank description
SELECT * FROM payments WHERE description IS NULL;

-- In a single query, select all payments matching the name of one of the payers (choose any single one)
SELECT * FROM payments WHERE payer_name = 'Zack' OR recipient_name = 'Zack';







