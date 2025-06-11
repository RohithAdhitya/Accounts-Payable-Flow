CREATE TABLE Supplier (
    SupplierID INT(3) PRIMARY KEY,
    S_NAME VARCHAR(20),
    S_ADDRESS VARCHAR(255),
    S_PHNIO INT(10)
);

CREATE TABLE Invoice (
    CompanyID INT(5),
    SupplierID INT(3),
    UNIT_PRICE DECIMAL(10, 2),
    QTY INT(5),
    INVOICE_DATE DATE,
    DESCRIPTION VARCHAR(50),
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID),
    FOREIGN KEY (CompanyID) REFERENCES Supplier(CompanyID)
);

CREATE TABLE Transport (
    VehicleNumber VARCHAR(10) PRIMARY KEY,
    SupplierID INT(3),
    LOCATION VARCHAR(30),
    STATUS VARCHAR(5),
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID)
);

CREATE TABLE ProductDetails (
    ProductID VARCHAR(3) PRIMARY KEY,
    DESCRIPTION VARCHAR(50),
    UNIT_PRICE DECIMAL(10, 2),
    QTY INT(5),
);

CREATE TABLE Payment (
    PaymentID INT(2) PRIMARY KEY
);

CREATE TABLE Company (
    CompanyID INT(5) PRIMARY KEY,
    C_NAME VARCHAR(20),
    C_ADDRESS VARCHAR(255),
    C_PHNO INT(10)
);

CREATE TABLE PurchaseOrder (
    PurchaseOrderID INT(5) PRIMARY KEY,
    SupplierID INT(3),
    CompanyID INT(5),
    ORDER_DATE DATE,
    QTY INT(5),
    DELIVERY_DATE DATE,
    PaymentID INT(2),
    DESCRIPTION VARCHAR(50),
    UNIT_PRICE DECIMAL(10, 2),
    ProductID INT(3),
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID),
    FOREIGN KEY (CompanyID) REFERENCES Company(CompanyID),
    FOREIGN KEY (PaymentID) REFERENCES Payment(PaymentID),
    FOREIGN KEY (ProductID) REFERENCES ProductDetails(ProductID)
);

CREATE TABLE GRN (
    GRN_ID INT(5) PRIMARY KEY,
    CompanyID INT(5),
    R_NOTE VARCHAR(255),
    QTY INT(3),
    PO_DATE DATE,
    PurchaseOrderID INT(5),
    C_NAME VARCHAR(255),
    DESCRIPTION VARCHAR(255),
    UNIT_PRICE INT(8),
    FOREIGN KEY (CompanyID) REFERENCES Supplier(CompanyID),
    FOREIGN KEY (PurchaseOrderID) REFERENCES PurchaseOrder(PurchaseOrderID)
);

CREATE TABLE Acknowledgement (
    companyID INT(5),
    grnID INT(5),
    PRIMARY KEY (companyID, grnID),
    FOREIGN KEY (companyID) REFERENCES Company(companyID),
    FOREIGN KEY (grnID) REFERENCES GRN(grnID)
);

CREATE TABLE MAKESCID (
    CompanyID INT(5),
    PaymentID INT(2),
    PRIMARY KEY (CompanyID, PaymentID),
    FOREIGN KEY (CompanyID) REFERENCES Company(CompanyID),
    FOREIGN KEY (PaymentID) REFERENCES Payment(PaymentID)
);

CREATE TABLE Cash (
    PaymentID INT(5) PRIMARY KEY,
    cash_details VARCHAR(255),
    FOREIGN KEY (paymentID) REFERENCES Payment(paymentID)
);

CREATE TABLE Cheque (
    PaymentID INT(5) PRIMARY KEY,
    cheque_details VARCHAR(255),
    FOREIGN KEY (paymentID) REFERENCES Payment(paymentID)
);

INSERT COMPANY :

INSERT INTO Company (CompanyID, C_NAME, C_ADDRESS, C_PHNO)
VALUES 
(49217, 'heath infotech', '123 Main St, Apt 4B, Cityville, State 56789', '213-555-7890'),
(76503, 'stephen Construction', '456 Elm St, Suite 302, Townsville, State 12345', '415-789-1234'),
(21856, 'smith tech', '789 Oak Ave, Unit 101, Villagetown, State 67890', '602-345-6789'),
(93470, 'gaby designers', '321 Pine Ln, #205, Hamletville, State 34567', '305-987-6543'),
(60581, 'lura shoppers', '567 Maple Dr, Apt 3C, Boroughburg, State 90123', '408-234-5678'),
(37294, 'phinse medicals', '890 Cedar Blvd, Unit 501, Villageburg, State 45678', '817-876-5432'),
(50628, 'ferb caters', '234 Birch St, Apt 102, Townborough, State 01234', '312-345-6789'),
(18943, 'john cars services', '876 Willow Ave, #304, Citytown, State 56789', '404-890-1234'),
(74025, 'rebecca bakers', '109 Pinehurst Rd, Suite 202, Villageton, State 12345', '786-432-1098'),
(31589, 'afred tech', '543 Redwood Ln, Apt 404, Boroughton, State 67890', '503-678-9012'),
(92647, 'suman mart', '876 Magnolia St, Unit 303, Cityhamlet, State 34567', '415-210-9876'),
(58413, 'Sea shell resturant', '210 Juniper Dr, Apt 201, Villagesville, State 90123', '702-783-4567'),
(20756, 'Biner BBQ', '754 Cedar Ave, #102, Townetown, State 45678', '214-349-8765'),
(89134, 'Zayn Musicals', '328 Birchwood Blvd, Apt 501, Boroughville, State 01234', '713-670-4321'),
(65092, 'Max services', '641 Elmwood Ln, Suite 304, Cityville, State 56789', '305-198-7654'),
(41378, 'Airtel Mobiles', '927 Oakhurst Dr, Apt 203, Villageton, State 12345', '972-432-1098'),
(79562, 'T mobiles', '163 Walnut St, Unit 401, Townborough, State 67890', '281-876-5432'),
(32814, 'Zack Salons', '482 Pinehurst Ave, #101, Hamletburg, State 34567', '503-234-5678'),
(46709, 'Peter Paper Factory', '715 Maple Blvd, Apt 303, Citytown, State 90123', '408-789-0123'),
(58236, “Carl's Infotech”, '839 Redwood Ln, Suite 502, Boroughetown, State 45678', '602-543-2109');


INSERT SUPPLIER:

INSERT INTO Supplier (SupplierID, S_NAME, S_ADDRESS, S_PHNO)
VALUES 
(492, 'Mogan health', '123 Supply Lane, Suite 45, Citytown, ST 56789', '5738914026'),
(765, 'steve mechanics', '456 Industrial Avenue, Unit 12, Manufactureville, ST 12345', '6892041537'),
(218, 'tenesa', '789 Warehouse Street, Building 3, Distribution City, ST 67890', '4152769830'),
(934, 'robert Zane', '321 Logistics Road, Suite 102, Shipmentville, ST 34567', '8201356947'),
(605, 'Jesiica Specter', '567 Manufacturing Blvd, Unit 8, Assemblytown, ST 90123', '3645072189'),
(372, 'Harvard Jones', '890 Export Avenue, Suite 501, Shipmentsburg, ST 45678', '1978245063'),
(506, 'Sam Vishal', '234 Import Lane, Apt 303, Supplier City, ST 01234', '5023891467'),
(189, 'Mary Jane', '876 Wholesale Street, Unit 24, Importtown, ST 56789', '9461372805'),
(740, 'Parker', '109 Distribution Drive, Suite 202, Exportville, ST 12345', '7385610249'),
(315, 'David Tame', '543 Trade Avenue, Apt 404, Shipmentburg, ST 67890', '2810457936'),
(926, 'Freish Jone', '876 Logistics Road, Unit 3, Porttown, ST 34567', '6093285714'),
(584, 'Karla Jestin', '210 Export Blvd, Apt 201, Supplytown, ST 90123', '1547908326'),
(207, 'Vidhya', '754 Import Lane, Suite 102, Deliveryville, ST 45678', '8372645109'),
(891, 'Vamisha', '328 Manufacturing Drive, Apt 501, Importville, ST 01234', '3204987561'),
(650, 'Jeffrey', '641 Distribution Road, Suite 304, Exporttown, ST 56789', '9657132084'),
(413, 'Alisa camdem', '927 Import Blvd, Apt 203, Shipmentton, ST 12345', '4731859260'),
(795, 'sana', '163 Export Avenue, Unit 41, Supplyburg, ST 67890', '5869423017'),
(328, 'Tejesh Medicals', '482 Logistics Lane, Apt 101, Portville, ST 34567', '2013746895'),
(467, 'Siva Krish', '715 Wholesale Street, Suite 303, Shipmenttown, ST 90123', '6940283157'),
(582, 'Krishnan', '839 Distribution Road, Unit 502, Exportburg, ST 45678', '8573164902');


INSERT GRN:

INSERT INTO GRN (PurchaseOrderID, C_NAME, CompanyID, GRN_ID, PO_DATE, ProductID, DESCRIPTION, QTY, UNIT_PRICE, R_NOTE)
VALUES
(10201, 'phinse medicals', 37294, 'G1', '08/01/23', 'S1', 'Luminous Bliss Perfume', 50, 50.00, 'YES'),
(10202, 'lura shoppers', 60581, 'G2', '15/02/23', 'S2', 'TechMaster Pro Headphones', 30, 199.99, 'YES'),
(10203, 'Airtel Mobiles', 41378, 'G3', '22/03/23', 'S3', 'ZenWell Meditation Pillow', 30, 35.00, 'YES'),
(10204, 'Zayn Musicals', 89134, 'G4', '05/04/23', 'S4', 'SwiftGlide Hair Straightener', 15, 89.99, 'NO'),
(10205, 'smith tech', 21856, 'G5', '18/05/23', 'S5', 'EcoHarmony Reusable Water Bottle', 20, 20.00, 'YES'),
(10206, 'stephen Construction', 76503, 'G6', '27/06/23', 'S6', 'AdventureSeeker Backpack', 100, 69.99, 'YES'),
(10207, 'Zack Salons', 32814, 'G7', '10/07/23', 'S7', 'GourmetBlend Coffee Beans', 90, 12.99, 'YES'),
(10208, 'ferb caters', 50628, 'G8', '19/08/23', 'S8', 'HarmonyHome Smart Thermostat', 65, 129.99, 'YES'),
(10209, 'afred tech', 31589, 'G9', '02/09/23', 'S9', 'SereneSleep Bamboo Sheets', 75, 49.99, 'YES'),
(10210, 'Max services', 65092, 'G10', '11/10/23', 'S10', 'FitnessFusion Resistance Bands', 40, 19.99, 'YES'),
(10211, 'phinse medicals', 37294, 'G11', '24/11/23', 'S1', 'Luminous Bliss Perfume', 900, 50.00, 'YES'),
(10212, 'Peter Paper Factory', 46709, 'G12', '03/12/23', 'S2', 'TechMaster Pro Headphones', 100, 199.99, 'YES'),
(10213, 'Biner BBQ', 20756, 'G13', '14/01/23', 'S1', 'Luminous Bliss Perfume', 90, 50.00, 'YES'),
(10214, 'rebecca bakers', 74025, 'G14', '21/02/23', 'S2', 'TechMaster Pro Headphones', 1, 199.99, 'YES'),
(10215, 'suman mart', 92647, 'G15', '09/03/23', 'S3', 'ZenWell Meditation Pillow', 20, 35.00, 'YES'),
(10216, “Carl\'s Infotech'”, 58236, 'G16', '26/04/23', 'S4', 'SwiftGlide Hair Straightener', 30, 89.99, 'YES'),
(10217, 'Sea shell resturant', 58413, 'G17', '15/05/23', 'S5', 'EcoHarmony Reusable Water Bottle', 40, 20.00, 'YES'),
(10218, 'gaby designers', 93470, 'G18', '04/06/23', 'S6', 'AdventureSeeker Backpack', 10, 69.99, 'YES'),
(10219, 'T mobiles', 79562, 'G19', '23/07/23', 'S7', 'GourmetBlend Coffee Beans', 1, 12.99, 'YES'),
(10220, 'heath infotech', 49217, 'G20', '31/08/23', 'S8', 'HarmonyHome Smart Thermostat', 4, 129.99, 'YES'),
(10221, 'john cars services', 18943, 'G21', '05/10/23', 'S3', 'ZenWell Meditation Pillow', 600, 35.00, 'YES'),
(10222, 'john cars services', 18943, 'G22', '12/11/23', 'S4', 'SwiftGlide Hair Straightener', 200, 89.99, 'YES'),
(10223, 'phinse medicals', 37294, 'G23', '23/12/23', 'S5', 'EcoHarmony Reusable Water Bottle', 990, 20.00, 'NO'),
(10224, 'smith tech', 21856, 'G24', '09/01/23', 'S6', 'AdventureSeeker Backpack', 1000, 69.99, 'YES'),
(10225, 'stephen Construction', 76503, 'G25', '14/02/23', 'S7', 'GourmetBlend Coffee Beans', 150, 12.99, 'YES'),
(10226, 'Zack Salons', 32814, 'G26', '21/03/23', 'S8', 'HarmonyHome Smart Thermostat', 100, 129.99, 'YES'),
(10227, 'ferb caters', 50628, 'G27', '06/04/23', 'S9', 'SereneSleep Bamboo Sheets', 10, 49.99, 'YES'),
(10228, 'afred tech', 31589, 'G28', '19/05/23', 'S10', 'FitnessFusion Resistance Bands', 10, 19.99, 'YES'),
(10229, 'Max services', 65092, 'G29', '28/06/23', 'S11', “CulinaryCraft Chef's Knife Set”, 10, 79.99, 'YES'),
(10230, 'phinse medicals', 37294, 'G30', '11/07/23', 'S12', 'Stargazer Telescope Kit', 20, 149.99, 'YES'),
(10231, 'Peter Paper Factory', 46709, 'G31', '11/07/23', 'S13', 'Serenity Spa Candle Collection', 25, 15.00, 'YES'),
(10201, 'phinse medicals', 37294, 'G32', '08/01/23', 'S1', 'Luminous Bliss Perfume', 50, 50.00, 'YES'),
(10203, 'Airtel Mobiles', 41378, 'G33', '22/03/23', 'S3', 'ZenWell Meditation Pillow', 20, 35.00, 'YES'),
(10204, 'Zayn Musicals', 89134, 'G34', '05/04/23', 'S4', 'SwiftGlide Hair Straightener', 15, 89.99, 'YES'),
(10205, 'smith tech', 21856, 'G35', '18/05/23', 'S5', 'EcoHarmony Reusable Water Bottle', 20, 20.00, 'YES'),
(10205, 'smith tech', 21856, 'G36', '18/05/23', 'S5', 'EcoHarmony Reusable Water Bottle', 10, 20.00, 'YES'),
(10206, 'stephen Construction', 76503, 'G37', '27/06/23', 'S6', 'AdventureSeeker Backpack', 50, 69.99, 'YES'),
(10206, 'stephen Construction', 76503, 'G38', '27/06/23', 'S6', 'AdventureSeeker Backpack', 25, 69.99, 'YES'),
(10206, 'stephen Construction', 76503, 'G39', '27/06/23', 'S6', 'AdventureSeeker Backpack', 25, 69.99, 'YES'),
(10210, 'Max services', 65092, 'G40', '11/10/23', 'S10', 'FitnessFusion Resistance Bands', 5, 19.99, 'NO'),
(10211, 'phinse medicals', 37294, 'G41', '24/11/23', 'S1', 'Luminous Bliss Perfume', 100, 50.00, 'YES'),
(10212, 'Peter Paper Factory', 46709, 'G42', '03/12/23', 'S2', 'TechMaster Pro Headphones', 100, 199.99, 'YES'),
(10212, 'Peter Paper Factory', 46709, 'G43', '03/12/23', 'S2', 'TechMaster Pro Headphones', 100, 199.99, 'YES'),
(10212, 'Peter Paper Factory', 46709, 'G44', '03/12/23', 'S2', 'TechMaster Pro Headphones', 100, 199.99, 'YES'),
(10212, 'Peter Paper Factory', 46709, 'G45', '03/12/23', 'S2', 'TechMaster Pro Headphones', 100, 199.99, 'YES'),
(10212, 'Peter Paper Factory', 46709, 'G46', '03/12/23', 'S2', 'TechMaster Pro Headphones', 100, 199.99, 'YES'),
(10212, 'Peter Paper Factory', 46709, 'G47', '03/12/23', 'S2', 'TechMaster Pro Headphones', 100, 199.99, 'YES'),
(10212, 'Peter Paper Factory', 46709, 'G48', '03/12/23', 'S2', 'TechMaster Pro Headphones', 100, 199.99, 'YES'),
(10212, 'Peter Paper Factory', 46709, 'G49', '03/12/23', 'S2', 'TechMaster Pro Headphones', 100, 199.99, 'YES'),
(10212, 'Peter Paper Factory', 46709, 'G50', '03/12/23', 'S2', 'TechMaster Pro Headphones', 100, 199.99, 'YES'),
(10212, 'Peter Paper Factory', 46709, 'G51', '03/12/23', 'S2', 'TechMaster Pro Headphones', 100, 199.99, 'NO'),
(10212, 'Peter Paper Factory', 46709, 'G52', '03/12/23', 'S2', 'TechMaster Pro Headphones', 100, 199.99, 'YES'),
(10222, 'john cars services', 18943, 'G53', '12/11/23', 'S4', 'SwiftGlide Hair Straightener', 200, 89.99, 'YES'),
(10222, 'john cars services', 18943, 'G54', '12/11/23', 'S4', 'SwiftGlide Hair Straightener', 200, 89.99, 'YES'),
(10222, 'john cars services', 18943, 'G55', '12/11/23', 'S4', 'SwiftGlide Hair Straightener', 200, 89.99, 'YES');





INSERT PURCHASEORDER:

INSERT INTO PurchaseOrder (SupplierID, CompanyID, PurchaseOrderID, ORDER_DATE, DELIVERY_DATE, PaymentID, DESCRIPTION, UNIT_PRICE, ProductID, QTY)
VALUES
(492, 37294, 10201, '08/01/23', '20/01/23', 22, 'Luminous Bliss Perfume', 50.00, 'S1', 100),
(207, 60581, 10202, '15/02/23', '28/02/23', 23, 'TechMaster Pro Headphones', 199.99, 'S2', 30),
(891, 41378, 10203, '22/03/23', '05/04/23', 24, 'ZenWell Meditation Pillow', 35.00, 'S3', 50),
(650, 89134, 10204, '05/04/23', '18/04/23', 25, 'SwiftGlide Hair Straightener', 89.99, 'S4', 30),
(413, 21856, 10205, '18/05/23', '01/06/23', 26, 'EcoHarmony Reusable Water Bottle', 20.00, 'S5', 50),
(795, 76503, 10206, '27/06/23', '10/07/23', 27, 'AdventureSeeker Backpack', 69.99, 'S6', 200),
(328, 32814, 10207, '10/07/23', '23/07/23', 28, 'GourmetBlend Coffee Beans', 12.99, 'S7', 90),
(467, 50628, 10208, '19/08/23', '01/09/23', 29, 'HarmonyHome Smart Thermostat', 129.99, 'S8', 65),
(582, 31589, 10209, '02/09/23', '15/09/23', 30, 'SereneSleep Bamboo Sheets', 49.99, 'S9', 75),
(765, 65092, 10210, '11/10/23', '24/10/23', 31, 'FitnessFusion Resistance Bands', 19.99, 'S10', 45),
(218, 37294, 10211, '24/11/23', '07/12/23', 32, 'Luminous Bliss Perfume', 50.00, 'S1', 1000),
(934, 46709, 10212, '03/12/23', '16/12/23', 33, 'TechMaster Pro Headphones', 199.99, 'S2', 1000),
(605, 20756, 10213, '14/01/23', '27/01/23', 34, 'Luminous Bliss Perfume', 50.00, 'S1', 100),
(372, 74025, 10214, '21/02/23', '06/03/23', 35, 'TechMaster Pro Headphones', 199.99, 'S2', 19),
(506, 92647, 10215, '09/03/23', '22/03/23', 36, 'ZenWell Meditation Pillow', 35.00, 'S3', 20),
(189, 58236, 10216, '26/04/23', '09/05/23', 37, 'SwiftGlide Hair Straightener', 89.99, 'S4', 30),
(740, 58413, 10217, '15/05/23', '28/05/23', 38, 'EcoHarmony Reusable Water Bottle', 20.00, 'S5', 40),
(315, 93470, 10218, '04/06/23', '17/06/23', 39, 'AdventureSeeker Backpack', 69.99, 'S6', 10),
(926, 79562, 10219, '23/07/23', '05/08/23', 40, 'GourmetBlend Coffee Beans', 12.99, 'S7', 1),
(584, 49217, 10220, '31/08/23', '13/09/23', 41, 'HarmonyHome Smart Thermostat', 129.99, 'S8', 4),
(891, 18943, 10221, '05/10/23', '20/10/23', 42, 'ZenWell Meditation Pillow', 35.00, 'S3', 600),
(492, 18943, 10222, '12/11/23', '28/11/23', 43, 'SwiftGlide Hair Straightener', 89.99, 'S4', 700),
(795, 37294, 10223, '23/12/23', '05/01/24', 44, 'EcoHarmony Reusable Water Bottle', 20.00, 'S5', 990),
(506, 21856, 10224, '09/01/23', '20/01/23', 45, 'AdventureSeeker Backpack', 69.99, 'S6', 1000),
(650, 76503, 10225, '14/02/23', '28/02/23', 46, 'GourmetBlend Coffee Beans', 12.99, 'S7', 150),
(795, 32814, 10226, '21/03/23', '04/04/23', 47, 'HarmonyHome Smart Thermostat', 129.99, 'S8', 100),
(328, 50628, 10227, '06/04/23', '19/04/23', 48, 'SereneSleep Bamboo Sheets', 49.99, 'S9', 10),
(218, 31589, 10228, '19/05/23', '01/06/23', 49, 'FitnessFusion Resistance Bands', 19.99, 'S10', 10),
(934, 65092, 10229, '28/06/23', '10/07/23', 50, “CulinaryCraft Chef's Knife Set”, 79.99, 'S11', 10),
(506, 37294, 10230, '11/07/23', '23/07/23', 51, 'Stargazer Telescope Kit', 149.99, 'S12', 20),
(605, 46709, 10231, '11/07/23', '23/07/23', 52, 'Serenity Spa Candle Collection', 15.00, 'S13', 25);



INSERT TRANSPORT:

INSERT INTO Transport (VehicleNumber, SupplierID, LOCATION, STATUS)
VALUES
('ABC-123', 492, 'Azure Peaks', 'Yes'),
('XYZ-789', 765, 'Whispering Pines', 'Yes'),
('QWE-456', 218, 'Radiant Meadows', 'No'),
('JKL-987', 934, 'Harmony Haven', 'Yes'),
('MNO-321', 605, 'Celestial Isle', 'No'),
('PQR-654', 372, 'Silver Springs', 'Yes'),
('DEF-789', 506, 'Velvet Valley', 'No'),
('UVW-876', 189, 'Crimson Cove', 'No'),
('GHI-543', 740, 'Serenity Falls', 'Yes'),
('RST-210', 315, 'Mystic Haven', 'Yes'),
('LMN-456', 926, 'Emerald Shores', 'No'),
('NOP-789', 584, 'Enchanted Grove', 'No'),
('HIJ-123', 207, 'Solaris City', 'Yes'),
('CDE-567', 891, 'Lunar Junction', 'Yes'),
('BCD-890', 650, 'Stellar Fields', 'No'),
('KLM-321', 413, 'Tranquil Harbor', 'Yes'),
('VWX-654', 795, 'Nebula Vista', 'No'),
('STU-987', 328, 'Golden Glade', 'No'),
('YZA-123', 467, 'Blissful Oasis', 'Yes'),
('EFG-456', 582, 'Echoing Canyon', 'Yes');



INSERT PAYMENT:

INSERT INTO Payment (PaymentID)
VALUES
(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),(41),(42),(43),(44),(45),(46),(47),(48),(49),(50),(51),(52);



INSERT PRODUCT DETAILS:

INSERT INTO ProductDetails (ProductID, QTY, DESCRIPTION, UNIT_PRICE)
VALUES
('S1', 1000, 'Luminous Bliss Perfume', 50.00),
('S2', 200, 'TechMaster Pro Headphones', 199.99),
('S3', 20, 'ZenWell Meditation Pillow', 35.00),
('S4', 30, 'SwiftGlide Hair Straightener', 89.99),
('S5', 50, 'EcoHarmony Reusable Water Bottle', 20.00),
('S6', 40, 'AdventureSeeker Backpack', 69.99),
('S7', 150, 'GourmetBlend Coffee Beans', 12.99),
('S8', 65, 'HarmonyHome Smart Thermostat', 129.99),
('S9', 10, 'SereneSleep Bamboo Sheets', 49.99),
('S10', 40, 'FitnessFusion Resistance Bands', 19.99),
('S11', 10, 'CulinaryCraft Chef\'s Knife Set', 79.99),
('S12', 20, 'Stargazer Telescope Kit', 149.99),
('S13', 25, 'Serenity Spa Candle Collection', 15.00),
('S1', 100, 'Luminous Bliss Perfume', 50.00),
('S1', 100, 'Luminous Bliss Perfume', 50.00),
('S4', 30, 'SwiftGlide Hair Straightener', 89.99),
('S4', 700, 'SwiftGlide Hair Straightener', 89.99),
('S5', 990, 'EcoHarmony Reusable Water Bottle', 20.00),
('S5', 40, 'EcoHarmony Reusable Water Bottle', 20.00),
('S6', 200, 'AdventureSeeker Backpack', 69.99),
('S6', 10, 'AdventureSeeker Backpack', 69.99),
('S7', 90, 'GourmetBlend Coffee Beans', 12.99),
('S7', 1, 'GourmetBlend Coffee Beans', 12.99),
('S8', 4, 'HarmonyHome Smart Thermostat', 129.99),
('S8', 100, 'HarmonyHome Smart Thermostat', 129.99),
('S9', 75, 'SereneSleep Bamboo Sheets', 49.99),
('S10', 45, 'FitnessFusion Resistance Bands', 19.99);



INSERT INVOICE:

INSERT INTO Invoice (SupplierID, CompanyID, UNIT_PRICE, QTY, INVOICE_DATE)
VALUES
(492, 37294, 1000, 100, '25/01/23'),
(207, 60581, 234, 30, '05/03/23'),
(891, 41378, 111, 50, '10/04/23'),
(650, 89134, 567, 30, '25/04/23'),
(413, 21856, 899, 50, '07/06/23'),
(795, 76503, 100, 200, '15/07/23'),
(328, 32814, 249, 90, '30/07/23'),
(467, 50628, 66, 65, '10/09/23'),
(582, 31589, 1000, 75, '20/09/23'),
(765, 65092, 99, 45, '01/11/23'),
(218, 37294, 4444, 1000, '15/12/23'),
(934, 46709, 66, 1000, '23/12/23'),
(605, 20756, 774, 100, '03/02/24'),
(372, 74025, 33, 19, '12/03/23'),
(506, 92647, 890, 20, '28/03/23'),
(189, 58236, 234, 30, '15/05/23'),
(740, 58413, 567, 40, '05/06/23'),
(315, 93470, 876, 10, '24/06/23'),
(926, 79562, 112, 1, '10/08/23'),
(584, 49217, 499, 4, '20/09/23'),
(891, 18943, 25.99, 600, '27/10/23'),
(492, 18943, 47.5, 700, '05/12/23'),
(795, 37294, 12.75, 990, '12/01/24'),
(506, 21856, 36.2, 1000, '25/01/23'),
(650, 76503, 58.9, 150, '05/03/23'),
(795, 32814, 15.45, 100, '10/04/23'),
(328, 50628, 39.8, 10, '25/04/23'),
(218, 31589, 63.25, 10, '07/06/23'),
(934, 65092, 21.1, 10, '15/07/23'),
(506, 37294, 54.6, 20, '30/07/23'),
(605, 46709, 112.5, 25, '30/07/23');



INSERT MAKESCID:

INSERT INTO MakesCID (CompanyID, PaymentID)
VALUES
(37294, 22),
(60581, 23),
(41378, 24),
(89134, 25),
(21856, 26),
(76503, 27),
(32814, 28),
(50628, 29),
(31589, 30),
(65092, 31),
(37294, 32),
(46709, 33),
(20756, 34),
(74025, 35),
(92647, 36),
(58236, 37),
(58413, 38),
(93470, 39),
(79562, 40),
(49217, 41),
(18943, 42),
(18943, 43),
(37294, 44),
(21856, 45),
(76503, 46),
(32814, 47),
(50628, 48),
(31589, 49),
(65092, 50),
(37294, 51),
(46709, 52);
