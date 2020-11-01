import random
from random import randrange
import time

def generateBankAccount(TYPEOFPAYMENTID):
  bankAccount = ""
  if TYPEOFPAYMENTID == 6:
    return "null"
  else:
    for x in range(26):
      number = random.randint(0,9)
      bankAccount += str(number)
  return str(bankAccount)

EXECUTIONDATE = 'Select RECEIPTDATE from "Order" INNER JOIN "Order" ON "Order".paymentid = payment.paymentID;'

CONFIRMED = 'Select PAID from "Order" INNER JOIN "Order" ON "Order".paymentid = payment.paymentID;'

TYPEOFPAYMENTID = random.randint(1,6)

ACCOUNTNUMBER = generateBankAccount(TYPEOFPAYMENTID)

CURRENTPRICE = '(SELECT CurrentPrice FROM Product AS pr Inner Join OrderDetails AS od ON pr.ProductID = od.ProductID Inner Join Order AS o ON od.OrderID = o.OrderID Inner Join  On o.OrderID = pa.OrderID)'

QUANTITY = 'SELECT QUANTITY FROM ORDERDETAIL AS od INNER JOIN '

def getExecutionDate(paymentid):
  return '(Select RECEIPTDATE + (1/1440 * dbms_random.value(0, 14*24*60)) from "ORDER" where paymentid = ' + str(paymentid) + ")"

def getConfirmed(paymentid):
  return '(Select PAID from "ORDER" WHERE paymentID = ' + str(paymentid) + ')'

def getCost(paymentid):
  return '(SELECT SUM(P.CurrentPrice * OD.QUANTITY) FROM ORDERDETAILS OD JOIN PRODUCT P ON OD.PRODUCTID = P.PRODUCTID WHERE OD.ORDERID = ' + '(SELECT ORDERID FROM "ORDER" WHERE PAYMENTID = ' + str(paymentid) + '))'

def str_time_prop(start, end, format):
  stime = time.mktime(time.strptime(start, format))
  etime = time.mktime(time.strptime(end, format))
  return time.strftime(format, time.localtime(randrange(stime, etime)))

def random_date(start, end):
    return str_time_prop(start, end, '%Y-%m-%d %I:%M:%S')

def getPayment(paymentid):
  type_of_payment = random.randint(1,6)
  account_number = generateBankAccount(type_of_payment)
  return getCost(paymentid) + ", " + account_number + ", " + getConfirmed(paymentid) + ", " + getExecutionDate(paymentid) + ", " + str(type_of_payment)

with open('Payment.sql', 'w') as file:
      #  for x in range(160000):
      for x in range(100202):
        file.write("INSERT INTO PAYMENT (COST,ACCOUNTNUMBER,CONFIRMED,EXECUTIONDATE,TYPEOFPAYMENTID) VALUES ( "+ getPayment(x+1) + ");\n")



# INSERT INTO PAYMENT (ACCOUNTNUMBER,TYPEOFPAYMENTID)
# VALUES (generateBankAccount(TYPEOFPAYMENTID),TYPEOFPAYMENTID);