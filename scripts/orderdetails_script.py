from random import randrange
import random

def getRandomOrderDetails(orderid):
    quantity = random.randint(1, 10)
    productid = random.randint(1, 6348)
    return str(quantity) + ", " + str(orderid) + ", " + str(productid)


with open('OrderDetails.sql', 'w') as file:
       for x in range(200000):
         file.write('INSERT INTO ORDERDETAILS (QUANTITY, ORDERID, PRODUCTID) VALUES (' + getRandomOrderDetails(x+1) + ');\n')