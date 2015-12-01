/*
   Class: CurrencyFormatTest
   A class that is used to test whether or not the internationalisation is working properly
   in regards to switching the currency format between English and French.
   
   Functions:
   main()        - takes a double "num", format it and outputs it in english
   							 - then formats it again and outputs it in french.
*/

package com.amzi.international;

import java.text.NumberFormat;
import java.util.Locale;

public class CurrencyFormatTest {

	public static void main(String[] args) throws Exception {

		double num = 1323.526;

		NumberFormat defaultFormat = NumberFormat.getCurrencyInstance();
		System.out.println("US: " + defaultFormat.format(num));

		Locale french = new Locale("fr", "CA");
		NumberFormat frenchFormat = NumberFormat.getCurrencyInstance(french);
		System.out.println("French: " + frenchFormat.format(num));
	}
}