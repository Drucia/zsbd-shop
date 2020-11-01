UPDATE Review 
SET Bought = 1
FROM Review r
JOIN Product p
ON
r.ProductID = p.ProductID
JOIN Client c
on r.ClientID = c.ClientID
JOIN Order o
on o.clientID = c.ClientID
Join OrderDetails d
on o.OrderID = d.OrderID
WHERE d.ProductID = r.ProductID and o.ClientID = r.ClientID;