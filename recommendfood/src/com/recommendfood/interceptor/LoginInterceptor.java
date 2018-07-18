package com.recommendfood.interceptor;

import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import com.recommendfood.action.AdminManagerAction;
import com.recommendfood.action.LoginAction;
import com.recommendfood.action.UserCenterAction;
import com.recommendfood.action.UserCenterAjaxAction;
import com.recommendfood.model.User;
import com.recommendfood.util.JsonUtil;

public class LoginInterceptor implements Interceptor{
	private final static String LOGIN = "login";
	private final static String LOGIN_AJAX="loginajax";
	private final static String LOGIN_AMDIN="admin";
	private final static String LOGIN_USER="user";
	private String jsondata;//json

	
	public String getJsondata() {
		return jsondata;
	}

	public void setJsondata(String jsondata) {
		this.jsondata = jsondata;
	}
	@Override
	public String intercept(ActionInvocation arg0) throws Exception {
		Object action =  arg0.getAction();
		
		Map<String, Object> session = arg0.getInvocationContext().getSession();
		if(session.get("login_user")!=null){
			User u = (User) session.get("login_user");
			if(u.getUserType()==1 && action.getClass()==AdminManagerAction.class){
				return LOGIN_USER;
			}
			if(u.getUserType()==2 && action.getClass()==UserCenterAction.class){
				return LOGIN_AMDIN;
			}
			return arg0.invoke();
		}
		else{
			if(action.getClass()==UserCenterAjaxAction.class){
				setJsondata(JsonUtil.ajax(false, "请先登录"));
				return LOGIN_AJAX;
			}
			return LOGIN;
		}
//		return arg0.invoke();
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void init() {
		// TODO Auto-generated method stub
		
	}

}
