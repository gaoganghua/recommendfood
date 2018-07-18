package com.recommendfood.test;

import java.util.LinkedList;
import java.util.List;

public class Test {
	private static String ss = null;
	private static List<String> aa= new LinkedList<String>();
	
	static{
		aa.add("bb");
		aa.add("cc");
		aa.add("vv");
	}
	public static List<String> getStr(){
		return aa;
	}
}
