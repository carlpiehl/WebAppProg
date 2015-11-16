package com.amzi.currencyformat;

import java.text.NumberFormat;
import java.util.Locale;

public class CurrencyFormatTest {

	public static void main(String[] args) throws Exception {

		double num = 1323.526;

		NumberFormat defaultFormat = NumberFormat.getCurrencyInstance();
		System.out.println("US: " + defaultFormat.format(num));

		Locale french = new Locale("fr", "CA");
		NumberFormat swedishFormat = NumberFormat.getCurrencyInstance(french);
		System.out.println("French: " + swedishFormat.format(num));
	}
}