package com.recommendfood.util;

import java.awt.Color;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;

import sun.security.provider.MD5;

public class ValidateCode {
	 HttpClient client1 = new HttpClient();  
     PostMethod post = new PostMethod("http://sms.webchinese.cn/web_api/");
//     post.
     //在头文件中设置转码 
//     NameValuePair[] data = { new NameValuePair("Uid", "polaris"),        //注册的用户名  
//     new NameValuePair("Key", "c83102f7fea3a7053643"),   //注册成功后，登录网站，在"修改短信接口密钥"这一栏里面
//     new NameValuePair("smsMob", "188xxxxxxxx"),               // 需要发送的手机号码  
//     new NameValuePair("smsText", "验证码：9999") };           //需要发送的短信内容    
//     post.

//     client.executeMethod(post);  
//     Header[] headers = post.getResponseHeaders();  
//     int statusCode = post.getStatusCode();  
//
//     String result = new String(post.getResponseBodyAsString().getBytes( "gbk"));  
////     
//     post.releaseConnection();  
}
