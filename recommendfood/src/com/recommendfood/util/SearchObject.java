package com.recommendfood.util;

import java.util.List;

public class SearchObject {
	private String param;//
	//属性值
	private Object value;
	//是否大于小于等于该值
	private String equal = "=";
	//是否是or链接
	private boolean or = false;//
	//是否模糊查询
	private boolean like = false;
	//是否等于多个值
	private Object[] values;//
	//复杂sql关系
	private List<SearchObject> searchList;
	
	public String getParam() {
		return param;
	}

	public void setParam(String param) {
		this.param = param;
	}

	public Object getValue() {
		return value;
	}

	public void setValue(Object value) {
		this.value = value;
	}

	public String getEqual() {
		return equal;
	}

	public void setEqual(String equal) {
		this.equal = equal;
	}

	public boolean isOr() {
		return or;
	}

	public void setOr(boolean or) {
		this.or = or;
	}

	public boolean isLike() {
		return like;
	}

	public void setLike(boolean like) {
		this.like = like;
	}

	public Object[] getValues() {
		return values;
	}

	public void setValues(Object[] values) {
		this.values = values;
	}
	
	public List<SearchObject> getSearchList() {
		return searchList;
	}

	public void setSearchList(List<SearchObject> searchList) {
		this.searchList = searchList;
	}

	public SearchObject(boolean or, String param, Object value) {
		this.param = param;
		this.value = value;
		this.or = or;
	}

	public SearchObject(boolean or, String param, Object value, String equal) {
		this.or= or;
		this.param = param;
		this.value = value;
		this.equal = equal;
	}

	public SearchObject(boolean or, String param, Object value, boolean like) {
		this.param = param;
		this.value = value;
		this.like = like;
		this.or = or;
	}
	
	public SearchObject(boolean or, String param, Object[] values) {
		this.param = param;
		this.values = values;
		this.or = or;
	}
	
	public SearchObject(boolean or, List<SearchObject> searchList){
		this.or = or;
		this.searchList = searchList;
	}
}
