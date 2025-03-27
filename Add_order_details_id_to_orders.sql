-- Step 1: Add the order_details_id column if it does not exist
IF NOT EXISTS (
    SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
    WHERE TABLE_NAME = 'orders' AND COLUMN_NAME = 'order_details_id'
)
BEGIN
    ALTER TABLE orders ADD order_details_id INT;
END

-- Step 2: Update orders with order_details_id from order_details table
UPDATE orders
SET order_details_id = od.id
FROM orders o
JOIN order_details od ON od.order_ref = o.order_ref;
