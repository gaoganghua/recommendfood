package com.recommendfood.util;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class PatternUtil {
	//匹配字符串
	public static boolean testMatch(String orginialdStr, String regex){
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(orginialdStr);
		return matcher.matches();
	}
	//根据匹配条件抽取字符串
	public static String[] extractStr(String orginialdStr, String regex){
		List<String> strs = new ArrayList<String>();
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(orginialdStr);
		while(matcher.find()){
			strs.add(matcher.group());
		}
		return ParamUtil.getArrayByList(String.class, strs);
	}
}
