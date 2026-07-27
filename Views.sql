-- Customer Account View

CREATE VIEW customer_account_view AS
SELECT
    c.customer_id,
    c.first_name,
    a.account_number,
    a.balance
FROM customer c
JOIN account a
ON c.customer_id = a.customer_id;

SELECT * FROM customer_account_view;


-- Employee Branch View

CREATE VIEW employee_branch_view AS
SELECT
    e.employee_name,
    b.branch_name
FROM employee e
JOIN branch b
ON e.branch_id = b.branch_id;

SELECT * FROM employee_branch_view;