package com.recommendfood.service;

import java.util.List;
import java.util.Map;

import com.recommendfood.daoimpl.FoodDaoIml;
import com.recommendfood.model.Food;
import com.recommendfood.util.ParamUtil;
import com.recommendfood.util.QueryTypeEnum;
import com.recommendfood.util.SearchObject;
import com.recommendfood.util.SearchRelation;
import com.recommendfood.util.SqlUtil;

public class FoodService {
	private final String tableName = "Food";
	private FoodDaoIml dao;

	public FoodDaoIml getDao() {
		return dao;
	}

	public void setDao(FoodDaoIml dao) {
		this.dao = dao;
	}
	
	//测试
	public List<Food> findBooks(){
		return this.dao.queryBooks();
	}
//	//执行sql语句
//	public List<Object[]> executeSql(String sql, List<Object> lists){
//		Object[] values = ParamUtil.getArrayByList(Object.class, lists);
//		return this.dao.executeQuerySql(sql, values);
//	}
//	//执行hql语句
//	public List executeHql(String sql, List<Object> lists){
//		Object[] values = ParamUtil.getArrayByList(Object.class, lists);
//		return this.dao.executeQueryHql(sql, values);
//	}
	//添加
	public void save(Food b){
		this.dao.add(b);
	}
	//减少
	public void remove(Food b){
		this.dao.delete(b);
	}
	//更改
	public void update(Food b){
		this.dao.update(b);
	}
	//查询
	public Food get(long id){
		return (Food) this.dao.get(Food.class, id);
	}
	//根据条件查询
	public List<Food> findFoodListByParams(List<SearchObject> params){
		String[] paramNames = ParamUtil.getParamNames2(tableName,params);
		Object[] values = ParamUtil.getParamValues2(params);
		String sql = SqlUtil.createHqlWithNamedParamByParams2(tableName, params);
//		System.out.println(sql);
		
		return dao.queryList(sql, paramNames, values);
	}
	//根据条件查询并排序
	public List<Food> findFoodListByParamsWithOrder(List<SearchObject> params, Map<String, String> orderColumns){
		String[] paramNames = ParamUtil.getParamNames2(tableName, params);
		Object[] values = ParamUtil.getParamValues2(params);
		String sql = SqlUtil.createHqlWithNamedParamByParams2(tableName, params);
		sql = SqlUtil.appendOrderToSql(tableName, sql, orderColumns);
//		System.out.println(sql);
		
		return dao.queryListWithOrderAndPage(sql, paramNames, values, -1, -1);
	}
	public List<Food> findFoodListByParamsWithOrderAndPage(List<SearchObject> params,int firstResult, int maxResult){
		String[] paramNames = ParamUtil.getParamNames2(tableName, params);
		Object[] values = ParamUtil.getParamValues2(params);
		String sql = SqlUtil.createHqlWithNamedParamByParams2(tableName, params);
//		sql = SqlUtil.appendOrderToSql(tableName,sql, orderColumns);
//		System.out.println(sql);
		
		return dao.queryListWithOrderAndPage(sql, paramNames, values, firstResult, maxResult);
	}
	//根据条件排序查询并分页
	public List<Food> findFoodListByParamsWithOrderAndPage(List<SearchObject> params, Map<String, String> orderColumns, int firstResult, int maxResult){
		String[] paramNames = ParamUtil.getParamNames2(tableName, params);
		Object[] values = ParamUtil.getParamValues2(params);
		String sql = SqlUtil.createHqlWithNamedParamByParams2(tableName, params);
		sql = SqlUtil.appendOrderToSql(tableName,sql, orderColumns);
//		System.out.println(sql);
		
		return dao.queryListWithOrderAndPage(sql, paramNames, values, firstResult, maxResult);
	}
	//创建总记录查询
	public long findTotalRecord(List<SearchObject> params, QueryTypeEnum queryType){
		String[] paramNames = ParamUtil.getParamNames2(tableName,params);
		Object[] values = ParamUtil.getParamValues2(params);
		String sql = SqlUtil.createHqlReportQuery(tableName, params, queryType, null);
//		System.out.println(sql);
		List lists = (List)dao.queryReportQueryByParams(sql, paramNames, values);
		
		return Long.parseLong(String.valueOf(lists.get(0)));
	}
	//报表查询
	public Object findReportRecord(List<SearchObject> params, QueryTypeEnum queryType, String[] columnNames){
		String[] paramNames = ParamUtil.getParamNames2(tableName, params);
		Object[] values = ParamUtil.getParamValues2(params);
		String sql = SqlUtil.createHqlReportQuery(tableName, params, queryType, columnNames);
//		System.out.println(sql);
		List lists = (List)dao.queryReportQueryByParams(sql, paramNames, values);
		
		return lists.get(0);
	}
	
	//关联表查询
	public List getListByParams(List<SearchObject> params,List<SearchRelation> searchRelations){
		String sql = SqlUtil.createRelationHqlWithNamedParamByParams(tableName, params,searchRelations);
		String[] paramNames = ParamUtil.getParamNamesByRelation(tableName,params,searchRelations);
		Object[] values = ParamUtil.getParamValuesByRelation(params,searchRelations);
		
//		System.out.println(sql);
//		System.out.println(paramNames.length);
//		System.out.println(values.length);
		
		
		return this.dao.queryObjectsListByParams(sql, paramNames, values);
	}
	//关联表分页查询
	public List getListByParamsWithPage(List<SearchObject> params,List<SearchRelation> searchRelations,
			Map<String, String> orderColumns, int firstResult, int maxResult){
		String sql = SqlUtil.createRelationHqlWithNamedParamByParams(tableName, params,searchRelations);
		String[] paramNames = ParamUtil.getParamNamesByRelation(tableName,params,searchRelations);
		Object[] values = ParamUtil.getParamValuesByRelation(params,searchRelations);
		sql = SqlUtil.appendOrderToSql(tableName, sql, orderColumns);
//		System.out.println(sql);
		
		
		return this.dao.queryObjectsListByParamsWithOrderAndPage(sql, paramNames, values, firstResult, maxResult);
	}
}
