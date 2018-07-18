package com.recommendfood.action;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.recommendfood.factory.DatabaseFactory;
import com.recommendfood.model.User;
import com.recommendfood.service.UserService;
import com.recommendfood.util.FileUtil;
import com.recommendfood.util.FormatUtil;
import com.recommendfood.util.JsonUtil;
import com.recommendfood.util.SearchObject;
import com.recommendfood.util.SearchUtil;
import com.recommendfood.util.StringUtil;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

public class LoginAction extends CommonAction implements ModelDriven<User>{
	private User user = new User();
	private File file;//头像
	private String fileFileName;
	private String fileContentType;
	private String safecode;//验证码
	private String oldUrl;//原来的url地址
	private String childUrl;//子页面的地址
	private String relUrl;//真正页面的地址
	private Integer noteId;//主帖子的id
	
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public File getFile() {
		return file;
	}
	public void setFile(File file) {
		this.file = file;
	}
	public String getFileFileName() {
		return fileFileName;
	}
	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}
	public String getFileContentType() {
		return fileContentType;
	}
	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}
	public String getSafecode() {
		return safecode;
	}
	public void setSafecode(String safecode) {
		this.safecode = safecode;
	}
	public String getOldUrl() {
		return oldUrl;
	}
	public void setOldUrl(String oldUrl) {
		this.oldUrl = oldUrl;
	}
	public String getChildUrl() {
		return childUrl;
	}
	public void setChildUrl(String childUrl) {
		this.childUrl = childUrl;
	}
	public Integer getNoteId() {
		return noteId;
	}
	public void setNoteId(Integer noteId) {
		this.noteId = noteId;
	}
	public String getRelUrl() {
		return relUrl;
	}
	public void setRelUrl(String relUrl) {
		this.relUrl = relUrl;
	}
	@Override
	public String execute() throws Exception {
		
		return SUCCESS;
	}
	//登陆页
	public String loginPage(){
		System.out.println(getOldUrl());
		return "loginpage";
	}
	//注册页
	public String registerPage(){
		return "registerpage";
	}
	//登陆
	public String loginIn(){
		try{
			String safecode2 = (String) ServletActionContext.getRequest().getAttribute("safecode");
			ServletActionContext.getRequest().removeAttribute("safecode");
//			System.out.println(safecode2.equalsIgnoreCase(getSafecode()));
			if(!safecode2.equalsIgnoreCase(getSafecode())){
				setJsondata(JsonUtil.ajax(false, "验证码不正确"));
			}else{
				UserService us = DatabaseFactory.getUserService(ServletActionContext.getServletContext());
				
				List<SearchObject> searchLists = new ArrayList<SearchObject>();
				searchLists.add(SearchUtil.add(false, "phone", user.getLoginInfo(), "="));
				searchLists.add(SearchUtil.add(true, "email", user.getLoginInfo(), "="));
				List<SearchObject> seaLists = new ArrayList<SearchObject>();
				seaLists.add(SearchUtil.add(false, searchLists));
				seaLists.add(SearchUtil.add(false, "loginPassword",user.getLoginPassword(), "="));
				seaLists.add(SearchUtil.add(false, "status",0, "!="));
				List<User> users = us.findUserListByParams(seaLists);
	//			System.out.println(users.size());
				if(users==null || users.size()<1){
					setJsondata(JsonUtil.ajax(false, "账号或密码错误"));
				}else{
					getSession().put(LOGIN_USER, users.get(0));
					setJsondata(JsonUtil.ajax(true, null));
				}
			}
		}catch (Exception e) {
			setJsondata(JsonUtil.ajax(false, "账号或密码错误"));
			setMessage("系统出现故障");
		}
		
		return "loginin";
	}
	//注册
	public String register(){
		try{
			UserService us = DatabaseFactory.getUserService(ServletActionContext.getServletContext());
			
			List<SearchObject> searchLists = new ArrayList<SearchObject>();
			searchLists.add(SearchUtil.add(false, "phone", user.getPhone(), "="));
			searchLists.add(SearchUtil.add(true, "email", user.getEmail(), "="));
			List<SearchObject> seaLists = new ArrayList<SearchObject>();
			seaLists.add(SearchUtil.add(false, searchLists));
			List<User> users = us.findUserListByParams(seaLists);
			String msg = null;
			if(users!=null && users.size()>0){
				msg = "此账号已被注册";
				setJsondata(JsonUtil.ajax(false, msg));
			}else{
				user.setStatus(1);
				user.setUserType(1);
//				us.save(user);
				if(user.getAddressProvice()!=null &&!("").equals(user.getAddressProvice())&&user.getAddressCity()!=null&&!("").equals(user.getAddressCity())){
					user.setAddress(user.getAddressProvice()+"-"+user.getAddressCity());
				}
				if(file!=null){
					String userphoto = FileUtil.uploadFile(file, fileFileName, fileContentType, "userphoto", -1, ServletActionContext.getServletContext());
					user.setPhoto(userphoto);
				}else{
					user.setPhoto("resource/pic/commonphoto.png");
				}
				us.save(user);
				setJsondata(JsonUtil.ajax(true, msg));
			}
		}catch (Exception e) {
			setMessage("系统出现故障");
		}
		return "register";
	}
	//退出
	public String loginOut(){
		try{
			getSession().remove(LOGIN_USER);
		}catch (Exception e) {
			setMessage("系统出现故障");
		}
		return "loginout";
	}
	public String safecode(){
		String[] ss = StringUtil.getSafeCode();
		List<String> safecode = Arrays.asList(ss);
		ServletActionContext.getRequest().setAttribute("safecode", ss[1]);
		setJsondata(JsonUtil.ajax(true, null, safecode));
		
		return "safecode";
	}
	@Override
	public User getModel() {
		return this.user;
	}
}