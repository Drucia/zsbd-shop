ALTER TABLE address
    ADD CONSTRAINT fkaddresscityid FOREIGN KEY ( cityid )
        REFERENCES city ( cityid );

ALTER TABLE address
    ADD CONSTRAINT fkaddresscountryid FOREIGN KEY ( countryid )
        REFERENCES country ( countryid );

ALTER TABLE address
    ADD CONSTRAINT fkaddressdistrictid FOREIGN KEY ( districtid )
        REFERENCES district ( distritid );

ALTER TABLE product
    ADD CONSTRAINT fkproductmonitorproducerid FOREIGN KEY ( monitorproducerid )
        REFERENCES monitorproducer ( monitorproducerid );

ALTER TABLE product
    ADD CONSTRAINT fkproductgamegenreid FOREIGN KEY ( gamegenreid )
        REFERENCES gamegenre ( gamegenreid );

ALTER TABLE product
    ADD CONSTRAINT fkproductconsoleproducerid FOREIGN KEY ( consoleproducerid )
        REFERENCES consoleproducer ( consoleproducerid );

ALTER TABLE product
    ADD CONSTRAINT fkproductcolorid FOREIGN KEY ( colorid )
        REFERENCES color ( colorid );

ALTER TABLE product
    ADD CONSTRAINT fkproductproducttypeid FOREIGN KEY ( producttypeid )
        REFERENCES producttype ( producttypeid );

ALTER TABLE client
    ADD CONSTRAINT fkclientaddressid FOREIGN KEY ( addressid )
        REFERENCES address ( addressid );

ALTER TABLE review
    ADD CONSTRAINT fkreviewclientid FOREIGN KEY ( clientid )
        REFERENCES client ( clientid );

ALTER TABLE review
    ADD CONSTRAINT fkreviewproductid FOREIGN KEY ( productid )
        REFERENCES product ( productid );

ALTER TABLE payment
    ADD CONSTRAINT fkpaymenttypeofpaymentid FOREIGN KEY ( typeofpaymentid )
        REFERENCES typeofpayment ( typeofpaymentid );

ALTER TABLE "ORDER"
    ADD CONSTRAINT fkorderaddressid FOREIGN KEY ( addressid )
        REFERENCES address ( addressid );

ALTER TABLE "ORDER"
    ADD CONSTRAINT fkorderclientid FOREIGN KEY ( clientid )
        REFERENCES client ( clientid );

ALTER TABLE "ORDER"
    ADD CONSTRAINT fkorderorderstatusid FOREIGN KEY ( orderstatusid )
        REFERENCES orderstatus ( orderstatusid );

ALTER TABLE orderdetails
    ADD CONSTRAINT fkorderdetaiorderid FOREIGN KEY ( orderid )
        REFERENCES "ORDER" ( orderid );

ALTER TABLE orderdetails
    ADD CONSTRAINT fkorderdetaiproductid FOREIGN KEY ( productid )
        REFERENCES product ( productid );

ALTER TABLE invoice
    ADD CONSTRAINT fkinvoicepaymentid FOREIGN KEY ( paymentid )
        REFERENCES payment ( paymentid );

ALTER TABLE "ORDER"
    ADD CONSTRAINT fkorderpaymentid FOREIGN KEY ( paymentid )
        REFERENCES payment ( paymentid );



ALTER TABLE review DROP CONSTRAINT fkreviewproductid;

ALTER TABLE review
    ADD CONSTRAINT fkreviewproductid FOREIGN KEY ( productid )
        REFERENCES product ( productid )
            ON DELETE CASCADE;

ALTER TABLE orderdetails DROP CONSTRAINT fkorderdetaiproductid;

ALTER TABLE orderdetails
    ADD CONSTRAINT fkorderdetaiproductid FOREIGN KEY ( productid )
        REFERENCES product ( productid )
            ON DELETE CASCADE;