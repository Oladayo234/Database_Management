use cape_codd;

# 2.17
SELECT SKU, SKU_Description
FROM SKU_DATA;

# 2.18
SELECT SKU_Description, SKU
FROM SKU_DATA;

# 2.19
SELECT WarehouseID
FROM INVENTORY;

# 2.20
SELECT DISTINCT WarehouseID
FROM INVENTORY;

# 2.21
SELECT WarehouseID, SKU,
       SKU_Description,
       QuantityOnHand,
       QuantityOnOrder
FROM INVENTORY;

# 2.22
SELECT *
FROM INVENTORY;

# 2.23
SELECT *
FROM INVENTORY
WHERE QuantityOnHand <> 0;

# 2.24
SELECT SKU,
       SKU_Description
FROM INVENTORY
WHERE QuantityOnHand = 0;

# 2.25
SELECT SKU,
       SKU_Description,
       WarehouseID
FROM INVENTORY
WHERE QuantityOnHand = 0
ORDER BY WarehouseID ASC;

# 2.26
SELECT SKU,
       SKU_Description,
       WarehouseID
FROM INVENTORY
WHERE QuantityOnHand > 0
ORDER BY WarehouseID DESC, SKU ASC;

# 2.27
SELECT SKU,
       SKU_Description,
       WarehouseID
FROM INVENTORY
WHERE QuantityOnHand > 0 AND QuantityOnOrder <> 0
ORDER BY WarehouseID DESC, SKU ASC;

# 2.28
SELECT SKU,
       SKU_Description,
       WarehouseID
FROM INVENTORY
WHERE QuantityOnHand = 0 OR QuantityOnOrder = 0
ORDER BY WarehouseID DESC, SKU ASC;

# 2.29
SELECT SKU,
       SKU_Description,
       WarehouseID
FROM INVENTORY
WHERE QuantityOnHand > 0 AND QuantityOnHand < 10;

# 2.30
SELECT SKU,
       SKU_Description,
       WarehouseID
FROM INVENTORY
WHERE QuantityOnHand BETWEEN 1 AND 9;

# 2.31
SELECT SKU,
       SKU_Description
FROM SKU_DATA
WHERE SKU_Description LIKE 'Half-dome%';

# 2.32
SELECT DISTINCT SKU,
       SKU_Description
FROM SKU_DATA
WHERE SKU_Description LIKE '%Climb%';


# 2.33
SELECT DISTINCT SKU,
       SKU_Description
FROM SKU_DATA
WHERE SKU_Description LIKE '%__d%';

# 2.34
SELECT SUM(QuantityOnHand) AS Total_Stock,
       AVG(QuantityOnHand) AS Average_Stock,
       MAX(QuantityOnHand) AS Maximum_Stock,
       MIN(QuantityOnHand) AS Minimum_Stock,
       COUNT(QuantityOnHand) AS Total_Stock_Count
FROM INVENTORY;

# 2.35
# COUNT() returns the number of rows that match a specific criterion. It essentially tallies entries rather than looking at their values.
# SUM() returns the mathematical total of all values in a numeric column. It adds the actual values together.

# 2.36
SELECT WarehouseID,
       SUM(QuantityOnHand) AS TotalItemsOnHand
FROM INVENTORY
GROUP BY WarehouseID
ORDER BY TotalItemsOnHand DESC;

# 2.37
SELECT WarehouseID,
       SUM(QuantityOnHand) AS TotalItemsOnHandLT3
FROM INVENTORY
WHERE QuantityOnHand < 3
GROUP BY WarehouseID
ORDER BY TotalItemsOnHandLT3 DESC;

# 2.38
SELECT WarehouseID,
       SUM(QuantityOnHand) AS TotalItemsOnHandLT3
FROM INVENTORY
WHERE QuantityOnHand < 3
GROUP BY WarehouseID
HAVING COUNT(SKU) < 2
ORDER BY TotalItemsOnHandLT3 DESC;





