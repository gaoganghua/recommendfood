package com.recommendfood.util;

import java.util.List;

//关联表查询对象
public class SearchRelation {
	//表对象
	private String objectName;
	//表属性
	private String objectPropertyName;
	//是否返回数据
	private boolean returnData;
	//表查询约束
	private List<SearchObject> searchList;
	//关联表对象
	private String relationObjectName;
	//关联表属性
	private String relationObjectPropertyName;
	//
	private String objectAlias;
	
	public SearchRelation(String objectName, String objectPropertyName, boolean returnData,
			List<SearchObject> searchList, String relationObjectName, String relationObjectPropertyName, String objectAlias) {
		this.objectName = objectName;
		this.objectPropertyName = objectPropertyName;
		this.returnData = returnData;
		this.searchList = searchList;
		this.relationObjectName = relationObjectName;
		this.relationObjectPropertyName = relationObjectPropertyName;
		this.objectAlias = objectAlias;
	}

	public String getObjectName() {
		return objectName;
	}

	public void setObjectName(String objectName) {
		this.objectName = objectName;
	}

	public String getObjectPropertyName() {
		return objectPropertyName;
	}

	public void setObjectPropertyName(String objectPropertyName) {
		this.objectPropertyName = objectPropertyName;
	}

	public boolean isReturnData() {
		return returnData;
	}

	public void setReturnData(boolean returnData) {
		this.returnData = returnData;
	}

	public List<SearchObject> getSearchList() {
		return searchList;
	}

	public void setSearchList(List<SearchObject> searchList) {
		this.searchList = searchList;
	}

	public String getRelationObjectName() {
		return relationObjectName;
	}

	public void setRelationObjectName(String relationObjectName) {
		this.relationObjectName = relationObjectName;
	}

	public String getRelationObjectPropertyName() {
		return relationObjectPropertyName;
	}

	public void setRelationObjectPropertyName(String relationObjectPropertyName) {
		this.relationObjectPropertyName = relationObjectPropertyName;
	}

	public String getObjectAlias() {
		return objectAlias;
	}

	public void setObjectAlias(String objectAlias) {
		this.objectAlias = objectAlias;
	}
	
	
}
