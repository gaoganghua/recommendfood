package com.recommendfood.service;

import java.util.List;
import java.util.Map;

import com.recommendfood.daoimpl.AdminLogDaoIml;
import com.recommendfood.model.AdminLog;
import com.recommendfood.util.ParamUtil;
import com.recommendfood.util.QueryTypeEnum;
import com.recommendfood.util.SearchObject;
import com.recommendfood.util.SearchRelation;
import com.recommendfood.util.SqlUtil;

public class AdminLogService {
	private final String tableName = "AdminLog";
	private AdminLogDaoIml dao;

	public AdminLogDaoIml getDao() {
		return dao;
	}

	public void setDao(AdminLogDaoIml dao) {
		this.dao = dao;
	}
	
	//执行sql语句
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
	public void save(AdminLog b){
		this.dao.add(b);
	}
	//减少
	public void remove(AdminLog b){
		this.dao.delete(b);
	}
	//更改
	public void update(AdminLog b){
		this.dao.update(b);
	}
	//查询
	public AdminLog get(long id){
		return (AdminLog) this.dao.get(AdminLog.class, id);
	}
	//根据条件查询
	public List<AdminLog> findFoodListByParams(List<SearchObject> params){
		String[] paramNames = ParamUtil.getParamNames2(tableName,params);
		Object[] values = ParamUtil.getParamValues2(params);
		String sql = SqlUtil.createHqlWithNamedParamByParams2(tableName, params);
//		System.out.println(sql);
		
		return dao.queryList(sql, paramNames, values);
	}
	//根据条件查询并排序
	public List<AdminLog> findFoodListByParamsWithOrder(List<SearchObject> params, Map<String, String> orderColumns){
		String[] paramNames = ParamUtil.getParamNames2(tableName, params);
		Object[] values = ParamUtil.getParamValues2(params);
		String sql = SqlUtil.createHqlWithNamedParamByParams2(tableName, params);
		sql = SqlUtil.appendOrderToSql(tableName, sql, orderColumns);
		
		return dao.queryListWithOrderAndPage(sql, paramNames, values, -1, -1);
	}
	//根据条件排序查询并分页
	public List<AdminLog> findFoodListByParamsWithOrderAndPage(List<SearchObject> params, Map<String, String> orderColumns, int firstResult, int maxResult){
		String[] paramNames = ParamUtil.getParamNames2(tableName, params);
		Object[] values = ParamUtil.getParamValues2(params);
		String sql = SqlUtil.createHqlWithNamedParamByParams2(tableName, params);
		sql = SqlUtil.appendOrderToSql(tableName,sql, orderColumns);
		
		return dao.queryListWithOrderAndPage(sql, paramNames, values, firstResult, maxResult);
	}
	//创建总记录查询
	public long findTotalRecord(List<SearchObject> params, QueryTypeEnum queryType){
		String[] paramNames = ParamUtil.getParamNames2(tableName,params);
		Object[] values = ParamUtil.getParamValues2(params);
		String sql = SqlUtil.createHqlReportQuery(tableName, params, queryType, null);
		List lists = (List)dao.queryReportQueryByParams(sql, paramNames, values);
		
		return Long.parseLong(String.valueOf(lists.get(0)));
	}
	//报表查询
	public Object findReportRecord(List<SearchObject> params, QueryTypeEnum queryType, String[] columnNames){
		String[] paramNames = ParamUtil.getParamNames2(tableName, params);
		Object[] values = ParamUtil.getParamValues2(params);
		String sql = SqlUtil.createHqlReportQuery(tableName, params, queryType, columnNames);
		List lists = (List)dao.queryReportQueryByParams(sql, paramNames, values);
		
		return lists.get(0);
	}
	
	//关联表查询
	public List getListByParams(List<SearchObject> params,List<SearchRelation> searchRelations){
		String sql = SqlUtil.createRelationHqlWithNamedParamByParams(tableName, params,searchRelations);
		String[] paramNames = ParamUtil.getParamNamesByRelation(tableName,params,searchRelations);
		Object[] values = ParamUtil.getParamValuesByRelation(params,searchRelations);
		return this.dao.queryObjectsListByParams(sql, paramNames, values);
	}
	//关联表分页查询
	public List getListByParamsWithPage(List<SearchObject> params,List<SearchRelation> searchRelations,
			Map<String, String> orderColumns, int firstResult, int maxResult){
		String sql = SqlUtil.createRelationHqlWithNamedParamByParams(tableName, params,searchRelations);
		String[] paramNames = ParamUtil.getParamNamesByRelation(tableName,params,searchRelations);
		Object[] values = ParamUtil.getParamValuesByRelation(params,searchRelations);
		sql = SqlUtil.appendOrderToSql(tableName, sql, orderColumns);
		
		
		return this.dao.queryObjectsListByParamsWithOrderAndPage(sql, paramNames, values, firstResult, maxResult);
	}
}
