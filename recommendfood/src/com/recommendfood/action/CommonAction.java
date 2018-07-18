package com.recommendfood.action;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class CommonAction<T> extends ActionSupport implements SessionAware{
	public String LOGIN_USER="login_user";
	public String Data = "data";
	public String JSON = "json";
	private int total;  //总记录数
//	private int pageSize; //每页记录数
	private int pageIndex;  //页码数
	private List<T> dataList;
	private String message;
	private String jsondata;
	private String result;
	private Map<String, Object> session;
	private String query;//查询
	
	
	public String getLOGIN_USER() {
		return LOGIN_USER;
	}
	public void setLOGIN_USER(String lOGIN_USER) {
		LOGIN_USER = lOGIN_USER;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
//	public int getPageSize() {
//		return pageSize;
//	}
//	public void setPageSize(int pageSize) {
//		this.pageSize = pageSize;
//	}
	public int getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}
	public List<T> getDataList() {
		return dataList;
	}
	public void setDataList(List<T> dataList) {
		this.dataList = dataList;
	}
	public String getJsondata() {
		return jsondata;
	}
	public void setJsondata(String jsondata) {
		this.jsondata = jsondata;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	public Map<String, Object> getSession() {
		return session;
	}
	public String getQuery() {
		return query;
	}
	public void setQuery(String query) {
		this.query = query;
	}
	
}
