from random import randrange
import random
import time

used_payment_numbers = set()
banknames = ["Santander", "BZWBK", "PKO", "ING",
"Allahabad Bank",
"Andhra Bank",
"Axis Bank",
"Bank of Bahrain and Kuwait",
"Bank of Baroda - Corporate Banking",
"Bank of Baroda - Retail Banking",
"Bank of India",
"Bank of Maharashtra",
"Canara Bank",
"Central Bank of India",
"City Union Bank",
"Corporation Bank",
"Deutsche Bank",
"Development Credit Bank",
"Dhanlaxmi Bank",
"Federal Bank",
"ICICI Bank",
"IDBI Bank",
"Indian Bank",
"Indian Overseas Bank",
"IndusInd Bank",
"ING Vysya Bank",
"Jammu and Kashmir Bank",
"Karnataka Bank Ltd",
"Karur Vysya Bank",
"Kotak Bank",
"Laxmi Vilas Bank",
"Oriental Bank of Commerce",
"Punjab National Bank - Corporate Banking",
"Punjab National Bank - Retail Banking",
"Punjab & Sind Bank",
"Shamrao Vitthal Co-operative Bank",
"South Indian Bank",
"State Bank of Bikaner & Jaipur",
"State Bank of Hyderabad",
"State Bank of India",
"State Bank of Mysore",
"State Bank of Patiala",
"State Bank of Travancore",
"Syndicate Bank",
"Tamilnad Mercantile Bank Ltd.",
"UCO Bank",
"Union Bank of India",
"United Bank of India",
"Vijaya Bank",
"Yes Bank Ltd"]

VAT = str(23)
PAYMENTS = 100202

def getCreateDate(paymentid):
    return '(Select EXECUTIONDATE from payment where paymentid = ' + str(paymentid) + ")"

def getRandomInvoices():
    payment_id = random.randint(1, PAYMENTS)

    while(payment_id in used_payment_numbers):
        payment_id = random.randint(1, PAYMENTS)

    used_payment_numbers.add(payment_id)

    return str(getCreateDate(payment_id)) + ", " + VAT + ", '" + random.choice(list(banknames)) + "', " + str(payment_id)


with open('Invoice.sql', 'w') as file:
       for x in range(30000):
         file.write('INSERT INTO INVOICE (CREATEDATE, VAT, BANKNAME, PAYMENTID) VALUES (' + getRandomInvoices() + ');\n')