select 'Address' "Table", case when count(*) = 2237 then 1 else 0 end "Is correct"
from Address
union
select 'City', case when count(*) = 2000 then 1 else 0 end
from City
union
select 'Client', case when count(*) = 2237 then 1 else 0 end
from Client
union
select 'Color', case when count(*) = 17 then 1 else 0 end
from Color
union
SELECT 'ConsoleProducer', case when count(*) = 37 then 1 else 0 end
FROM Consoleproducer
union
select 'Country', case when count(*) = 55 then 1 else 0 end
from Country
union
select 'District', case when count(*) = 265 then 1 else 0 end
from District
union
select 'GameGenre', case when count(*) = 13 then 1 else 0 end
from GameGenre
union
SELECT 'Invoice', case when count(*) = 20084 then 1 else 0 end
FROM Invoice
union
SELECT 'MonitorProducer', case when count(*) = 40 then 1 else 0 end
FROM MonitorProducer
union
select 'Order', case when count(*) = 200000 then 1 else 0 end
from "ORDER"
union
select 'OrderDetails', case when count(*) = 200000 then 1 else 0 end
from ORDERDETAILS
union
select 'OrderStatus', case when count(*) = 7 then 1 else 0 end
from OrderStatus
union
select 'Payment', case when count(*) = 100202 then 1 else 0 end
from PAYMENT
union
select 'Product', case when count(*) = 6348 then 1 else 0 end
from Product
union
select 'ProductType', case when count(*) = 3 then 1 else 0 end
from ProductType
union
SELECT 'Review', case when count(*) = 162986 then 1 else 0 end
FROM Review
union
select 'TypeOfPayment', case when count(*) = 6 then 1 else 0 end
from TypeOfPayment