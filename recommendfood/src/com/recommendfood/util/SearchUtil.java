package com.recommendfood.util;

import java.util.List;

public class SearchUtil {
	//添加属性值
	public static SearchObject add(boolean or, String param, Object value){
		return new SearchObject(or, param, value);
	}
	//添加模糊查询
	public static SearchObject add(boolean or, String param, Object value, boolean like){
		return new SearchObject(or, param, value, like);
	}
	//添加大于小于
	public static SearchObject add(boolean or, String param, Object value, String equal){
		return new SearchObject(or, param, value, equal);
	}
//	//添加or链接
//	public static SearchObject add(String param, Object value, String equal, boolean or, boolean like){
//		return new SearchObject(param, value, equal, or, like);
//	}
	//添加取值范围
	public static SearchObject add(boolean or, String param, Object[] values){
		return new SearchObject(or, param, values);
	}
	//添加复杂sql关系
	public static SearchObject add(boolean or, List<SearchObject> searchList){
		return new SearchObject(or, searchList);
	}
	
	
	//表关联查询
	//objectName应与service一致
	public static SearchRelation addRelation(String relationObjectName, String relationObjectPropertyName, String objectAlias, 
			boolean returnData,List<SearchObject> searchList, String objectName, String objectPropertyName){
		return new SearchRelation(objectName, objectPropertyName, returnData, searchList, relationObjectName, relationObjectPropertyName, objectAlias);
	}
	
}
