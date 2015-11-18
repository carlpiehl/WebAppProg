package com.amzi.international;

/*
 * @author: Carl Piehl
 * @date: Nov 17 2015
 * 
 * This class is simply an object that holds a string. It is designed to get 
 */

import java.util.ResourceBundle;

public class Internationalization {

	ResourceBundle bundle = ResourceBundle.getBundle("com.amzi.international.TestBundle");
	String string;

	public Internationalization() {
		String string;
	}
	
	public String getString() {
		return string;
	}

	public void setString(String string) {
		this.string = bundle.getString(string);
	}

	public String ToString(){
		return this.string;
	}
}
