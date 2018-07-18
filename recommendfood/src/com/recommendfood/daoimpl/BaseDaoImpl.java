package com.recommendfood.daoimpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;
import java.util.Set;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.HibernateTemplate;

import com.recommendfood.model.Food;
import com.recommendfood.model.UserFavorites;

public class BaseDaoImpl<T> {
	private HibernateTemplate hibernateTemplate;
	private SessionFactory sessionFactory;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	//测试
	public List queryBooks(){
//		List<BorrowRelation> all  = null;
//		List<Object[]> objs = null;
//		List<BookCategory> bcall = null;
		List lists = null;
		List<Food> foods = null;
		String sql="select b from Book b where b.bookName like :name";
		//sql="select b from Book b where b.introduction = :introduction";
		String[] paramNames = {"name"};
//		String params = "id";
//		List<Object> values = new ArrayList<Object>();
//		values.add(1L);
//		values.add(2L);
		Object[] values = {"%s%"};
		sql = " from Book b, Customer c, BorrowRelation br where b.id = br.bookId and c.id=br.customerId and b.id>2";
//		sql = "from BorrowRelation c";
		sql="select count(*) from User u, UserRecommend ur where u.id=ur.userId where u.id>?";
//		objs = (List<Object[]>) getHibernateTemplate().find(sql);
//		all =  (List<BorrowRelation>) getHibernateTemplate().find(sql, null);
//		all = (List<Book>) getHibernateTemplate().findByNamedParam(sql, paramNames, values);
//		String[] s = {"f1", "f2"};
//		Object[] oss = {"%50%", "%30%"};
		Object[] os = {1L};
//		os[0] = 1;
//		sql = "select f from Food f where f.id=?";
		lists =  (List) getHibernateTemplate().find(sql, os);
		return  lists;
	}
	//更新语句
	public int updateBulk(String sql, Object[] values){
		return getHibernateTemplate().bulkUpdate(sql, values);
	}
	//执行sql语句并分页
	public List<Object[]> executeQuerySql(String sql, Object[] values, int firstResult, int maxResult){
		Session session = getSessionFactory().openSession();
		Transaction t = session.getTransaction();
		t.begin();
		SQLQuery sqlQuery = session.createSQLQuery(sql);
		if(values!=null && values.length>0){
			fillSqlQueryParams(sqlQuery, values);
		}
		if(firstResult!=-1 && maxResult!=-1){
			sqlQuery.setFirstResult(firstResult).setMaxResults(maxResult);
		}
		List<Object[]> lists = sqlQuery.list();
		t.commit();
		session.close();
		return lists;
	}
	public void fillSqlQueryParams(SQLQuery sqlQuery, Object[] values){
		for(int i=0;i<values.length;i++){
			sqlQuery.setParameter(i, values[i]);
		}
	}
	//执行hql语句并分页
	public List executeQueryHql(String hql, Object[] values, int firstResult, int maxResult){
		Session session = getSessionFactory().openSession();
		Transaction t = session.getTransaction();
		t.begin();
		Query query = session.createQuery(hql);
		if(values!=null && values.length>0){
			fillQueryParams(query, values);
		}
		if(firstResult!=-1 && maxResult!=-1){
			query.setFirstResult(firstResult).setMaxResults(maxResult);
		}
		List lists = query.list();
		t.commit();
		session.close();
		return lists;
	}
	public void fillQueryParams(Query query, Object[] values){
		for(int i=0;i<values.length;i++){
			query.setParameter(i, values[i]);
		}
	}
	
	//增加
	public void add(Object o){
		getHibernateTemplate().save(o);
	}
	//删除
	public void delete(Object o){
		getHibernateTemplate().delete(o);
	}
	//修改
	public void update(Object o){
		getHibernateTemplate().update(o);
	}
	//查询单个对象
	public T getByInt(Class<T> classType, int id){
		return (T) getHibernateTemplate().get(classType, id);
	}
	//查询单个对象
	public T get(Class<T> classType, long id){
		return (T) getHibernateTemplate().get(classType, id);
	}
	//根据条件更新
	public boolean update(String sql, String[] paramNames, Object[] values){
		Session s = getSessionFactory().openSession();
		Transaction t = s.getTransaction();
		t.begin();
		Query q = s.createQuery(sql);
		fillQueryParams(q, paramNames, values);
		boolean flag = q.executeUpdate()>0?true:false;
		t.commit();
		s.close();
		return flag;
	}
	//根据条件更新
	public boolean updateSql(String sql,Object[] values){
		Session s = getSessionFactory().openSession();
		Transaction t = s.getTransaction();
		t.begin();
		SQLQuery q = s.createSQLQuery(sql);
		fillQueryParams3(q, values);
		boolean flag = q.executeUpdate()>0?true:false;
		t.commit();
		s.close();
		return flag;
	}
	//根据条件更新2
	public boolean updateHql(String sql, Object[] values){
		Session s = getSessionFactory().openSession();
		Transaction t = s.getTransaction();
		t.begin();
		Query q = s.createQuery(sql);
		fillQueryParams2(q, values);
		boolean flag = q.executeUpdate()>0?true:false;
		t.commit();
		s.close();
		return flag;
	}
	//根据条件查询对象集合
	public List<T> queryList(String sql, String[] paramNames, Object[] values){
		List<T> all  = null;
		if(paramNames==null){
			all = (List<T>) getHibernateTemplate().find(sql, values);
		}else{
			all = (List<T>) getHibernateTemplate().findByNamedParam(sql, paramNames, values);
		}
		return all;
	}
	//根据条件查询排序并分页
	public List<T> queryListWithOrderAndPage
			(String sql, String[] paramNames, Object[] values, int firstResult, int maxResult){
		List<T> all  = null;
		if(firstResult<0 || maxResult<0){
			all = (List<T>) getHibernateTemplate().findByNamedParam(sql, paramNames, values);
		}else{
//			all = (List<Book>) getHibernateTemplate().execute(new org.springframework.orm.hibernate3.HibernateCallback() {
			Session session = getSessionFactory().openSession();
			Query query = session.createQuery(sql);
			fillQueryParams(query, paramNames, values);
			all = query.setFirstResult(firstResult).setMaxResults(maxResult).list();
			session.close();
		}
		return all;
	}
	//根据条件进行报表查询或查询单个对象
	public Object queryReportQueryByParams(String sql, String[] paramNames, Object[] values){
//		System.out.println("ddd");
		Object queryResult = getHibernateTemplate().findByNamedParam(sql, paramNames, values);
//		System.out.println(queryResult);
		return queryResult;
	}
	//填充属性值
	public void fillQueryParams(Query query, String[] paramNames, Object[] values){
		for(int i=0;i<paramNames.length;i++){
//			System.out.println(paramNames[i] + ":" + values[i]);
			if(values[i].getClass().isArray() || values[i] instanceof List || values[i] instanceof Set){
				List vals = (List)values[i];
				query.setParameterList(paramNames[i], vals);
			}else{
				query.setParameter(paramNames[i], values[i]);
			}
		}
	}
	//填充属性值2
	public void fillQueryParams2(Query query, Object[] values){
		for(int i=0;i<values.length;i++){
				query.setParameter(i, values[i]);
		}
	}
	//填充属性值2
	public void fillQueryParams3(SQLQuery query, Object[] values){
		for(int i=0;i<values.length;i++){
				query.setParameter(i, values[i]);
		}
	}
	//根据关联表条件查询集合
	public List queryObjectsListByParams(String sql, String[] paramNames, Object[] values){
//		System.out.println("fff");
		return getHibernateTemplate().findByNamedParam(sql, paramNames, values);
	}
	//根据关联表条件查询集合并分页
	public List queryObjectsListByParamsWithOrderAndPage(String sql, String[] paramNames, Object[] values, int firstResult, int maxResult){
		List<T> all  = null;
		if(firstResult<0 || maxResult<0){
			all = (List<T>) getHibernateTemplate().findByNamedParam(sql, paramNames, values);
		}else{
			Session session = getSessionFactory().openSession();
			Query query = session.createQuery(sql);
			fillQueryParams(query, paramNames, values);
			all = query.setFirstResult(firstResult).setMaxResults(maxResult).list();
			session.close();
		}
		return all;
	}
}
