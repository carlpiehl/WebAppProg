# WebAppProg
Online Store for WAP

Update your database:
--------------------
There's tons of cool stuff in the new database. Drop the old database. Re-add the schema and product information tables.


Why your pull is broken:
-----------------------
If you have a bunch of red squiggly lines and can't understand what's wrong with your computer than this fix should work. Right click on your project and go into the build path -> configure build path. You're gonna wanna pop over to the libraries tab for a moment and if there's a red x under JRE System library click remove and add library in the right hand menu, select JRE system library. Then pop over to Order and Export and select JRE system library. Click ok and everything should be not on fire, if it ain't ask for help.

Why you are getting a 500 error:
--------------------------------
Change the port. AccountDAO.java, loginDao.java, products.jsp
