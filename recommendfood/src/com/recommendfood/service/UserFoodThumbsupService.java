package com.recommendfood.service;

import java.util.List;
import java.util.Map;

import com.recommendfood.daoimpl.SystemCategoryDaoIml;
import com.recommendfood.daoimpl.UserFoodThumbsupDaoIml;
import com.recommendfood.model.SystemCategory;
import com.recommendfood.model.UserFoodThumbsup;
import com.recommendfood.util.ParamUtil;
import com.recommendfood.util.QueryTypeEnum;
import com.recommendfood.util.SearchObject;
import com.recommendfood.util.SearchRelation;
import com.recommendfood.util.SqlUtil;

public class UserFoodThumbsupService {
	private final String tableName = "UserFoodThumbsup";
	private UserFoodThumbsupDaoIml dao;

	public UserFoodThumbsupDaoIml getDao() {
		return dao;
	}

	public void setDao(UserFoodThumbsupDaoIml dao) {
		this.dao = dao;
	}
	
	//添加
	public void save(UserFoodThumbsup b){
		this.dao.add(b);
	}
	//减少
	public void remove(UserFoodThumbsup b){
		this.dao.delete(b);
	}
	//更改
	public void update(UserFoodThumbsup b){
		this.dao.update(b);
	}
	//查询
	public SystemCategory get(long id){
		return (SystemCategory) this.dao.get(SystemCategory.class, id);
	}
	//根据条件查询
	public List<SystemCategory> findSystemCategoryListByParams(List<SearchObject> params){
		String[] paramNames = ParamUtil.getParamNames2(tableName,params);
		Object[] values = ParamUtil.getParamValues2(params);
		String sql = SqlUtil.createHqlWithNamedParamByParams2(tableName, params);
		
		return dao.queryList(sql, paramNames, values);
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
}
