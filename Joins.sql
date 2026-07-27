-- Customer + Account
SELECT c.customer_id, c.first_name, a.account_number, a.balance
FROM customer c
JOIN account a
ON c.customer_id = a.customer_id;


-- Employee + Branch
SELECT e.employee_name, e.designation, b.branch_name
FROM employee e
JOIN branch b
ON e.branch_id = b.branch_id;


-- Customer + KYC
SELECT c.first_name, k.document_type, k.verification_status
FROM customer c
JOIN kyc k
ON c.customer_id = k.customer_id;


-- Customer + Nominee
SELECT c.first_name, n.nominee_name, n.relationship
FROM customer c
JOIN nominee n
ON c.customer_id = n.customer_id;


-- Customer + Beneficiary
SELECT c.first_name, b.beneficiary_name, b.bank_name
FROM customer c
JOIN beneficiary b
ON c.customer_id = b.customer_id;


-- Account + Branch
SELECT a.account_number, b.branch_name, b.city
FROM account a
JOIN branch b
ON a.branch_id = b.branch_id;


-- Account + Account Type
SELECT a.account_number, at.type_name, a.balance
FROM account a
JOIN account_type at
ON a.account_type_id = at.account_type_id;


-- Customer + Account + Branch
SELECT c.first_name, a.account_number, b.branch_name
FROM customer c
JOIN account a
ON c.customer_id = a.customer_id
JOIN branch b
ON a.branch_id = b.branch_id;

-- Customer + Account + Account Type

SELECT c.first_name, a.account_number, at.type_name
FROM customer c
JOIN account a
    ON c.customer_id = a.customer_id
JOIN account_type at
    ON a.account_type_id = at.account_type_id;

-- Account + Debit Card
SELECT a.account_number, d.card_number, d.expiry_date
FROM account a
JOIN debit_card d
ON a.account_id = d.account_id;


-- Account + Credit Card
SELECT a.account_number, c.card_number, c.credit_limit
FROM account a
JOIN credit_card c
ON a.account_id = c.account_id;


-- Account + ATM Card
SELECT a.account_number, ac.card_number
FROM account a
JOIN atm_card ac
ON a.account_id = ac.account_id;


-- Account + Transactions
SELECT a.account_number, t.transaction_type, t.amount
FROM account a
JOIN transactions t
ON a.account_id = t.account_id;


-- Account + Loan
SELECT a.account_number, l.loan_type, l.principal_amount
FROM account a
JOIN loan l
ON a.account_id = l.account_id;

-- Loan + Loan Payment
SELECT l.loan_type, lp.payment_date, lp.amount
FROM loan l
JOIN loan_payment lp
ON l.loan_id = lp.loan_id;


-- Account + Fixed Deposit
SELECT a.account_number, f.principal_amount, f.maturity_amount
FROM account a
JOIN fixed_deposit f
ON a.account_id = f.account_id;


-- Account + UPI
SELECT a.account_number, u.upi_id_value
FROM account a
JOIN upi u
ON a.account_id = u.account_id;


-- Customer + Insurance
SELECT c.first_name, i.policy_number, i.policy_type
FROM customer c
JOIN insurance i
ON c.customer_id = i.customer_id;


-- Customer + Bank Locker
SELECT c.first_name, bl.locker_number, bl.locker_size
FROM customer c
JOIN bank_locker bl
ON c.customer_id = bl.customer_id;


-- Customer + Login
SELECT c.first_name, l.username, l.role
FROM customer c
JOIN login l
ON c.customer_id = l.customer_id;



-- Display customer account details with account type and branch information

SELECT c.first_name, a.account_number, at.type_name, b.branch_name, a.balance
FROM customer c
JOIN account a
ON c.customer_id = a.customer_id
JOIN account_type at
ON a.account_type_id = at.account_type_id
JOIN branch b
ON a.branch_id = b.branch_id;