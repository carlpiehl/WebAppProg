DELETE FROM products
WHERE pk_product < 100;

INSERT INTO products (name, descriptionShort, descriptionLong, price, quantity, rating)
VALUES ("Trench Coat", "Black XXXL Trench Coat", "Made in Japan, this black trench coat compliments well with flame shirts, MLP tees and cargo shirts.", "35.99", 100, 3.4);

INSERT INTO products (name, descriptionShort, descriptionLong, price, quantity, rating)
VALUES("GTX Titan", "Top of the line graphics card", "It'll melt down your house", "1000.00", 50, 4.0);

INSERT INTO products (name, descriptionShort, descriptionLong, price, quantity, rating)
VALUES("Web Development In Assembly", "Published by O'Really Media, Written by Bob Johnson with his therapist", "'You might as well just kill yourself right now.' - Richard Stallman", "24.50", 25, 1.3);

INSERT INTO products (name, descriptionShort, descriptionLong, price, quantity, rating)
VALUES("Micro$hill Botnet 10", "You need this for your games", "We are gonna sell all your info to the NSA", "99.99", 99, 0.0);

INSERT INTO products (name, descriptionShort, descriptionLong, price, quantity, rating)
VALUES("Seldon mask", "Bazinga!", "own your very own mask of the hit character Sheldon Cooper from the hit TV show big bang theory. Surprise your freinds with this life like mask.", "21.99", 99, 2.6);

INSERT INTO products (name, descriptionShort, descriptionLong, price, quantity, rating)
VALUES("GNU/Linux", "The latest in neckbeard tech", "I'd just like to interject for a moment. What you’re referring to as Linux, is in fact, GNU/Linux, or as I’ve recently taken to calling it, GNU plus Linux. Linux is not an operating system unto itself, but rather another free component of a fully functioning GNU system made useful by the GNU corelibs, shell utilities and vital system components comprising a full OS as defined by POSIX. Many computer users run a modified version of the GNU system every day, without realizing it. Through a peculiar turn of events, the version of GNU which is widely used today is often called “Linux”, and many of its users are not aware that it is basically the GNU system, developed by the GNU Project. There really is a Linux, and these people are using it, but it is just a part of the system they use. Linux is the kernel: the program in the system that allocates the machine’s resources to the other programs that you run. The kernel is an essential part of an operating system, but useless by itself; it can only function in the context of a complete operating system. Linux is normally used in combination with the GNU operating system: the whole system is basically GNU with Linux added, or GNU/Linux. All the so-called “Linux” distributions are really distributions of GNU/Linux.", 0.0, 100, 3);

INSERT INTO products (name, descriptionShort, descriptionLong, price, quantity, rating)
VALUES("Five year old Gentoo thinkpad", "Greatest laptop in the world", "It's got an SSD and edgy anime stickers on it.", "50.00", 10, 5.0);

INSERT INTO products (name, descriptionShort, descriptionLong, price, quantity, rating)
VALUES("Mountin Dew", "60L barrel, comes with dripfeed", "", "2000.00", 10, 2.4);

INSERT INTO products (name, descriptionShort, descriptionLong, price, quantity, rating)
VALUES("Doritos", "10kg bag of freshly picked doritos off the doritos tree", "Comes with free fedora!", "50.00", 10, 4.3);

INSERT INTO products (name, descriptionShort, descriptionLong, price, quantity, rating)
VALUES("ULTIMATE NEXT-GEN GAMING COMPUTER VERY GOOD", "THIS IS THE ULTIMATE NEXT GENERATION IN COMUTER GAMING", "<img src='pc.jpg'/><br/>CPU: i7 ultimate edition overclocked to 4.20 GHz<br/>GPU: GTX Titan<br/>Memory: 64GB DDR420<br/>Also, Ultimate sick next-gen liquid cooling.<br/>DO NOT BUY THIS MACHINE IF YOU ARE NOT HARDCORE!", "50000.00", 10, 5.0);

INSERT INTO products (name, descriptionShort, descriptionLong, price, quantity, rating, variant_id)
VALUES("Product", "A Product", "<img src='pc.jpg'/><br/>Product: For Testing and Stuff", "0.01", 10, 5.0, "8802719557");
