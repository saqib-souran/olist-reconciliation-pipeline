CREATE TABLE IF NOT EXISTS orders (
    order_id TEXT PRIMARY KEY,
    order_status TEXT,
    order_purchase_timestamp TIMESTAMP
);

CREATE TABLE IF NOT EXISTS order_items (
    order_id TEXT NOT NULL REFERENCES orders(order_id),
    order_item_id INTEGER NOT NULL,
    price NUMERIC(12, 2),
    freight_value NUMERIC(12, 2),
    PRIMARY KEY (order_id, order_item_id)
);

CREATE TABLE IF NOT EXISTS order_payments (
    order_id TEXT NOT NULL REFERENCES orders(order_id),
    payment_sequential INTEGER NOT NULL,
    payment_type TEXT,
    payment_value NUMERIC(12, 2),
    PRIMARY KEY (order_id, payment_sequential)
);