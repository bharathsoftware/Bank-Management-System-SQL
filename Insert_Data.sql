INSERT INTO branch VALUES
(101,'Coimbatore Main','SBIN0001234','100 Avinashi Road','Coimbatore','Tamil Nadu','641018','9876543210','cbt@sbi.com','2005-01-15'),

(102,'Chennai Branch','SBIN0005678','25 Anna Salai','Chennai','Tamil Nadu','600002','9876543211','chn@sbi.com','2008-07-20'),

(103,'Bangalore Branch','SBIN0009012','MG Road','Bangalore','Karnataka','560001','9876543212','blr@sbi.com','2012-04-10');


INSERT INTO employee VALUES

(201,101,'Ramesh Kumar','Manager','9876500001','ramesh@sbi.com',85000,'2018-05-10','active'),

(202,101,'Priya Sharma','Cashier','9876500002','priya@sbi.com',45000,'2020-03-12','active'),

(203,102,'Arun Raj','Officer','9876500003','arun@sbi.com',55000,'2019-08-22','active');

INSERT INTO customer VALUES

(301,'Bharathkumar','Y','2004-11-15','male','9344431932','bharath@gmail.com','Tiruppur','Student',300000,'2024-01-15','active'),

(302,'Rahul','Sharma','1998-05-12','male','9876543201','rahul@gmail.com','Coimbatore','Engineer',700000,'2023-03-10','active'),

(303,'Anitha','R','1999-08-20','female','9876543202','anitha@gmail.com','Chennai','Teacher',500000,'2022-07-12','active');


INSERT INTO kyc VALUES

(401,301,'Aadhaar','123412341234','verified','2024-01-20'),

(402,302,'PAN','ABCDE1234F','verified','2023-03-15'),

(403,303,'Passport','P9876543','pending',NULL);


INSERT INTO nominee VALUES

(501,301,'Kumar','Father','1978-10-10','9876543101'),

(502,302,'Meena','Mother','1975-05-05','9876543102'),

(503,303,'Suresh','Brother','1995-06-12','9876543103');


INSERT INTO beneficiary VALUES

(601,301,'Rahul Sharma','987654321098','HDFC Bank','HDFC0001234'),

(602,302,'Anitha R','123456789012','ICICI Bank','ICIC0004567'),

(603,303,'Bharathkumar Y','112233445566','SBI','SBIN0001234');


INSERT INTO account_type VALUES

(1,'Savings','Savings Account',1000,3.5),

(2,'Current','Current Account',5000,0),

(3,'Salary','Salary Account',0,3.0);


INSERT INTO account VALUES

(701,'123456789012',301,101,1,'2024-01-25','active',50000,50000,1000,'2026-07-25 10:30:00',201,NULL),

(702,'123456789013',302,101,2,'2023-05-10','active',120000,120000,5000,'2026-07-24 11:20:00',202,NULL),

(703,'123456789014',303,102,1,'2022-07-20','active',80000,80000,1000,'2026-07-23 09:15:00',203,NULL);




INSERT INTO debit_card VALUES
(801,701,'1111222233334444','123','HASH123','2024-01-26','2029-01-25','active'),

(802,702,'1111222233335555','456','HASH456','2023-05-11','2028-05-10','active'),

(803,703,'1111222233336666','789','HASH789','2022-07-21','2027-07-20','active');



INSERT INTO credit_card VALUES
(901,701,'5555666677778888',100000,25000,12.50,'2024-02-01','2029-01-31','active'),

(902,702,'5555666677779999',200000,50000,13.00,'2023-06-01','2028-05-31','active'),

(903,703,'5555666677770000',150000,10000,11.50,'2022-08-01','2027-07-31','active');



INSERT INTO atm_card VALUES
(1001,701,'9999888877776666','HASH111','2024-01-26','2029-01-25','active'),

(1002,702,'9999888877775555','HASH222','2023-05-11','2028-05-10','active'),

(1003,703,'9999888877774444','HASH333','2022-07-21','2027-07-20','active');


INSERT INTO money_transfer VALUES
(1101,701,702,601,5000,'2026-07-20 10:30:00','TRN001','Success','Rent Payment'),

(1102,702,703,602,10000,'2026-07-21 11:15:00','TRN002','Success','Loan Payment'),

(1103,703,701,603,3000,'2026-07-22 09:45:00','TRN003','Pending','Gift');



INSERT INTO atm_transaction VALUES
(1201,1001,'Withdraw',2000,'2026-07-20 09:00:00','Coimbatore ATM','Success','Cash Withdrawal'),

(1202,1002,'Deposit',5000,'2026-07-21 10:15:00','Chennai ATM','Success','Cash Deposit'),

(1203,1003,'Balance Enquiry',0,'2026-07-22 11:00:00','Bangalore ATM','Success','Balance Check');



INSERT INTO transactions VALUES
(1301,701,'Deposit',10000,'2026-07-20 09:30:00','Cash Deposit','Success','Completed'),

(1302,702,'Withdrawal',5000,'2026-07-21 11:00:00','ATM Withdrawal','Success','Completed'),

(1303,703,'Transfer',3000,'2026-07-22 12:00:00','Online Transfer','Pending','Processing');



INSERT INTO payment VALUES
(1401,1301,701,'Bill',1500,'2026-07-20 10:00:00','PAY001','Razorpay','Success','Electricity Bill'),

(1402,1302,702,'Insurance',3000,'2026-07-21 12:00:00','PAY002','Paytm','Success','Insurance Premium'),

(1403,1303,703,'UPI',500,'2026-07-22 01:00:00','PAY003','PhonePe','Pending','Pending');


INSERT INTO fixed_deposit VALUES
(1501,701,100000,6.50,24,'2025-01-01','2027-01-01',113000,'Active'),

(1502,702,200000,6.75,36,'2024-01-01','2027-01-01',240500,'Active'),

(1503,703,50000,6.00,12,'2026-01-01','2027-01-01',53000,'Active');


INSERT INTO interest_rate
(rate_id, account_type_id, fd_rate, loan_rate, savings_rate, effective_from, effective_to)
VALUES
(1601,1,6.50,9.50,3.50,'2026-01-01',NULL),
(1602,2,6.75,10.00,0.00,'2026-01-01',NULL),
(1603,3,6.25,8.75,3.50,'2026-01-01',NULL);



INSERT INTO loan VALUES
(1701,701,'Home Loan',2000000,8.50,240,'2025-01-01','2045-01-01',17356,'Running'),

(1702,702,'Car Loan',800000,9.00,60,'2024-06-01','2029-06-01',16605,'Running'),

(1703,703,'Education Loan',500000,8.00,84,'2026-01-01','2033-01-01',7791,'Pending');

INSERT INTO loan_payment VALUES
(1801,1701,'2026-07-05',17356,9000,8356,1991000,'Success'),

(1802,1702,'2026-07-06',16605,12000,4605,788000,'Success'),

(1803,1703,'2026-07-07',7791,4000,3791,496000,'Pending');


INSERT INTO account_statement VALUES
(1901,701,'2026-07-01',45000,50000,10000,5000,'2026-07-31 18:00:00'),

(1902,702,'2026-07-01',110000,120000,20000,10000,'2026-07-31 18:00:00'),

(1903,703,'2026-07-01',75000,80000,8000,3000,'2026-07-31 18:00:00');


INSERT INTO bank_locker VALUES
(2001,101,301,'L101','Small',2500,5000,'Occupied'),

(2002,101,302,'L102','Medium',4000,8000,'Occupied'),

(2003,102,303,'L201','Large',6000,10000,'Occupied');


INSERT INTO insurance VALUES
(2101,301,'POL1001','Life',15000,1000000,'2025-01-01','2035-01-01','Active'),

(2102,302,'POL1002','Health',12000,500000,'2024-01-01','2029-01-01','Active'),

(2103,303,'POL1003','Vehicle',8000,300000,'2026-01-01','2027-01-01','Active');


INSERT INTO upi VALUES
(2201,701,'bharath@upi','QR001','9344431932','Active','2026-01-01 10:00:00'),

(2202,702,'rahul@upi','QR002','9876543201','Active','2026-01-02 10:00:00'),

(2203,703,'anitha@upi','QR003','9876543202','Active','2026-01-03 10:00:00');


INSERT INTO cheque_book VALUES
(2301,701,'CB1001','2026-01-10',50,'Issued'),

(2302,702,'CB1002','2026-01-12',50,'Issued'),

(2303,703,'CB1003','2026-01-15',25,'Issued');


INSERT INTO login VALUES
(2401,301,NULL,'bharath','hash123','Customer',TRUE,NULL,NOW()),

(2402,302,NULL,'rahul','hash456','Customer',TRUE,NULL,NOW()),

(2403,NULL,201,'ramesh','hash789','Employee',TRUE,NULL,NOW());



INSERT INTO audit_log VALUES
(2501,301,'Login',NOW(),'login','2401',NULL,'User Logged In','192.168.1.10'),

(2502,201,'Created Account',NOW(),'account','701',NULL,'New Account Created','192.168.1.20'),

(2503,302,'Money Transfer',NOW(),'money_transfer','1101',NULL,'Transferred ₹5000','192.168.1.30');



INSERT INTO notification VALUES
(2601,301,'Alert','Transaction Alert',
'₹5000 transferred successfully',
NOW(),FALSE),

(2602,302,'Reminder','Loan EMI',
'Your EMI is due tomorrow',
NOW(),FALSE),

(2603,303,'Message','Welcome',
'Welcome to our Bank',
NOW(),TRUE);