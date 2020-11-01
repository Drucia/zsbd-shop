# Order

## Submission 
- jakiekolwiek
## ReciptDate
-  późniejsze lub takie samo co SubmisionDate
- takie samo jak Payment.ExecutionDate
## Paid
- Jeżeli jest Payment(PaymentID nie jest nullem) to ma być na true/1
## ShippingDate
- późniejsze lub takie samo co SubmisionDate i ReciptDate 
## DeliveryDate
-  późniejsze lub takie samo co SubmisionDate i ReciptDate i ShippingDate
## PaymentID
- unikatowe

# Review
## Content
- Losowe fragmenty txt od 10 do 2500 znaków
## CreateDate 
- Jakiekolwiek
## Bought
- Jeżeli istnieje OrderDetail gdzie OrderDetail.OrderID wskazuje na Order.OrderID w którym Order.ClientID==Review.ClientID & OrderDetails.ProductID = Review.ProductID

# Invoice
## CreatedDate
- mniejsze niż Order.ReceiptDate
## Netto | Vat
- Netto + Netto * Vat / 100 = Payment.Cost


