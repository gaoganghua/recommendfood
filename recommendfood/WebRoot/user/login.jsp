<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
<!--     <title>My JSP 'login.jsp' starting page</title> -->
    <title>荐食网——全球最大的美食网站</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="css/login.css">	
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
	<script type="text/javascript">
	$(function(){
		var ss ;
		var getsafecode = function(){
			$.post("login!safecode", {}, function(data){
				data = eval('(' + data+ ')');
				if(data.success==true){
					$("span[name='safecode']").text(data.data[0]);
					ss = data.data[1];
				}
			})
		}
		//解析是否有原来的地址
		var getoldurl = function(){
			var url=null;
			if($.trim($("input[name='oldUrl']").val())!=''){
				url="oldUrl="+$.trim($("input[name='oldUrl']").val())+"&";
				if($.trim($("input[name='noteId']").val())!=''){
					url=url+"noteId="+$.trim($("input[name='noteId']").val())+"&";
				}
				if($.trim($("input[name='childUrl']").val())!=''){
					url=url+"childUrl="+$.trim($("input[name='childUrl']").val()+"&");
				}
				url=url.substr(0, url.length-1);
				return url;
			}
			return url;
		}
		//注册
		$("div.forget-area a span.register").click(function(){
			url = getoldurl();
			window.location.href="login!registerPage?"+url;
		})
		//
		//点击登陆
		$("div.btn-area button").click(function(){
			var formdata = new FormData();
			var logininfo = $("div.first-input input[name='logininfo']").val();
			var psd = $("div.second-input input[name='password']").val();
			var safecode = $("input[name='safecode']").val();
// 			alert(logininfo+":"+psd);
			if($.trim(logininfo)==""){
				alert("用户名未填写");
				return false;
			}
			if($.trim(psd)==""){
				alert("密码未填写");
				return false;
			}
			if($.trim(safecode)==""){
				alert("验证码未填写");
				return false;
			}
			if(safecode.toLowerCase()!=ss.toLowerCase()){
				alert("验证码不正确");
				return false;
			}
			$.post("login!loginIn", {"loginInfo":logininfo, "loginPassword":psd, "safecode":safecode}, function(data){
				data = eval('(' +data + ')');
				if(data.success == true){
					//如果有原来的地址
					if($.trim($("input[name='oldUrl']").val())!=''){
// 						window.history.go(-1);
						var url=$.trim($("input[name='oldUrl']").val())+"?";
						if($.trim($("input[name='noteId']").val())!=''){
							url=url+"noteId="+$.trim($("input[name='noteId']").val())+"&";
						}
						if($.trim($("input[name='childUrl']").val())!=''){
							url=url+"childUrl="+$.trim($("input[name='childUrl']").val()+"&");
						}
						if($.trim($("input[name='relUrl']").val())!=''){
							url=url+"relUrl="+$.trim($("input[name='relUrl']").val()+"&");
						}
						url=url.substr(0, url.length-1);
						alert(url);
						window.location.href=url;
						return ;
					}
					window.location.href="systemmanager/usercenteraction";
				}else{
					alert(data.msg);
					getsafecode();
					$("input[name='safecode']").val('');
				}
			})
		})
		getsafecode();
	})
	</script>
  </head>
  
  <body>
  	<input type="hidden" name="oldUrl" value="<s:property value="oldUrl" />"/>
  	<input type="hidden" name="childUrl" value="<s:property value="childUrl" />"/>
  	<input type="hidden" name="relUrl" value="<s:property value="relUrl" />"/>
  	<input type="hidden" name="noteId" value="<s:property value="noteId" />"/>
    <div class="whole">
	    <div class="login-area">
	    	<div class="first-input">
	    		<input type="text" name="logininfo" placeholder="手机号或者邮箱号"  oninput="this.style.color='white'"></input>
	    	</div>
	    	<div class="second-input">
	    		<input type="password" name="password" placeholder="密码"  oninput="this.style.color='white'"></input>
	    	</div>
	    	<div class="three-input">
	    		<span name="safecode"></span>
	    		<input type="text" name="safecode"  oninput="this.style.color='black'"></input>
	    	</div>
	    	<div class="forget-area">
	    		<span class="none-number">没有帐号？</span>
	    		<a><span class="register">去注册</span></a>
	    		<a><span class="forget">忘记密码？</span></a>
	    	</div>
	    	<div class="btn-area">
	    		<button>确&nbsp;&nbsp;认</button>
	    	</div>
	    </div> 
	</div>
  </body>
</html>
