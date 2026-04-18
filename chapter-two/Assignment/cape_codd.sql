USE cape_codd;

# 2.40
SELECT INVENTORY.SKU,
       INVENTORY.SKU_Description,
       INVENTORY.WarehouseID,
       WAREHOUSE.WarehouseCity,
       WAREHOUSE.WarehouseState
FROM INVENTORY, WAREHOUSE
WHERE INVENTORY.WarehouseID = WAREHOUSE.WarehouseID
AND (WarehouseCity = 'Atlanta'
     OR WarehouseCity = 'Bangor'
     OR WarehouseCity = 'Chicago');

# 2.41
SELECT SKU,
       SKU_Description,
       INVENTORY.WarehouseID,
       WarehouseCity,
       WarehouseState
FROM INVENTORY, WAREHOUSE
WHERE INVENTORY.WarehouseID = WAREHOUSE.WarehouseID
  AND WarehouseCity IN ('Atlanta', 'Bangor', 'Chicago');

# 2.42
SELECT INVENTORY.SKU,
       INVENTORY.SKU_Description,
       INVENTORY.WarehouseID,
       WAREHOUSE.WarehouseCity,
       WAREHOUSE.WarehouseState
FROM INVENTORY, WAREHOUSE
WHERE INVENTORY.WarehouseID = WAREHOUSE.WarehouseID
AND (WarehouseCity <> 'Atlanta'
     AND WarehouseCity <> 'Bangor'
     AND WarehouseCity <> 'Chicago');

# 2.43
SELECT SKU,
       SKU_Description,
       INVENTORY.WarehouseID,
       WarehouseCity,
       WarehouseState
FROM INVENTORY, WAREHOUSE
WHERE INVENTORY.WarehouseID = WAREHOUSE.WarehouseID
  AND WarehouseCity NOT IN ('Atlanta', 'Bangor', 'Chicago');

# 2.44
SELECT CONCAT(SKU_Description, ' is located in ', WarehouseCity) AS ItemLocation
FROM INVENTORY, WAREHOUSE
WHERE INVENTORY.WarehouseID = WAREHOUSE.WarehouseID;


# 2.45
SELECT SKU,
       SKU_Description,
       INVENTORY.WarehouseID
FROM INVENTORY,WAREHOUSE
WHERE INVENTORY.WarehouseID = WAREHOUSE.WarehouseID
    AND WAREHOUSE.MANAGER = 'Lucille Smith';

# 2.46
SELECT SKU,
       SKU_Description,
       INVENTORY.WarehouseID
FROM INVENTORY, WAREHOUSE
WHERE INVENTORY.WarehouseID = WAREHOUSE.WarehouseID
    AND WAREHOUSE.Manager = 'Lucille Smith';

# 2.47
SELECT SKU,
       SKU_Description,
       INVENTORY.WarehouseID
FROM INVENTORY
    JOIN WAREHOUSE ON INVENTORY.WarehouseID = WAREHOUSE.WarehouseID
    AND WAREHOUSE.Manager = 'Lucille Smith';

# 2.48
SELECT WarehouseID,
        AVG(QuantityOnHand) AS Average_Items
FROM INVENTORY
WHERE WarehouseID IN(
    SELECT WarehouseID
    FROM WAREHOUSE
    WHERE Manager = 'Lucille Smith'
    )
GROUP BY WarehouseID;


# 2.49
SELECT INVENTORY.WarehouseID,
        AVG(QuantityOnHand) AS Average_Items
FROM INVENTORY, WAREHOUSE
WHERE INVENTORY.WarehouseID = WAREHOUSE.WarehouseID
    AND WAREHOUSE.Manager = 'Lucille Smith'
GROUP BY WarehouseID;


# 2.50
SELECT INVENTORY.WarehouseID,
        AVG(QuantityOnHand) AS Average_Items
FROM INVENTORY
    JOIN WAREHOUSE ON INVENTORY.WarehouseID = WAREHOUSE.WarehouseID
    AND WAREHOUSE.Manager = 'Lucille Smith'
GROUP BY WarehouseID;

# 2.51
SELECT WAREHOUSE.WarehouseID,
       WarehouseCity,
       WareHouseCity,
       WarehouseState,
       Manager,
       SKU,
       SKU_Description,
       QuantityOnHand
FROM INVENTORY
    JOIN WAREHOUSE ON INVENTORY.WarehouseID = WAREHOUSE.WarehouseID
    WHERE WAREHOUSE.Manager = 'Lucille Smith'

# 2.52
SELECT WarehouseID,
       SUM(QuantityOnOrder) AS TotalItemsOnOrder,
       SUM(QuantityOnHand) AS TotalItemsOnHand
FROM INVENTORY
GROUP BY WarehouseID, QuantityOnOrder

# 2.53
# A subquery cannot be used in question 2.52 because all the required data exists within a single table (INVENTORY), making a second "lookup" query redundant.
# Furthermore, subqueries are primarily used for filtering rows, whereas this task requires a GROUP BY clause to calculate aggregate sums across multiple columns simultaneously.

# 2.54
# While both methods relate data across tables, Joins combine columns horizontally into a single result set to show data from both tables at once,
#     whereas Subqueries act as nested filters that use data from one table to determine which specific rows should be retrieved from another.


# 2.55
SELECT WAREHOUSE.*,
       INVENTORY.SKU,
       INVENTORY.SKU_Description,
       INVENTORY.QuantityOnHand,
       INVENTORY.QuantityOnOrder
FROM WAREHOUSE
LEFT JOIN INVENTORY ON WAREHOUSE.WarehouseID = INVENTORY.WarehouseID;







