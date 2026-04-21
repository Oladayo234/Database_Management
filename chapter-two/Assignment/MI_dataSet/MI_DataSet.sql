USE mi_ch02;

# A
SELECT * FROM ITEM;
SELECT * FROM SHIPMENT;
SELECT * FROM SHIPMENT_ITEM;

# B
SELECT  ShipmentID,
        ShipperName,
        ShipperInvoiceNumber
FROM SHIPMENT;

# C
SELECT  ShipmentID,
        ShipperName,
        ShipperInvoiceNumber
FROM SHIPMENT
WHERE InsuredValue > 10000.00;

# D
SELECT  ShipmentID,
        ShipperName,
        ShipperInvoiceNumber
FROM SHIPMENT
WHERE ShipperName LIKE 'AB%';

# E
SELECT ShipmentID,
       ShipperName,
       ShipperInvoiceNumber,
       ArrivalDate
FROM SHIPMENT
WHERE EXTRACT(MONTH FROM DepartureDate) = 12;

# F
SELECT ShipmentID,
       ShipperName,
       ShipperInvoiceNumber,
       ArrivalDate
FROM SHIPMENT
WHERE DAY(DepartureDate) = 10;

# G
SELECT MAX(InsuredValue) AS MaximumInsuredValue,
       MIN(InsuredValue) AS MinimumInsuredValue
FROM SHIPMENT;

# H
SELECT AVG(InsuredValue) AS AverageInsuredValue
FROM SHIPMENT;

# I
SELECT COUNT(SHIPMENT.ShipmentID) AS TotalShipments
FROM SHIPMENT;

# j
SELECT ItemID,
       Description,
       Store,
       (LocalCurrencyAmount * ExchangeRate) AS USCurrencyAmount
FROM ITEM;

# K
SELECT City, Store
FROM ITEM
GROUP BY City, Store;

# L
SELECT City, Store, COUNT(ItemID) AS TotalItemsPurchased
FROM ITEM
GROUP BY City, Store;

# M
SELECT ShipperName,
       ShipmentID,
       DepartureDate
FROM SHIPMENT
WHERE ShipmentID IN (
    SELECT ShipmentID
    FROM SHIPMENT_ITEM
    WHERE Value >= 1000.00
    )
ORDER BY ShipperName ASC, DepartureDate DESC;

# N

# O
SELECT ShipperName,
       ShipmentID,
       DepartureDate
FROM SHIPMENT
WHERE ShipmentID IN (
    SELECT ShipmentID
    FROM SHIPMENT_ITEM
    WHERE ItemID IN (
        SELECT ItemID
        FROM ITEM
        WHERE CITY = 'Singapore'
    )
)
ORDER BY ShipperName ASC, DepartureDate DESC;
