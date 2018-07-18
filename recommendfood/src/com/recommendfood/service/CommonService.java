package com.recommendfood.service;

import java.util.List;

import org.hibernate.Transaction;

import com.recommendfood.daoimpl.BaseDaoImpl;
import com.recommendfood.util.ParamUtil;

public class CommonService{
	private BaseDaoImpl baseDao;
	private Transaction transaction;//事物

	public BaseDaoImpl getBaseDao() {
		return baseDao;
	}
	public void setBaseDao(BaseDaoImpl baseDao) {
		this.baseDao = baseDao;
	}
	public Transaction getTransaction() {
		return transaction;
	}
	public void setTransaction(Transaction transaction) {
		this.transaction = transaction;
	}
	//获得事务对象
	public Transaction getTranaction(){
		return getBaseDao().getHibernateTemplate().getSessionFactory().openSession().getTransaction();
	}
	//更新语句
	public boolean updateSql(String sql, Object[] values){
		return this.baseDao.updateSql(sql, values);
	}
	public List executeHql(String sql){
		return this.baseDao.executeQueryHql(sql, null, -1, -1);
	}
	//执行hql语句
	public List executeHql(String sql, Object[] values){
		return this.baseDao.executeQueryHql(sql, values, -1, -1);
	}
	//(报表查询)
	//执行sql语句
	public List<Object> executeSqlWithReport(String sql, Object[] values){
		return this.baseDao.executeQuerySql(sql, values, -1, -1);
	}
	//执行sql语句
	public List<Object> executeSqlWithReport(String sql, List<Object> lists){
		Object[] values = ParamUtil.getArrayByList(Object.class, lists);
		return this.baseDao.executeQuerySql(sql, values, -1, -1);
	}
	//(属性查询)
	//执行sql语句
	public List<Object[]> executeSql(String sql, List<Object> lists){
		Object[] values = ParamUtil.getArrayByList(Object.class, lists);
		return this.baseDao.executeQuerySql(sql, values, -1, -1);
	}
	//(集合查询)
	//执行sql语句
	public List<Object> executeSql(String sql, Object[] values){
		return this.baseDao.executeQuerySql(sql, values, -1, -1);
	}
	//执行hql语句
	public List executeHql(String sql, List<Object> lists){
		Object[] values = ParamUtil.getArrayByList(Object.class, lists);
		return this.baseDao.executeQueryHql(sql, values, -1, -1);
	}
	//(分页查询)
	//执行sql语句并分页
	public List<Object[]> executeSqlWithPage(String sql, List<Object> lists, int firstResult, int maxResult){
		Object[] values = ParamUtil.getArrayByList(Object.class, lists);
		return this.baseDao.executeQuerySql(sql, values, firstResult, maxResult);
	}
	//执行hql语句并分页
	public List executeHqlWithPage(String sql, List<Object> lists, int firstResult, int maxResult){
		Object[] values = ParamUtil.getArrayByList(Object.class, lists);
		return this.baseDao.executeQueryHql(sql, values, firstResult, maxResult);
	}
}
