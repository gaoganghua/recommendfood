package com.recommendfood.interceptor;

import java.util.Map;

import javax.persistence.NoResultException;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

//回帖和发帖的登陆控制
public class NoteInterceptor extends MethodFilterInterceptor{
	private final static String No_Register="no_register";
	private final static String Register="register";
	private final static String LOGIN_USER="login_user";
	
	@Override
	protected String doIntercept(ActionInvocation arg0) throws Exception {
		Map<String, Object> session = arg0.getInvocationContext().getSession();
//		System.out.println(session.get(LOGIN_USER));
		if(session.get(LOGIN_USER)!=null){
			System.out.println("interceptor");
			return arg0.invoke();
		}
		System.out.println("no_register");
		arg0.getInvocationContext().getValueStack().set("jsondata", false);
		return No_Register;
	}

}
