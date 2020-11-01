from random import randrange
import random
import time

paymentDoneStatus = [1, 3, 4]
paymentPendingSatatus = [2, 5, 6, 7]
current_paymentid = 0


def generatePaymentID(paid):
  global current_paymentid
  
  if paid == True and current_paymentid <= 160000:
    current_paymentid += 1
    return current_paymentid
  else:
    return "null"

def generateOrderStatus(paid):
  if paid == True:
    return random.choice(list(paymentDoneStatus))
  else:
    return random.choice(list(paymentPendingSatatus))

def generateDeliveryDate(orderStatusID, shippingDate, etime, format):
  if orderStatusID == 4:
    shippingDateS = time.mktime(time.strptime(shippingDate, format))
    return time.strftime(format, time.localtime(randrange(shippingDateS, etime)))
  else:
    return "null"

def generateShippingDate(orderStatusID, reciptDate, etime, format):
  if orderStatusID == 4 or orderStatusID == 3:
    reciptDateS = time.mktime(time.strptime(reciptDate, format))
    return time.strftime(format, time.localtime(randrange(reciptDateS, etime)))
  else:
    return "null"

def generateReciptDate(orderStatusID, submissionDate, etime, format):
  if orderStatusID == 4 or orderStatusID == 3:
    submissionDateS = time.mktime(time.strptime(submissionDate, format))
    return time.strftime(format, time.localtime(randrange(submissionDateS, etime)))
  else:
    return "null"

def change_to_sql_format(date):
  if (date == "null"): 
    return date
  else:
    return "'" + date + "'"

def str_time_prop(start, end, format):
  paid = random.getrandbits(1)
  paymentID = generatePaymentID(paid)
  orderStatusID = generateOrderStatus(paid)

  stime = time.mktime(time.strptime(start, format))
  etime = time.mktime(time.strptime(end, format))

  submissionDate = time.strftime(format, time.localtime(randrange(stime, etime)))

  reciptDate = generateReciptDate(orderStatusID, submissionDate, etime, format)

  shippingDate = generateShippingDate(orderStatusID, reciptDate, etime, format)

  deliveryDate = generateDeliveryDate(orderStatusID, shippingDate, etime, format)
  
  addressID = random.randint(1,2237)
  clientID = random.randint(1,2237)

  return (change_to_sql_format(submissionDate) + "," + change_to_sql_format(reciptDate) + "," + str(paid) + "," + change_to_sql_format(shippingDate) + "," + change_to_sql_format(deliveryDate) + "," +  str(paymentID) + "," + str(addressID) + "," + str(clientID) + "," + str(orderStatusID))

def random_date(start, end):
    return str_time_prop(start, end, '%Y-%m-%d %I:%M:%S')

with open('Order.sql', 'w') as file:
       for x in range(200000):
         file.write('INSERT INTO "ORDER" (SUBMISSIONDATE,RECEIPTDATE,PAID,SHIPPINGDATE,DELIVERYDATE,PAYMENTID,ADDRESSID,CLIENTID,ORDERSTATUSID) VALUES (' + random_date("2015-01-01 1:30:00", "2020-10-27 4:50:00") + ');\n')