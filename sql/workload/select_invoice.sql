Select
    i.InvoiceID
from
    INVOICE i
    JOIN PAYMENT p on i.PaymentID = p.PaymentID
    JOIN Order o on p.PaymentID = o.PaymentID
where
    o.Paid = 0
HAVING
    AVG(p.Cost) < (
        Select
            SUM(O.Quantity * P.CurrentPrice) as 'price'
        From
            OrderDetails O,
            Product P
        where
            O.ProductID = P.ProductID
            and OrderDetails.ID = o.OrderDetailsID
    )