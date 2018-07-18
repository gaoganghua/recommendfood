package com.recommendfood.util;

import java.util.Random;

//字符串帮助类
public class StringUtil {
	private static final String CHARARRAY[] = {"1", "2", "3", "4", "5",
			"6", "7", "8", "9", "0","a", "b", "c", "d", "e", "f", "g", "h", "i",
			"j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v",
			"w", "x", "y", "z" ,"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
			"N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"};
	public static final String CHARACTERRAY[]={
			"+", "-", "*", "/", "%"
	};
	private static String getRandChar(int randNumber) {
		return CHARARRAY[randNumber];
	}
	private static String getRandCharacter(int randNumber) {
		return CHARACTERRAY[randNumber];
	}
//	public static final byte BYTEARRAY[]  = {
//		2, 8, 58, 23, 14,
//	};
//	public static String getOperator(){
//		
//	}
	//获取验证码
	public static String[] getSafeCode(){
		String[] safecodes = new String[2];
		String srand = "";
		String answer = null;
		Random random = new Random();
		boolean flag = random.nextBoolean();//需要计算
		flag = false;
		boolean doflag = false;
		if(flag){
			do{
				srand = "";
				int first;
				int last;
				srand = srand + getRandChar(random.nextInt(10));
				first = Integer.parseInt(srand);
				int operatorn = random.nextInt(5);
				String operator = getRandCharacter(operatorn);
				String lastChar = getRandChar(random.nextInt(9));
				last = Integer.parseInt(lastChar);
				if("/".equals(operator)){
					if(first%last!=0){
						doflag = true;
						continue;
					}
				}
				if("+".equals(operator)){
					answer = String.valueOf(first+last);
				}else if("-".equals(operator)){
					answer = String.valueOf(first-last);
				}else if("%".equals(operator)){
					answer = String.valueOf(first%last);
				}else if("/".equals(operator)){
					answer = String.valueOf(first/last);
				}else if("*".equals(operator)){
					answer = String.valueOf(first*last);
				}
				srand = srand + operator + lastChar + "=?";
				safecodes[0] = srand;
				safecodes[1] = answer;
			}while(doflag);
		}else{
			for(int i=0;i<4;i++){
				String rand = getRandChar(random.nextInt(62));
				srand = srand + rand;
			}
			safecodes[0]=srand;
			safecodes[1]=srand;
		}
		return safecodes;
	}
	//加密
	public String encrypt(String srcStr){
		String str = null;
		byte[] bus = srcStr.getBytes();
		for(int n=0;n<bus.length;n++){
			
		}
		
		return str;
	}
	//解密
	public String decrypt(String str){
		String srcStr = null;
	
		return srcStr;
	}
}
