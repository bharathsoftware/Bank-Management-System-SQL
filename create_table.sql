create database bank_management_system;


use bank_management_system;

create table branch (
branch_id int primary key,
branch_name varchar(100) unique not null,
ifsc_code varchar(15) unique not null,
address varchar(255) not null,
city varchar(50) not null, 
state varchar(50) not null,
pincode varchar(10) not null,
phone varchar(15) unique,
email varchar(100) unique,
established_date date 

);

create table employee (
employee_id int primary key ,
branch_id int not null ,
employee_name varchar(100) not null ,
designation varchar(100) not null,
phone varchar(15) unique,
email varchar(100) unique,
salary decimal(12,2) check (salary >0),
hire_date date not null,
status enum('active' , 'inactive') default 'active',

foreign key (branch_id)
references branch(branch_id)
);

create table customer (
customer_id int primary key ,
first_name varchar(50) not null,
last_name varchar(50) not null,
dob date not null,
gender enum('male' , 'female', 'other') not null,
phone varchar(15) unique,
email varchar(100) unique,
address varchar(255) not null,
occupation varchar(100) ,
annual_income decimal(15,2) check (annual_income >0),
customer_since date default(current_date),
state enum('active' , 'inactive') default 'active'
);

create table kyc (
kyc_id int primary key ,
customer_id int unique not null,
document_type varchar(50) not null,
document_number varchar(50) unique not null ,
verification_status enum('pending' , 'verified' , 'rejected') not null,
verified_date date,

foreign key (customer_id)
references customer(customer_id)
);

create table nominee (
nominee_id int primary key ,
customer_id int not null,
nominee_name varchar(100) not null,
relationship varchar(50) not null,
dob date ,
phone varchar(15),

foreign key (customer_id)
references customer(customer_id)
);

create table beneficiary (
beneficiary_id int primary key ,
customer_id int not null,
beneficiary_name varchar(100) not null,
account_number varchar(20) not null,
bank_name varchar(100) not null,
ifsc_code varchar(11) not null,

foreign key (customer_id)
references customer(customer_id)
);

create table account_type (
account_type_id int primary key ,
type_name varchar(50) unique not null,
description varchar(255) ,
min_balance decimal(12,2) check(min_balance >=0),
interest_rate decimal(5,2) check(interest_rate >=0)
);


create table account(
account_id int primary key ,
account_number varchar(20) unique not null ,
customer_id int not null,
branch_id int not null ,
account_type_id int not null,
open_date date not null,
status enum('active' , 'dormant' , 'closed' , 'frozen') default 'active' ,
balance decimal(15,2) check(balance>=0) default 0,
available_balance decimal(15,2) check(available_balance>=0) default 0 ,
minimum_balance decimal(12,2) check(minimum_balance >=0) default 0 ,
last_transaction_date datetime ,
created_by int ,
closed_date date,


foreign key (customer_id)
references customer(customer_id),

foreign key (branch_id)
references branch(branch_id),

foreign key(account_type_id)
references account_type(account_type_id),

foreign key (created_by)
references employee(employee_id)
);

create table debit_card (
debit_card_id int primary key,
account_id int not null,
card_number varchar(16) unique not null,
cvv char(3) not null,
pin_hash varchar(255) not null,
issue_date date not null,
expiry_date date not null,
status enum('active' , 'blocked'  , 'expired') default 'active' ,

foreign key (account_id) 
references account(account_id)
);

create table credit_card (
credit_card_id int primary key ,
account_id int not null,
card_number varchar(16) unique not null,
credit_limit decimal(15,2) check (credit_limit >= 0),
outstanding_amount decimal(15,2) check (outstanding_amount>=0),
interest_rate decimal(5,2) check (interest_rate >=0),
issue_date date not null,
expiry_date date not null,
status enum('active' , 'blocked'  , 'expired') default 'active' ,

foreign key (account_id)
references account(account_id)
);

create table atm_card (
atm_card_id int primary key ,
account_id int not null,
card_number varchar(16) unique not null,
pin_hash varchar(255) not null,
issue_date date not null,
expiry_date date not null,
status enum('active' , 'blocked'  , 'expired') default 'active' ,

foreign key(account_id)
references account(account_id)
);


CREATE TABLE money_transfer (
    transfer_id BIGINT PRIMARY KEY,
    sender_account_id INT NOT NULL,
    receiver_account_id INT NOT NULL,
    beneficiary_id INT,
    transfer_amount DECIMAL(15,2) NOT NULL,
    transfer_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    transfer_reference VARCHAR(100) UNIQUE,
    status ENUM('Pending','Success','Failed') DEFAULT 'Pending',
    remarks VARCHAR(255),
    FOREIGN KEY (sender_account_id) REFERENCES account(account_id),
    FOREIGN KEY (receiver_account_id) REFERENCES account(account_id),
    FOREIGN KEY (beneficiary_id) REFERENCES beneficiary(beneficiary_id)
);


CREATE TABLE atm_transaction (
    atm_txn_id BIGINT PRIMARY KEY,
    atm_card_id INT NOT NULL,
    transaction_type ENUM('Withdraw','Deposit','Balance Enquiry') NOT NULL,
    amount DECIMAL(15,2) DEFAULT 0,
    transaction_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    location VARCHAR(255),
    status ENUM('Success','Failed') DEFAULT 'Success',
    remarks VARCHAR(255),
    FOREIGN KEY (atm_card_id) REFERENCES atm_card(atm_card_id)
);



CREATE TABLE transactions (
    transaction_id BIGINT PRIMARY KEY,
    account_id INT NOT NULL,
    transaction_type ENUM('Deposit','Withdrawal','Transfer','Payment') NOT NULL,
    amount DECIMAL(15,2) NOT NULL,
    transaction_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    description VARCHAR(255),
    status ENUM('Pending','Success','Failed') DEFAULT 'Success',
    remarks VARCHAR(255),
    FOREIGN KEY (account_id) REFERENCES account(account_id)
);


CREATE TABLE payment (
    payment_id BIGINT PRIMARY KEY,
    transaction_id BIGINT NOT NULL,
    account_id INT NOT NULL,
    payment_type ENUM('Bill','Loan','Insurance','Card','UPI') NOT NULL,
    amount DECIMAL(15,2) NOT NULL,
    payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    reference_number VARCHAR(100) UNIQUE,
    gateway VARCHAR(50),
    status ENUM('Pending','Success','Failed') DEFAULT 'Pending',
    remarks VARCHAR(255),
    FOREIGN KEY (transaction_id) REFERENCES transactions(transaction_id),
    FOREIGN KEY (account_id) REFERENCES account(account_id)
);


CREATE TABLE fixed_deposit (
    fd_id INT PRIMARY KEY,
    account_id INT NOT NULL,
    principal_amount DECIMAL(15,2) NOT NULL,
    interest_rate DECIMAL(5,2) NOT NULL,
    tenure_months INT NOT NULL,
    start_date DATE NOT NULL,
    maturity_date DATE NOT NULL,
    maturity_amount DECIMAL(15,2) NOT NULL,
    status ENUM('Active','Matured','Closed') DEFAULT 'Active',
    FOREIGN KEY (account_id) REFERENCES account(account_id)
);




CREATE TABLE interest_rate (
    rate_id INT PRIMARY KEY,
    account_type_id INT NOT NULL,
    fd_rate DECIMAL(5,2),
    loan_rate DECIMAL(5,2),
    savings_rate DECIMAL(5,2),
    effective_from DATE NOT NULL,
    effective_to DATE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (account_type_id) REFERENCES account_type(account_type_id)
);


CREATE TABLE loan (
    loan_id INT PRIMARY KEY,
    account_id INT NOT NULL,
    loan_type VARCHAR(50) NOT NULL,
    principal_amount DECIMAL(15,2) NOT NULL,
    interest_rate DECIMAL(5,2) NOT NULL,
    tenure_months INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    emi_amount DECIMAL(15,2) NOT NULL,
    status ENUM('Pending','Running','Closed','Rejected') DEFAULT 'Pending',
    FOREIGN KEY (account_id) REFERENCES account(account_id)
);


CREATE TABLE loan_payment (
    loan_payment_id BIGINT PRIMARY KEY,
    loan_id INT NOT NULL,
    payment_date DATE NOT NULL,
    amount DECIMAL(15,2) NOT NULL,
    principal_paid DECIMAL(15,2) DEFAULT 0,
    interest_paid DECIMAL(15,2) DEFAULT 0,
    remaining_balance DECIMAL(15,2) NOT NULL,
    status ENUM('Pending','Success','Failed') DEFAULT 'Pending',
    FOREIGN KEY (loan_id) REFERENCES loan(loan_id)
);


CREATE TABLE account_statement (
    statement_id INT PRIMARY KEY,
    account_id INT NOT NULL,
    statement_month DATE NOT NULL,
    opening_balance DECIMAL(15,2) NOT NULL,
    closing_balance DECIMAL(15,2) NOT NULL,
    credit_total DECIMAL(15,2) DEFAULT 0,
    debit_total DECIMAL(15,2) DEFAULT 0,
    generated_on DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (account_id) REFERENCES account(account_id)
);


CREATE TABLE bank_locker (
    locker_id INT PRIMARY KEY,
    branch_id INT NOT NULL,
    customer_id INT NOT NULL,
    locker_number VARCHAR(20) UNIQUE NOT NULL,
    locker_size ENUM('Small','Medium','Large') NOT NULL,
    rent DECIMAL(10,2) NOT NULL,
    deposit_amount DECIMAL(10,2) DEFAULT 0,
    status ENUM('Occupied','Available','Closed') DEFAULT 'Available',
    FOREIGN KEY (branch_id) REFERENCES branch(branch_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE insurance (
    insurance_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    policy_number VARCHAR(50) UNIQUE NOT NULL,
    policy_type VARCHAR(50) NOT NULL,
    premium_amount DECIMAL(15,2) NOT NULL,
    sum_assured DECIMAL(15,2) NOT NULL,
    issue_date DATE NOT NULL,
    expiry_date DATE NOT NULL,
    status ENUM('Active','Expired','Cancelled') DEFAULT 'Active',
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);


CREATE TABLE upi (
    upi_id INT PRIMARY KEY,
    account_id INT NOT NULL,
    upi_id_value VARCHAR(100) UNIQUE NOT NULL,
    qr_code VARCHAR(255),
    mobile_number VARCHAR(15) UNIQUE,
    status ENUM('Active','Inactive') DEFAULT 'Active',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (account_id) REFERENCES account(account_id)
);



CREATE TABLE cheque_book (
    cheque_book_id INT PRIMARY KEY,
    account_id INT NOT NULL,
    book_number VARCHAR(50) UNIQUE NOT NULL,
    issue_date DATE NOT NULL,
    leaf_count INT NOT NULL,
    status ENUM('Issued','Used','Cancelled') DEFAULT 'Issued',
    FOREIGN KEY (account_id) REFERENCES account(account_id)
);


CREATE TABLE login (
    login_id INT PRIMARY KEY,
    customer_id INT UNIQUE,
    employee_id INT UNIQUE,
    username VARCHAR(50) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role ENUM('Customer','Employee','Admin') NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    last_login DATETIME,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id)
);




CREATE TABLE audit_log (
    audit_id BIGINT PRIMARY KEY,
    user_id INT NOT NULL,
    action VARCHAR(100) NOT NULL,
    action_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    table_name VARCHAR(100),
    record_id VARCHAR(100),
    old_value TEXT,
    new_value TEXT,
    ip_address VARCHAR(45)
);


CREATE TABLE notification (
    notification_id BIGINT PRIMARY KEY,
    customer_id INT NOT NULL,
    type ENUM('Alert','Message','Reminder','Update') NOT NULL,
    title VARCHAR(100) NOT NULL,
    message TEXT NOT NULL,
    sent_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    read_status BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

DROP DATABASE bank_management_system;

show databases;

