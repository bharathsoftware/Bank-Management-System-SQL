-- Index on Account Number

CREATE INDEX idx_account_number
ON account(account_number);


-- Index on Customer Phone

CREATE INDEX idx_customer_phone
ON customer(phone);



-- Index on Employee Email
CREATE INDEX idx_employee_email
ON employee(email);