-- Get all customers and their addresses.
    SELECT addresses.street, addresses.city, addresses.state, addresses.zip, addresses.address_type, customers.first_name, customers.last_name from addresses
    JOIN customers ON customers.id = addresses.customer_id;
-- Get all orders and their line items.
    SELECT line_items.unit_price, line_items.order_id, line_items.quantity, orders.order_date, orders.total, products.description, products.unit_price FROM line_items
    JOIN orders on orders.id = line_items.order_id
    JOIN products on products.id = line_items.product_id;
-- Which warehouses have cheetos?
    SELECT warehouse from warehouse_product 
    JOIN products on products.id = warehouse_product.product_id
    JOIN warehouse on warehouse_product.warehouse_id = warehouse.id
    WHERE products.description = 'cheetos'
-- Which warehouses have diet pepsi?
    SELECT warehouse from warehouse_product 
    JOIN products on products.id = warehouse_product.product_id
    JOIN warehouse on warehouse_product.warehouse_id = warehouse.id
    WHERE products.description = 'diet pepsi'
-- Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
    SELECT COUNT(orders.id), customers.first_name, customers.last_name from orders
    join addresses on addresses.id = orders.address_id
    join customers on addresses.customer_id = customers.id
    GROUP BY customers.first_name, customers.last_name
-- How many customers do we have?
    SELECT COUNT(customers.id) from customers;
-- How many products do we carry?
    SELECT COUNT(products.id) from products;
-- What is the total available on-hand quantity of diet pepsi?
    SELECT SUM(on_hand) from warehouse_product
    join products on products.id = warehouse_product.product_id
    WHERE products.description = 'diet pepsi';