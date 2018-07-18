package com.recommendfood.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

public class SqlUtil {
	//创建带命名参数的hql语句
	public static String createHqlWithNamedParamByParams(String tableName, String[] paramNames){
		StringBuffer sqlBuffer = new StringBuffer();
		String tableLower = tableName.substring(0, 1).toLowerCase();
		sqlBuffer.append("from ");
		sqlBuffer.append(tableName + " " + tableLower + " ");
		sqlBuffer.append("where 1=1 ");
		for(String paramName:paramNames){
			sqlBuffer.append("and " + tableLower + "." + paramName + "=:" + paramName + " ");
		}
		return sqlBuffer.toString();
	}
	//创建带问号的hql语句
	public static String createHqlByParams(String tableName, String[] paramNames){
		StringBuffer sqlBuffer = new StringBuffer();
		String tableLower = tableName.substring(0, 1).toLowerCase();
		sqlBuffer.append("from ");
		sqlBuffer.append(tableName + " " + tableLower + " ");
		sqlBuffer.append("where 1=1 ");
		for(String paramName:paramNames){
			sqlBuffer.append("and " + tableLower + "." + paramName + "=?" + " ");
		}
		return sqlBuffer.toString();
	}
	//创建带问号的hql语句
	public static String createHqlByParams2(String tableName, List<SearchObject> searchList){
		StringBuffer sqlBuffer = new StringBuffer();
		String tableLower = tableName.substring(0, 1).toLowerCase();
		sqlBuffer.append("from ");
		sqlBuffer.append(tableName + " " + tableLower + " ");
		if(searchList!=null && searchList.size()>0){
			sqlBuffer.append("where ");
			Map<String, Integer> columnCount = new HashMap<String, Integer>();
			sqlBuffer = buildSql(sqlBuffer, tableLower, searchList, columnCount);
		}
		return sqlBuffer.toString();
	}
	public static StringBuffer buildSql(StringBuffer sqlBuffer, String tableLower, List<SearchObject> searchList, Map<String, Integer> columnCount){
		sqlBuffer.append("1=1 ");
		for(SearchObject searchObject:searchList){
			String isOr = searchObject.isOr()==false?"and":"or";
			if(searchObject.getSearchList()==null || searchObject.getSearchList().size()==0){
				String paramName = null;
				if(columnCount.get(searchObject.getParam())==null){
					columnCount.put(searchObject.getParam(), 1);
				}else{
					columnCount.put(searchObject.getParam(), columnCount.get(searchObject.getParam())+1);
				}
				sqlBuffer.append(isOr + " " + tableLower + "." + searchObject.getParam() + columnCount.get(searchObject.getParam()));
				if(searchObject.getValues() == null || searchObject.getValues().length==0){
					if(searchObject.isLike()==false){
						sqlBuffer.append(searchObject.getEqual() + "?" + " ");
					}else{
						sqlBuffer.append(" like ?" + " ");
					}
				}else{
					sqlBuffer.append(" in (?)");
				}
			}else{
				sqlBuffer.append(isOr + "(");
				sqlBuffer = buildSql(sqlBuffer, tableLower, searchObject.getSearchList(), columnCount);
				sqlBuffer.append(")" + " ");
			}
		}
		return sqlBuffer;
	}
	//创建带命名参数的hql语句
	public static String createHqlWithNamedParamByParams2(String tableName, List<SearchObject> searchList){
		StringBuffer sqlBuffer = new StringBuffer();
		String tableLower = tableName.substring(0, 1).toLowerCase();
		sqlBuffer.append("from ");
		sqlBuffer.append(tableName + " " + tableLower + " ");
		if(searchList!=null && searchList.size()>0){
			sqlBuffer.append("where ");
			Map<String, Integer> columnCount = new HashMap<String, Integer>();
			sqlBuffer = buildSql2(sqlBuffer, tableLower, searchList, columnCount);
		}
		return sqlBuffer.toString();
	}
	public static StringBuffer buildSql2(StringBuffer sqlBuffer, String tableLower, List<SearchObject> searchList, Map<String, Integer> columnCount){
		sqlBuffer.append("1=1 ");
//		int i=0;
		if(searchList!=null && searchList.size()>0){
			for(SearchObject searchObject:searchList){
				String isOr = searchObject.isOr()==false?"and":"or";
//				if(i==0){
//					sqlBuffer.substring(0, sqlBuffer.lastIndexOf("1=1 "));
//					sqlBuffer.append(" ");
//				}
//				System.out.println(searchObject.isOr());
				if(searchObject.getSearchList()==null || searchObject.getSearchList().size()==0){
					String paramName = null;
//					System.out.println(columnCount.get(searchObject.getParam()));
					if(columnCount.get(searchObject.getParam())==null){
						columnCount.put(searchObject.getParam(), 1);
					}else{
						columnCount.put(searchObject.getParam(), columnCount.get(searchObject.getParam())+1);
					}
					String namedParam = tableLower+searchObject.getParam() + columnCount.get(searchObject.getParam());
					sqlBuffer.append(isOr + " " + tableLower + "." + searchObject.getParam());
					if(searchObject.getValues() == null || searchObject.getValues().length==0){
						if(searchObject.isLike()==false){
							sqlBuffer.append(searchObject.getEqual() + ":" + namedParam + " ");
						}else{
							sqlBuffer.append(" like :" +namedParam + " ");
						}
					}else{
						sqlBuffer.append(" in (:" +namedParam + ")");
					}
				}else{
					sqlBuffer.append(isOr + "(");
					sqlBuffer = buildSql2(sqlBuffer, tableLower, searchObject.getSearchList(), columnCount);
					sqlBuffer.append(")" + " ");
				}
//				i=2;
			}
		}
		return sqlBuffer;
	}
	//添加排序条件
	public static String appendOrderToSql(String tableName, String sql, Map<String, String> orderColumns){
		StringBuffer sqlOrder = new StringBuffer(sql);
		if(orderColumns!=null){
			sqlOrder.append(" order by ");
			String tableLower = null;
			if(tableName!=null && !("").equals(tableName)){
				tableLower =  tableName.substring(0, 1).toLowerCase();
			}
			for(Entry<String, String> entry:orderColumns.entrySet()){
				sqlOrder.append(tableLower + "." + entry.getKey() + " " + entry.getValue() + ",");
			}
			sqlOrder.deleteCharAt(sqlOrder.length()-1);
		}
		return sqlOrder.toString();
	}
	//创建报表查询的hql语句
	public static String createHqlReportQuery(String tableName, List<SearchObject> searchList, QueryTypeEnum queryType, String[] columnNames){
		StringBuffer sqlBuffer = new StringBuffer();
		String tableLower = tableName.substring(0, 1).toLowerCase();
//		System.out.println(queryType.getValue());
		if(queryType == QueryTypeEnum.TOTAL_RECORD){
			sqlBuffer.append(queryType.getValue());
		}else{
			String sqlHead = queryType.getValue();
			sqlBuffer.append(sqlHead.substring(0, sqlHead.indexOf("(")+1) + columnNames[0] + sqlHead.substring(sqlHead.indexOf(")")));
		}
		sqlBuffer.append("from ");
		sqlBuffer.append(tableName + " " + tableLower + " ");
		if(searchList!=null && searchList.size()>0){
			sqlBuffer.append("where ");
			Map<String, Integer> columnCount = new HashMap<String, Integer>();
			sqlBuffer = buildSql2(sqlBuffer, tableLower, searchList, columnCount);
		}
		return sqlBuffer.toString();
	}
	//创建关联表查询语句
	public static String createRelationHqlWithNamedParamByParams(String tableName, List<SearchObject> params, List<SearchRelation> searchRelations){
		String tableLower = tableName.substring(0, 1).toLowerCase();
		
		StringBuffer sql = new StringBuffer("select " + tableLower+",");
		for(SearchRelation sr:searchRelations){
			if(sr.isReturnData())
				sql.append(sr.getObjectAlias() + ",");
		}
		sql.deleteCharAt(sql.length()-1);
		sql.append(" from " + tableName + " "+ tableLower + ", ");
		for(SearchRelation sr:searchRelations){
			sql.append(sr.getRelationObjectName() + " " + sr.getObjectAlias() + ",");
		}
		sql.deleteCharAt(sql.length()-1);
		sql.append(" where 1=1 ");
		for(SearchRelation sr:searchRelations){
//			System.out.println(sr.getObjectAlias());
			if(sr.getObjectName().equals(tableName))
				sql.append("and " + tableLower+"."+sr.getObjectPropertyName()+"="+sr.getObjectAlias()+"."+sr.getRelationObjectPropertyName()+" ");
			else{
//				System.out.println("test");
				String objectAlias = getObjectAliasByObjectName(sr.getObjectName(),  searchRelations);
				sql.append("and " + objectAlias + "." + sr.getObjectPropertyName() + "=" + sr.getObjectAlias() + "." + sr.getRelationObjectPropertyName() + " ");
			}
		}
		sql.append("and ");
		Map<String, Integer> columnCount = new HashMap<String, Integer>();
		sql = buildSql2(sql, tableLower, params, columnCount);
		for(SearchRelation sr:searchRelations){
			sql.append("and ");
			columnCount = new HashMap<String, Integer>();
//			System.out.println(sr.getObjectAlias());
			sql = buildSql2(sql, sr.getObjectAlias(), sr.getSearchList(), columnCount);
		}
	
		/*StringBuffer sql = new StringBuffer("select " + tableLower + " from " + tableName + " " + tableLower + " where 1=1 ");
		for(SearchRelation sr:searchRelations){
			if(sr.isReturnData()){
				sql.insert(sql.indexOf("from"), ","+sr.getObjectAlias()+" ");
			}
			sql.insert(sql.indexOf("where"), "," + sr.getRelationObjectName() + " " + sr.getObjectAlias() + " ");
			if(sr.getObjectName().equals(tableName)){
				sql.append("and " + tableLower + "." + sr.getObjectPropertyName() + "=" + sr.getObjectAlias() + "." + sr.getRelationObjectPropertyName() + " ");
			}else{
				String objectAlias = getObjectAliasByObjectName(sr.getObjectName(),  searchRelations);
				sql.append("and " + objectAlias + "." + sr.getObjectPropertyName() + "=" + sr.getObjectAlias() + "." + sr.getRelationObjectPropertyName() + " ");
			}
			sql.append("and ");
			sql = buildSql2(sql, tableLower, sr.getSearchList());
		}*/
		return sql.toString();
	}
	//创建关联表报表查询语句
	/*public static String createRelationHqlWithNamedParamByParams2(String tableName, List<SearchObject> params, List<SearchRelation> searchRelations){
		String tableLower = tableName.substring(0, 1).toLowerCase();
		
		StringBuffer sql = new StringBuffer("select " + tableLower+",");
		sql.append(" from " + tableName + " "+ tableLower + ", ");
		for(SearchRelation sr:searchRelations){
			sql.append(sr.getRelationObjectName() + " " + sr.getObjectAlias() + ",");
		}
		sql.deleteCharAt(sql.length()-1);
		sql.append(" where 1=1 ");
		for(SearchRelation sr:searchRelations){
			if(sr.getObjectName().equals(tableName))
				sql.append("and " + tableLower+"."+sr.getObjectPropertyName()+"="+sr.getObjectAlias()+"."+sr.getRelationObjectPropertyName()+" ");
			else{
				String objectAlias = getObjectAliasByObjectName(sr.getObjectName(),  searchRelations);
				sql.append("and " + objectAlias + "." + sr.getObjectPropertyName() + "=" + sr.getObjectAlias() + "." + sr.getRelationObjectPropertyName() + " ");
			}
		}
		sql.append("and ");
		Map<String, Integer> columnCount = new HashMap<String, Integer>();
		sql = buildSql2(sql, tableLower, params, columnCount);
		for(SearchRelation sr:searchRelations){
			sql.append("and ");
			columnCount = new HashMap<String, Integer>();
			sql = buildSql2(sql, sr.getObjectAlias(), sr.getSearchList(), columnCount);
		}
		return sql.toString();
	}*/
	
	private static String getObjectAliasByObjectName(String objectName, List<SearchRelation> searchRelations) {
		String objectAlias = null;
		for(SearchRelation sr:searchRelations){
			if(objectName.equals(sr.getRelationObjectName()))
				objectAlias = sr.getObjectAlias();
		}
		return objectAlias;
	}
	//创建更新语句
	public static String getUpdateSqlByParams(String tableName, long uid, List<SearchObject> params){
		StringBuffer sqlBuffer = new StringBuffer();
		String tableLower = tableName.substring(0, 1).toLowerCase();
		sqlBuffer.append("update ");
		sqlBuffer.append(tableName + " " + tableLower + " ");
		sqlBuffer.append("set ");
		for(SearchObject searchObject:params){
			sqlBuffer.append(tableLower + "." + searchObject.getParam()+"=?"+" , ");
		}
		sqlBuffer.delete(sqlBuffer.lastIndexOf(","), sqlBuffer.length());
		sqlBuffer.append("where "+tableLower+"."+"id"+"="+uid);
		return sqlBuffer.toString();
	}
}
