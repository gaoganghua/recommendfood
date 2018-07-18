package com.recommendfood.action;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;

import org.apache.struts2.ServletActionContext;

import com.recommendfood.util.JsonUtil;

public class LoadDataAction extends CommonAction<Object>{
	private static final long serialVersionUID = 1L;
	private String month;//月份
	private String provice;//省份

	
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getProvice() {
		return provice;
	}
	public void setProvice(String provice) {
		this.provice = provice;
	}
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return super.execute();
	}
	//加载时间
	public String loadDay(){
//		System.out.println(getMonth());
		Properties p = new Properties();
		String path = "/WEB-INF/conf/properties/time.properties";
		InputStream is = ServletActionContext.getServletContext().getResourceAsStream(path);
		try {
			p.load(is);
			String days = p.getProperty(getMonth());
			setJsondata(JsonUtil.ajax(true,null, Integer.parseInt(days)));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "loadday";
	}
	//加载城市
	public String loadCity(){
		Properties p = new Properties();
		String path = "/WEB-INF/conf/properties/city.properties";
		InputStream is = ServletActionContext.getServletContext().getResourceAsStream(path);
		try {
			p.load(is);
			List<String> citys = new ArrayList<String>();
			String[] values = p.getProperty(getProvice()).split(",");
			for(String value:values){
				citys.add(value);
			}
			setJsondata(JsonUtil.ajax(true, null,citys));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "loadcity";
	}
	//加载省份
	public String loadProvice(){
		Properties p = new Properties();
		String path = "/WEB-INF/conf/properties/city.properties";
		InputStream is = ServletActionContext.getServletContext().getResourceAsStream(path);
		try {
			p.load(is);
			List<String> provices = new ArrayList<String>();
			for(Object key:p.keySet()){
//				System.out.println(key);
				provices.add(key.toString());
			}
			setJsondata(JsonUtil.ajax(true, null,provices));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "loadprovice";
	}
}
