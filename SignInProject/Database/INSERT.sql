DELETE FROM products
WHERE pk_product < 100;

INSERT INTO products (name, descriptionShort, descriptionLong, price, quantity, rating, variant_id)
VALUES ("Trench Coat", "Black XXXL Trench Coat", "Made in Japan, this black trench coat compliments well with flame shirts, MLP tees and cargo shirts.", "35.99", 100, 3.4, "9197392837");

INSERT INTO products (name, descriptionShort, descriptionLong, price, quantity, rating, variant_id)
VALUES("GTX Titan", "Top of the line graphics card", "It'll melt down your house", "1000.00", 50, 4.0, "9197436229");

INSERT INTO products (name, descriptionShort, descriptionLong, price, quantity, rating, variant_id)
VALUES("Web Development In Assembly", "Published by O'Really Media, Written by Bob Johnson with his therapist", "'You might as well just kill yourself right now.' - Richard Stallman", "24.50", 25, 1.3, "9197506437");

INSERT INTO products (name, descriptionShort, descriptionLong, price, quantity, rating, variant_id)
VALUES("Micro$hill Botnet 10", "You need this for your games", "We are gonna sell all your info to the NSA", "99.99", 99, 0.0, "9197522821");

INSERT INTO products (name, descriptionShort, descriptionLong, price, quantity, rating, variant_id)
VALUES("Seldon mask", "Bazinga!", "own your very own mask of the hit character Sheldon Cooper from the hit TV show big bang theory. Surprise your freinds with this life like mask.", "21.99", 99, 2.6, "9197531845");

INSERT INTO products (name, descriptionShort, descriptionLong, price, quantity, rating, variant_id)
VALUES("Five year old Gentoo thinkpad", "Greatest laptop in the world", "It's got an SSD and edgy anime stickers on it.", "50.00", 10, 5.0, "9197541829");

INSERT INTO products (name, descriptionShort, descriptionLong, price, quantity, rating, variant_id)
VALUES("Mountin Dew", "60L barrel, comes with dripfeed", "", "2000.00", 10, 2.4, "9197546501");

INSERT INTO products (name, descriptionShort, descriptionLong, price, quantity, rating, variant_id)
VALUES("Doritos", "10kg bag of freshly picked doritos off the doritos tree", "Comes with free fedora!", "50.00", 10, 4.3, "9197551877");

INSERT INTO products (name, descriptionShort, descriptionLong, price, quantity, rating, variant_id)
VALUES("ULTIMATE NEXT-GEN GAMING COMPUTER VERY GOOD", "THIS IS THE ULTIMATE NEXT GENERATION IN COMUTER GAMING", "<img src='pc.jpg'/><br/>CPU: i7 ultimate edition overclocked to 4.20 GHz<br/>GPU: GTX Titan<br/>Memory: 64GB DDR420<br/>Also, Ultimate sick next-gen liquid cooling.<br/>DO NOT BUY THIS MACHINE IF YOU ARE NOT HARDCORE!", "50000.00", 10, 5.0, "9197560261");

INSERT INTO products (name, descriptionShort, descriptionLong, price, quantity, rating, variant_id)
VALUES("Product", "A Product", "<img src='pc.jpg'/><br/>Product: For Testing and Stuff", "0.01", 10, 5.0, "8802719557"); DELETE FROM users WHERE pk_user < 100; 

INSERT INTO users (uname, email, pass, is_admin) VALUES ("Liam", "Liam@Liam.Liam", "Liam", 1);