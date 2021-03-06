-- ------------------------------------------------------
-- Boat Rental Schema - SQL:
-- ------------------------------------------------------
-- ------------------------------------------------------
-- DDL for Table BOAT
-- ------------------------------------------------------

CREATE TABLE Boat (
   BoatID          NUMBER NOT NULL,
   BoatType        VARCHAR(20),
   BoatSize        VARCHAR(10),
   BoatColor       VARCHAR(20),
   PriceRate       NUMBER,
   BoatCapacity    NUMBER,
   BoatQuantity    NUMBER,
   CONSTRAINT      pk_boat
   PRIMARY KEY     (BoatID)
);
-- ------------------------------------------------------
-- DDL for Table RENTALORDER
-- ------------------------------------------------------

CREATE TABLE RentalOrder (
   OrderID          NUMBER NOT NULL,
   CustomerID       NUMBER,
   OrderDate        DATE,
   RentalPeriod     VARCHAR(10),
   RentalStatus     VARCHAR(20),
   NumberOfPeople   NUMBER,
   CONSTRAINT       pk_rentalorder
   PRIMARY KEY      (OrderID)
);
-- ------------------------------------------------------
-- DDL for Table PAYMENT
-- ------------------------------------------------------

CREATE TABLE Payment (
   PaymentID           NUMBER NOT NULL,
   OrderID             NUMBER,
   PaymentMethod       VARCHAR(20),
   PaymentStatus       VARCHAR(20),
   DiscountRate        NUMBER,
   isDeposit           NUMBER,
   FinalPrice          NUMBER,
   CONSTRAINT          pk_payment
   PRIMARY KEY         (PaymentID)
);
-- ------------------------------------------------------
-- DDL for Table CUSTOMER
-- ------------------------------------------------------

CREATE TABLE Customer (
   CustomerID        NUMBER NOT NULL,
   GovernmentID      NUMBER,
   PhoneNumber       NUMBER,
   Email             VARCHAR(50),
   SafetyCourseTaken VARCHAR(3),
   CustomerRole      VARCHAR(20),
   CONSTRAINT        pk_customer
   PRIMARY KEY       (CustomerID)
);
-- ------------------------------------------------------
-- DDL for Table STAFFMEMBER
-- ------------------------------------------------------

CREATE TABLE StaffMember (
   StaffMemberID    NUMBER NOT NULL,
   FirstName        VARCHAR(30),
   LastName         VARCHAR(30),
   StaffMemberRole  VARCHAR(20),
   Street           VARCHAR(50),
   City             VARCHAR(50),
   State            VARCHAR(50),
   ZipCode          VARCHAR(10),
   DateOfBirth      DATE,
   PhoneNumber      NUMBER,
   CustomerID       NUMBER,
   CONSTRAINT       pk_staffmember
   PRIMARY KEY      (StaffMemberID)
);
-- ------------------------------------------------------
-- DDL for Table GOV
-- ------------------------------------------------------

CREATE TABLE Gov (
   GovernmentID  NUMBER NOT NULL,
   FirstName     VARCHAR(30),
   LastName      VARCHAR(30),
   DateOfBirth   DATE,
   Street        VARCHAR(50),
   City          VARCHAR(50),
   State         VARCHAR(50),
   ZipCode       VARCHAR(10),
   CONSTRAINT    pk_gov
   PRIMARY KEY   (GovernmentID)
);
-- ------------------------------------------------------
-- DDL for Table ORDER_BOAT
-- ------------------------------------------------------

CREATE TABLE Order_Boat (
   OrderID      NUMBER NOT NULL,
   BoatID       NUMBER NOT NULL,
   CONSTRAINT   pk_order_boat
   PRIMARY KEY  (OrderID, BoatID)
);
-- ------------------------------------------------------
-- Contraints for Table CUSTOMER
-- ------------------------------------------------------

ALTER TABLE Customer
   ADD CONSTRAINT fk_Customer_Gov
     FOREIGN KEY (GovernmentID) 
        REFERENCES Gov (GovernmentID)
-- ------------------------------------------------------
-- Contraints for Table STAFFMEMBER
-- ------------------------------------------------------

ALTER TABLE StaffMember 
 ADD CONSTRAINT fk_StaffMember_Customer
     FOREIGN KEY (CustomerID) 
        REFERENCES Customer (CustomerID)
-- ------------------------------------------------------
-- Contraints for Table ORDER_BOAT
-- ------------------------------------------------------

ALTER TABLE Order_Boat
   ADD CONSTRAINT fk_Order_Boat_RentalOrder
     FOREIGN KEY (OrderID) 
        REFERENCES RentalOrder (OrderID)
-- ------------------------------------------------------
-- Ref Contraints for Table ORDER_BOAT
-- ------------------------------------------------------

ALTER TABLE Order_Boat
   ADD CONSTRAINT fk_Order_Boat_Boat
     FOREIGN KEY (BoatID) 
        REFERENCES Boat (BoatID)
-- ------------------------------------------------------
-- Contraints for Table PAYMENT
-- ------------------------------------------------------

ALTER TABLE Payment
   ADD CONSTRAINT fk_Payment_RentalOrder
     FOREIGN KEY (OrderID) 
        REFERENCES RentalOrder (OrderID)
-- ------------------------------------------------------
-- Contraints for Table RENTALORDER
-- ------------------------------------------------------

ALTER TABLE RentalOrder
   ADD CONSTRAINT fk_RentalOrder_Customer
     FOREIGN KEY (CustomerID) 
        REFERENCES Customer (CustomerID)
-- ------------------------------------------------------
-- INSERTING into BOAT
-- ------------------------------------------------------

INSERT INTO Boat VALUES (3401, 'BR10 Racer Extended Walk Thru Boat', "18' - 22'", 'Blue', 65, 5, 2);
INSERT INTO Boat VALUES (3402, 'BR20 Fishing Walk Thru Boat', "20' - 24'", 'White', 70, 5, 3);
INSERT INTO Boat VALUES (3403, 'BR30 Sport SS Extended Walk Thru Boat', "18' - 22'", 'Red', 65, 8, 3);
INSERT INTO Boat VALUES (3404, 'BR40 Ultra Fish & Cruise Boat', "20' - 24'", "Black/Gray", 70, 6, 3);
INSERT INTO Boat VALUES (3405, 'BR50 Deck Boat', "20' - 24'", 'Green', 70, 4, 2);
INSERT INTO Boat VALUES (3406, 'BR11 Racer Extended Walk Thru Boat XL', "22' - 26'", 'White', 100, 10, 3);
INSERT INTO Boat VALUES (3407, 'BR21 Fishing Walk Thru Boat XL', "24' - 28'", 'Blue', 110, 10, 3);
INSERT INTO Boat VALUES (3408, 'BR31 Sport SS Extended Walk Thru Boat XL', "22' - 26'", 'Red', 105, 12, 4);
INSERT INTO Boat VALUES (3409, 'BR41 Ultra Fish & Cruise Boat XL', "24' - 28'", 'Gray', 105, 12, 4);
INSERT INTO Boat VALUES (3410, 'BR32 Sport SS Conversation Lounge Boat', "24' - 28'", 'White', 100, 6, 3);
-- ------------------------------------------------------
-- INSERTING into GOV
-- ------------------------------------------------------

INSERT INTO Gov VALUES (3301, 'Eunbi', 'Kwon', '09/27/1995', '404 Prairie Rd', 'Sycamore', 'IL', '60178');
INSERT INTO Gov VALUES (3302, 'Sakura', 'Miyawaki', '03/19/1998', '109 Hagen Dr', 'Burbank', 'CA', '91501');
INSERT INTO Gov VALUES (3303, 'Hyewon', 'Kang', '07/05/1999', '494 Crane Cir', 'Boise', 'ID', '83703');
INSERT INTO Gov VALUES (3304, 'Yena', 'Choi', '09/29/1999', '9003 Lincoln Hwy', 'Portsmouth', 'NH', '00215');
INSERT INTO Gov VALUES (3305, 'Chaeyeon', 'Lee', '01/11/2000', '124 Timber Ln', 'Denver', 'CO', '80201');
INSERT INTO Gov VALUES (3306, 'Chaewon', 'Kim', '08/01/2000', '33 Kimberly Dr', 'Stonington', 'ME', '04681');
INSERT INTO Gov VALUES (3307, 'Minjoo', 'Kim', '02/05/2001', '981 Ridge Rd', 'Cheyenne', 'WY', '82001');
INSERT INTO Gov VALUES (3308, 'Nako', 'Yabuki', '06/18/2001', '4 Spring St', 'Madison', 'WI', '53701');
INSERT INTO Gov VALUES (3309, 'Hitomi', 'Honda', '02/06/2001', '99 Charles PI', 'DeKalb', 'IL', '60115');
INSERT INTO Gov VALUES (3310, 'Yuri', 'Jo', '04/22/2001', '199 16th St', 'Denver', 'CO', '80201');
-- ------------------------------------------------------
-- INSERTING into CUSTOMER
-- ------------------------------------------------------

INSERT INTO Customer VALUES (001, 3301, 8151234567, "gs@upllink.com", 'Yes', 'Customer');
INSERT INTO Customer VALUES (002, 3302, 8184578989, "rg@email.com", 'Yes', 'Customer');
INSERT INTO Customer VALUES (003, 3303, 2081459898, "ws@prof.edu", 'Yes', 'Customer');
INSERT INTO Customer VALUES (004, 3304, 6038987412, "jh@snow.com", 'Yes', 'Customer');
INSERT INTO Customer VALUES (005, 3305, 3035899865, "sp@uplink.com", 'Yes', 'Customer');
INSERT INTO Customer VALUES (006, 3306, 2078742356, "sp@oal.com", 'Yes', 'Customer');
INSERT INTO Customer VALUES (007, 3307, 3079865879, "ap@uplink.com", 'Yes', 'Customer');
INSERT INTO Customer VALUES (008, 3308, 6081545698, "tk@oal.com", 'Yes', 'Customer');
INSERT INTO Customer VALUES (009, 3309, 8155545568, "sk@uplink.com", 'Yes', 'Customer');
INSERT INTO Customer VALUES (010, 3310, 3035589865, "ph@geo.com", 'Yes', 'Customer');
-- ------------------------------------------------------
-- INSERTING into STAFFMEMBER
-- ------------------------------------------------------

INSERT INTO StaffMember VALUES (1101, "Suho", "Kim", "President", "8349 El Dorado Lane", "Hanover Park", "IL", "60133", "05/22/1991", 6937594756, NULL);
INSERT INTO StaffMember VALUES (1102, "Xiumin", "Kim", "Manager", "967 Glen Eagles Ave", "Sumter", "SC", "29150", "03/26/1990", 3464373535, 002);
INSERT INTO StaffMember VALUES (1103, "Lay", "Zhang", "Manager", "49 East Holly Court", "Clarksburg", "WV", "26301", "10/07/1991", 7545635642, 003);
INSERT INTO StaffMember VALUES (1104, "Baekhyun", "Byun", "Staff", "5 High Lane", "Watertown", "MA", "02472", "05/06/1992", 3463467809, 004);
INSERT INTO StaffMember VALUES (1105, "Chen", "Kim", "Staff", "884 Hamilton Court", "Westerville", "OH", "43081", "09/21/1992", 5478965156, 005);
INSERT INTO StaffMember VALUES (1106, "Chanyeol", "Park", "Staff", "591 Primrose Drive", "Wayne", "NJ", "07470", "11/27/1992", 8749651287, 006);
INSERT INTO StaffMember VALUES (1107, "Kyung Soo", "Do", "Staff", "350 Plumb Branch Drive", "Port Huron", "MI", "48060", "01/12/1993", 9871543248, 007);
INSERT INTO StaffMember VALUES (1108, "Sehun", "Oh", "Staff", "9971 W. Acacia Ave", "Forney", "TX", "75126", "04/12/1994", 9871426588, 008);
INSERT INTO StaffMember VALUES (1109, "Kris", "Wu", "Staff", "157 Maple Lane", "Adrian", "MI", "49221", "11/06/1990", 3165489651, 009);
INSERT INTO StaffMember VALUES (1110, "Zitao", "Huang", "Staff", "Hartford St.", "Front Royal", "VA", "22630", "05/02/1993", 9182457121, 010);
INSERT INTO StaffMember VALUES (1111, "Han", "Lu", "Staff", "Benson St.", "Vancity", "VA", "23631", "04/20/1990", 5473637424,001);
-- ------------------------------------------------------
-- INSERTING into RENTALORDER
-- ------------------------------------------------------

INSERT INTO RentalOrder VALUES (9901, 001, "05/05/2019", "5 hours", "Available", 3);
INSERT INTO RentalOrder VALUES (9902, 002, "05/05/2019", "2 hours", "Available", 4);
INSERT INTO RentalOrder VALUES (9903, 003, "05/06/2019", "4 hours", "Available", 6);
INSERT INTO RentalOrder VALUES (9904, 004, "05/06/2019", "8 hours", "Available", 8);
INSERT INTO RentalOrder VALUES (9905, 005, "05/07/2019", "6 hours", "Available", 5);
INSERT INTO RentalOrder VALUES (9906, 006, "05/07/2019", "7 hours", "Available", 6);
INSERT INTO RentalOrder VALUES (9907, 007, "05/07/2019", "5 hours", "Available", 4);
INSERT INTO RentalOrder VALUES (9908, 008, "05/08/2019", "4 hours", "Available", 8);
INSERT INTO RentalOrder VALUES (9909, 009, "05/10/2019", "5 hours", "Available", 11);
INSERT INTO RentalOrder VALUES (9910, 010, "05/12/2019", "6 hours", "Available", 9);
-- ------------------------------------------------------
-- INSERTING into ORDER_BOAT
-- ------------------------------------------------------

INSERT INTO Order_Boat VALUES (9901, 3401);
INSERT INTO Order_Boat VALUES (9902, 3401);
INSERT INTO Order_Boat VALUES (9903, 3403);
INSERT INTO Order_Boat VALUES (9904, 3406);
INSERT INTO Order_Boat VALUES (9905, 3410);
INSERT INTO Order_Boat VALUES (9906, 3406);
INSERT INTO Order_Boat VALUES (9907, 3402);
INSERT INTO Order_Boat VALUES (9908, 3408);
INSERT INTO Order_Boat VALUES (9909, 3409);
INSERT INTO Order_Boat VALUES (9910, 3408);
-- ------------------------------------------------------
-- INSERTING into PAYMENT
-- ------------------------------------------------------

INSERT INTO Payment VALUES (8801, 9901, "Credit Card", "Paid", 0, 50, 325);
INSERT INTO Payment VALUES (8802, 9902, "Credit Card", "Paid", 0, 50, 140);
INSERT INTO Payment VALUES (8803, 9903, "Cash", "Unpaid", .1, 50, 234);
INSERT INTO Payment VALUES (8804, 9904, "Credit Card", "Paid", 0, 50, 560);
INSERT INTO Payment VALUES (8805, 9905, "Cash", "Unpaid", .1, 50, 378);
INSERT INTO Payment VALUES (8806, 9906, "Credit Card", "Paid", 0, 50, 700);
INSERT INTO Payment VALUES (8807, 9907, "Credit Card", "Paid", 0, 50, 550);
INSERT INTO Payment VALUES (8808, 9908, "Cash", "Unpaid", .1, 50, 378);
INSERT INTO Payment VALUES (8809, 9909, "Credit Card", "Paid", 0, 50, 525);
INSERT INTO Payment VALUES (8810, 9910, "Credit Card", "Paid", 0, 50, 600);
-- ---------------------------------------------------------------
-- VBA for capitalization of Customer's Name in Customers Form
-- ---------------------------------------------------------------

Private Sub FirstName_AfterUpdate()
	FirstName = StrConv(FirstName, vbProperCase)
End Sub
Private Sub LastName_AfterUpdate()
	LastName = StrConv(LastName, vbProperCase)
End Sub
-- -------------------------------------------------------------------
-- VBA for checking if the boat and/or ID has already existed or not
-- ------------------------------------------------------------------

Private Sub BoatID_AfterUpdate()

Dim NewBoat As String
Dim stLinkCriteria As String

NewBoat = Me.BoatID.Value
stLinkCriteria = "[BoatID] = " & NewBoat

If Me.BoatID = DLookup("[BoatID]", "boat", _ stLinkCriteria) Then
MsgBox ("This boat ID already exists.")
End If

End Sub
-- -------------------------------------------------------------------
-- Query for CUSTOMER RESERVATION
-- ------------------------------------------------------------------
SELECT g.FirstName, g.LastName, c.PhoneNumber, c.Email, 
	r.OrderDate, r.RentalPeriod, r.NumberOfPeople, 
	b.BoatType, b.BoatColor  
FROM (((Gov g INNER JOIN Customer c
                  ON g.GovernmentID = c.GovernmentID)
               	INNER JOIN RentalOrder r
                  ON r.CustomerID=c.CustomerID)
                INNER JOIN Order_Boat ob
                  ON ob.OrderID = r.OrderID)
               	INNER JOIN Boat b
                  ON b.BoatID = ob.BoatID
-- -------------------------------------------------------------------
-- Query for Emailing Customer has not made payments
-- ------------------------------------------------------------------

SELECT "Dear " &  g.FirstName & ": Your Order  #" & p.OrderID & " is not completed because you have not made your payment at" &" $ " &p.FinalPrice& ". Please complete your payment to reserve your boat." AS Email_Message
FROM ((Gov g INNER JOIN Customer c 
                ON g.GovernmentID = c.GovernmentID)
             INNER JOIN RentalOrder r 
                ON r.CustomerID=c.CustomerID)
             INNER JOIN Payment p 
                ON p.OrderID = r.OrderID
WHERE 	p.PaymentStatus ="Unpaid";
-- -------------------------------------------------------------------
-- Query for MIDWEST CUSTOMER
-- ------------------------------------------------------------------

SELECT FirstName, LastName, State
FROM Gov
WHERE State IN ('IL','WY','ID','WI','CO');
-- -------------------------------------------------------------------------
-- Query for Number of Boats Needed for Each Order and Available Remainings
-- -------------------------------------------------------------------------

SELECT r.OrderID, r.NumberOfPeople, b.BoatCapacity, 
Format( (r.NumberOfPeople/b.BoatCapacity) , "0") 
AS Number_Of_Boat_Needed, 
  Format(b.BoatQuantity-(r.NumberOfPeople/b.BoatCapacity), "0") 
       AS Number_Of_Boat_Left
FROM (RentalOrder r INNER JOIN Order_Boat ob
                        ON ob.OrderID =r.OrderID)
                    INNER JOIN Boat b
                        ON b.BoatID = ob.BoatID
-- -------------------------------------------------------------------------
-- Query for Order Assisted by Manager
-- -------------------------------------------------------------------------

SELECT r.OrderID, g.FirstName, g.LastName, s.StaffMemberRole 
AS     Assisted_By
FROM   ((Gov g INNER JOIN Customer c
                    ON g.GovernmentID = c.GovernmentID)
               INNER JOIN StaffMember s
                    ON s.CustomerID=c.CustomerID)
               INNER JOIN RentalOrder 
                    ON c.CustomerID= r.CustomerID
WHERE s.StaffMemberRole ='Manager'
-- -------------------------------------------------------------------------
-- Query for Revenue
-- -------------------------------------------------------------------------

SELECT SUM(FinalPrice) AS Revenue
FROM Payment
WHERE PaymentStatus ="Paid"
