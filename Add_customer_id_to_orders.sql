-- Step 1: Add the product_id column if it does not exist
IF NOT EXISTS (
    SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
    WHERE TABLE_NAME = 'orders' AND COLUMN_NAME = 'customer_id'
)
BEGIN
    ALTER TABLE orders ADD customer_id INT;
END

-- Step 2: Update order_details with product_id from product table
UPDATE orders
SET customer_id = c.id
FROM orders o
JOIN customer c ON o.customer = c.customer_name;
