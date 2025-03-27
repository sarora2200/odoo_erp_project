-- Step 1: Add the product_id column if it does not exist
IF NOT EXISTS (
    SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
    WHERE TABLE_NAME = 'order_details' AND COLUMN_NAME = 'product_id'
)
BEGIN
    ALTER TABLE order_details ADD product_id INT;
END

-- Step 2: Update order_details with product_id from product table
UPDATE order_details
SET product_id = p.id
FROM order_details od
JOIN product p ON od.product_name = p.product_name;
