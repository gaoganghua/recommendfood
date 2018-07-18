package com.recommendfood.daoimpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.recommendfood.model.User;
import com.recommendfood.util.SearchObject;

public class UserDaoIml extends BaseDaoImpl{
	//检验登陆
	public boolean check(User u){
		String sql = "from User u where (u.phone=:phone or u.email=:email) and loginPassword=:loginPassword";
		String[] paramNames = {"phone", "email", "loginPassword"};
		Object[] values = {u.getPhone(), u.getEmail(), u.getLoginPassword()};
		List<User> lists = (List<User>) super.getHibernateTemplate().findByNamedParam(sql, paramNames, values);
		return (lists!=null && lists.size()>0)?true:false;
	}
	//修改用户信息
	public boolean updateUser(String sql, Object[] values){
		int n = getHibernateTemplate().bulkUpdate(sql, values);
		return n>0?true:false;
	}
}
