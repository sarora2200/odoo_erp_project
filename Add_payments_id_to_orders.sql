-- Step 1: Add the payments_id column if it does not exist
IF NOT EXISTS (
    SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
    WHERE TABLE_NAME = 'orders' AND COLUMN_NAME = 'payments_id'
)
BEGIN
    ALTER TABLE orders ADD payments_id INT;
END

-- Step 2: Update orders with payments_id from payments table
UPDATE orders
SET payments_id = p.id
FROM orders o
JOIN payments p ON o.order_ref = p.order_ref;
