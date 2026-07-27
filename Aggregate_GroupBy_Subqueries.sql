-- AGGREGATE FUNCTIONS

SELECT COUNT(*) AS total_customers
FROM customer;

SELECT SUM(balance) AS total_balance
FROM account;

SELECT AVG(salary) AS average_salary
FROM employee;

SELECT MAX(balance) AS highest_balance
FROM account;

SELECT MIN(balance) AS lowest_balance
FROM account;


-- GROUP BY
SELECT branch_id, COUNT(*) AS total_accounts
FROM account
GROUP BY branch_id;

SELECT designation, COUNT(*) AS total_employees
FROM employee
GROUP BY designation;

SELECT account_type_id, AVG(balance) AS average_balance
FROM account
GROUP BY account_type_id;


-- HAVING
SELECT branch_id, COUNT(*) AS total_accounts
FROM account
GROUP BY branch_id
HAVING COUNT(*) > 2;

SELECT account_type_id, AVG(balance) AS average_balance
FROM account
GROUP BY account_type_id
HAVING AVG(balance) > 50000;

-- Subqueries

-- Highest balance:

SELECT *
FROM account
WHERE balance = (
    SELECT MAX(balance)
    FROM account
);

-- Customers with above-average balance:

SELECT *
FROM account
WHERE balance > (
    SELECT AVG(balance)
    FROM account
);

-- Employees earning above average salary:

SELECT *
FROM employee
WHERE salary > (
    SELECT AVG(salary)
    FROM employee
);

-- Branches having accounts:

SELECT *
FROM branch
WHERE branch_id IN (
    SELECT branch_id
    FROM account
);

-- Customers without loans:

SELECT *
FROM customer
WHERE customer_id NOT IN (
    SELECT customer_id
    FROM account
    WHERE account_id IN (
        SELECT account_id
        FROM loan
    )
);