DELETE FROM products
WHERE pk_product < 100;

INSERT INTO products (name, descriptionShort, descriptionLong, price, quantity)
VALUES ("first product", "this description is short", "this is a longer, more detailed description of the product. this is a longer, more detailed description of the product.", "3.50", 100);

INSERT INTO products (name, descriptionShort, descriptionLong, price, quantity)
VALUES("another product", "short description", "longer description yo", "1000.00", 50);

INSERT INTO products (name, descriptionShort, descriptionLong, price, quantity)
VALUES("yet another product", "short description here", "long description over here", "50.50", 25);

INSERT INTO products (name, descriptionShort, descriptionLong, price, quantity)
VALUES("mock product", "fake short description", "fake long description", "99.99", 99);

INSERT INTO products (name, descriptionShort, descriptionLong, price, quantity)
VALUES("another nameless product", "another short description", "another long description", "100.00", 100);

INSERT INTO products (name, descriptionShort, descriptionLong, price, quantity)
VALUES("last fake product", "last fake short description", "last fake long description over here", "10.00", 10);