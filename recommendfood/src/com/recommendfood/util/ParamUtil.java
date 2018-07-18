package com.recommendfood.util;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

public class ParamUtil {
	public static String[] getParamNames(Map<String, Object> params){
		String[] paramNames = new String[params.size()];
		int i=0;
		for(Entry<String, Object> entry:params.entrySet()){
			paramNames[i] = entry.getKey();
			i++;
		}
		return paramNames;
	} 
	public static Object[] getParamValues(Map<String, Object> params){
		Object[] paramValues = new Object[params.size()];
		int i=0;
		for(Entry<String, Object> entry:params.entrySet()){
			paramValues[i] = entry.getValue();
			i++;
		}
		return paramValues;
	} 
	//通过list查询对象得到属性值名
	public static String[] getParamNames2(String tableName, List<SearchObject> params){
		List<String> paramValueList = new ArrayList<String>();
		String tableLower = tableName.substring(0, 1).toLowerCase();
		Map<String, Integer> columnCount = new HashMap<String, Integer>();
		getListParamNames(tableLower, paramValueList, params, columnCount);
		return getArrayByList(String.class, paramValueList);
	}
	private static void getListParamNames(String tableLower,List<String> paramValueList, List<SearchObject> params, Map<String, Integer> columnCount) {
		if(params!=null && params.size()>0){
			for(SearchObject searchObject:params){
				if(columnCount.get(searchObject.getParam())==null){
					columnCount.put(searchObject.getParam(), 1);
				}else{
					columnCount.put(searchObject.getParam(), columnCount.get(searchObject.getParam())+1);
				}
				if(searchObject.getSearchList()==null || searchObject.getSearchList().size()==0){
					String namedParam = tableLower+searchObject.getParam() + columnCount.get(searchObject.getParam());
					paramValueList.add(namedParam);
				}else{
					getListParamNames(tableLower, paramValueList, searchObject.getSearchList(), columnCount);
				}
			}
		}
	}
	//通过list查询对象集合得到属性值数组
	public static Object[] getParamValues2(List<SearchObject> params){
		List<Object> paramValueList = new ArrayList<Object>();
		getListParamValues(paramValueList, params);
		return getArrayByList(Object.class, paramValueList);
	}
	public static void getListParamValues(List<Object> paramValueList, List<SearchObject> params){
		if(params!=null && params.size()>0){
			for(SearchObject searchObject:params){
				if(searchObject.getSearchList()==null || searchObject.getSearchList().size()==0){
					if(searchObject.isLike()==false){
						if(searchObject.getValues()==null){
							paramValueList.add(searchObject.getValue());
						}else{
	//						System.out.println("----------------");
							paramValueList.add(Arrays.asList(searchObject.getValues()));
	//						paramValueList.add(searchObject.getValues());
						}
					}else{
						paramValueList.add("%" + searchObject.getValue() + "%");
					}
				}else{
					getListParamValues(paramValueList, searchObject.getSearchList());
				}
			}
		}
	}
	//得到关联表的属性名
	public static String[] getParamNamesByRelation(String tableName, List<SearchObject> param, List<SearchRelation> searchRelations){
		String tableLower = tableName.substring(0, 1).toLowerCase();
		List<String> paramNameList = new ArrayList<String>();
		Map<String, Integer> columnCount = new HashMap<String, Integer>();
		getListParamNames(tableLower,paramNameList, param, columnCount);
		for(SearchRelation sr:searchRelations){
			columnCount = new HashMap<String, Integer>();
			getListParamNames(sr.getObjectAlias(),paramNameList, sr.getSearchList(), columnCount);
		}
		return getArrayByList(String.class, paramNameList);
	}
	//得到关联表的属性值
	public static Object[] getParamValuesByRelation(List<SearchObject> param, List<SearchRelation> searchRelations){
		List<Object> paramValueList = new ArrayList<Object>();
		getListParamValues(paramValueList, param);
		for(SearchRelation sr:searchRelations){
			getListParamValues(paramValueList, sr.getSearchList());
		}
		return getArrayByList(Object.class, paramValueList);
	}
	//list集合转换为数组
	public static <T> T[] getArrayByList(Class<T> type,List<T> paramValueList){
		//new T[paramValueList.size()];不能直接new泛型数组
		T[] paramValues = (T[])Array.newInstance(type, paramValueList.size());
		for(int i=0;i<paramValueList.size();i++){
			paramValues[i] = paramValueList.get(i);
		}
		return paramValues;
	}
	//得到更新语句的属性值
	public static Object[] getParamValuesByUpdateSql(List<SearchObject> params){
		List<Object> paramValues = new ArrayList<Object>();
		if(params==null || params.size()<1)
			return null;
		for(SearchObject searchObject:params){
			paramValues.add(searchObject.getValue());
		}
		return getArrayByList(Object.class, paramValues);
	}
}
