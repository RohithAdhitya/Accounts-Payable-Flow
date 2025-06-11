-- Query 1: Total price of each order
SELECT (QTY * UNIT_PRICE) AS Total  
FROM PurchaseOrder;

-- Query 2: Maximum purchase order by each company
SELECT CompanyID, MAX(UNIT_PRICE * QTY) AS MaxPurchaseAmount
FROM PurchaseOrder
GROUP BY CompanyID;

-- Query 3: Mismatched quantities between PurchaseOrder and Invoice
SELECT
    po.PurchaseOrderID,
    po.SupplierID,
    po.CompanyID,
    po.QTY AS PurchaseOrderQty,
    i.Qty AS InvoiceQty
FROM PurchaseOrder po
LEFT JOIN Invoice i ON po.PurchaseOrderID = i.PurchaseOrderID
WHERE i.PurchaseOrderID IS NULL OR po.QTY <> i.Qty;

-- Query 4: Companies with single PO, single Invoice, multiple GRNs
SELECT * 
FROM PurchaseOrder po 
WHERE po.PurchaseOrderID IN (
    SELECT po.PurchaseOrderID 
    FROM PurchaseOrder po 
    LEFT JOIN GRN g ON po.PurchaseOrderID = g.PurchaseOrderID 
    LEFT JOIN Invoice i ON po.PurchaseOrderID = i.PurchaseOrderID 
    GROUP BY po.PurchaseOrderID 
    HAVING COUNT(DISTINCT g.GRN_ID) > 1 
           AND COUNT(DISTINCT i.InvoiceID) = 1
);

-- Query 5: Mismatched products between PurchaseOrder and Invoice
SELECT 
    i.SupplierID,  
    i.CompanyID, 
    i.DESCRIPTION AS Invoice_Product_Description,  
    po.DESCRIPTION AS PurchaseOrder_Product_Description
FROM Invoice i
JOIN PurchaseOrder po ON i.PurchaseOrderID = po.PurchaseOrderID
WHERE NOT EXISTS (
    SELECT 1 
    FROM PurchaseOrder po2 
    WHERE i.PurchaseOrderID = po2.PurchaseOrderID 
          AND i.DESCRIPTION = po2.DESCRIPTION
);

-- Query 6: Mismatched unit prices between PurchaseOrder and Invoice
SELECT 
    i.SupplierID, 
    i.CompanyID, 
    i.PRICE AS Invoice_Unit_Price, 
    po.UNIT_PRICE AS PurchaseOrder_Unit_Price
FROM Invoice i
JOIN PurchaseOrder po ON i.PurchaseOrderID = po.PurchaseOrderID
WHERE i.PRICE <> ALL (
    SELECT Unit_Price 
    FROM PurchaseOrder 
    WHERE i.PurchaseOrderID = PurchaseOrder.PurchaseOrderID
);

-- Query 7: Payments made through 'cash' and 'cheque'
SELECT PaymentID, cash_details AS payment_details 
FROM Cash
UNION
SELECT PaymentID, cheque_details AS payment_details 
FROM Cheque;

-- Query 8: Products with unit price greater than average
SELECT description, unit_price 
FROM PurchaseOrder
WHERE Unit_Price > (
    SELECT AVG(unit_price)
    FROM PurchaseOrder
);

-- Query 9: Happy Path – Perfectly matched PO, Invoice, and GRN
SELECT 
    po.PurchaseOrderID, 
    po.SupplierID, 
    po.CompanyID, 
    po.ProductID, 
    po.DESCRIPTION AS PurchaseOrder_Description, 
    i.PRICE AS Invoice_Unit_Price, 
    g.GRN_ID, 
    g.QTY AS GRN_QTY
FROM PurchaseOrder po
JOIN Invoice i ON po.PurchaseOrderID = i.PurchaseOrderID
JOIN GRN g ON po.PurchaseOrderID = g.PurchaseOrderID 
           AND po.ProductID = g.ProductID
WHERE po.QTY = i.QTY 
      AND po.QTY = g.QTY 
      AND po.DESCRIPTION = g.DESCRIPTION 
      AND po.DESCRIPTION = i.DESCRIPTION 
      AND i.PRICE = po.Unit_Price 
      AND g.Unit_Price = po.Unit_Price 
      AND i.PRICE IS NOT NULL 
      AND g.Unit_Price IS NOT NULL;
