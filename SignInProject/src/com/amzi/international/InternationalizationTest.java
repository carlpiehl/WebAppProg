/*
   Class: CurrencyFormatTest
   A class that is used to test whether the internationalisation is working properly
   in regards to switching between English text to French text.
   
   Functions:
   main()        - Initializes ResourceBundles "bundle1","bundle2","bundle3", and "bundle4"
   							 - assigns Locales "defaultLocale", "frenchLocal", "enonexistentLocale"
   							   to "bundle2","bundle3", and "bundle4"
   							   and then displaying the result given by each bundle using displayValues()
   displayValues - Outputs "hello", "goodbye", and "Do you speak _____?"
   								 in the language associated to the referenced bundle
   							 
*/
package com.amzi.international;

import java.util.Locale;
import java.util.ResourceBundle;

public class InternationalizationTest {

	public static void main(String[] args) throws Exception {

		ResourceBundle bundle1 = ResourceBundle.getBundle("com.amzi.international.TestBundle");
		displayValues(bundle1);

		Locale defaultLocale = Locale.getDefault();
		ResourceBundle bundle2 = ResourceBundle.getBundle("com.amzi.international.TestBundle", defaultLocale);
		displayValues(bundle2);

		Locale frenchLocale = new Locale("fr", "CA");
		ResourceBundle bundle3 = ResourceBundle.getBundle("com.amzi.international.TestBundle", frenchLocale);
		displayValues(bundle3);

		Locale nonexistentLocale = new Locale("xx", "XX");
		ResourceBundle bundle4 = ResourceBundle.getBundle("com.amzi.international.TestBundle", nonexistentLocale);
		displayValues(bundle4);
		
		System.out.println(Locale.getDefault());

	}

	public static void displayValues(ResourceBundle bundle) {
		System.out.println("hello message:" + bundle.getString("my.hello"));
		System.out.println("goodbye message:" + bundle.getString("my.goodbye"));
		System.out.println("question message:" + bundle.getString("my.question"));
		System.out.println();
	}

}