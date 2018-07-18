<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'head.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<!-- 	<link rel="stylesheet" type="text/css" href="css/indexStyle.css">	 -->
	<link rel="stylesheet" type="text/css" href="./css/head.css">	
  </head>
  
  <body>
<!--     <div class="navigation-search"> -->
<!-- 		<div class="navigation"> -->
<!-- 	 		<div class="navigationBack"> -->
<!-- 	 			<img src="images/navigation/导航栏.png"> -->
<!-- 	 		</div> -->
<!-- 			<div class="navigationLogo"> -->
<!-- 	 			<img src="images/navigation/荐食网.png"> -->
<!-- 	 		</div> 		 -->
<!-- 			<div class="navigationText"> -->
<!-- 				<ul> -->
<!-- 					<li><a href="index">首页</a></li> -->
<!-- 					<li>/</li> -->
<!-- 					<li><a>美食推荐</a></li> -->
<!-- 					<li>/</li> -->
<!-- 					<li><a>美食分类</a></li> -->
<!-- 					<li>/</li> -->
<!-- 					<li><a>美食专区</a></li> -->
<!-- 					<li>/</li> -->
<!-- 					<li><a>商家推荐</a></li> -->
<!-- 					<li>/</li> -->
<!-- 					<li><a>社区</a></li> -->
<!-- 					<li>/</li> -->
<!-- 					<li><a href="systemmanager/usercenteraction!execute">个人中心</a></li> -->
<!-- 					<li>/</li> -->
<!-- 					<li name="loginin"><a href="login!loginPage">登陆</a></li> -->
<!-- 				</ul> -->
<!-- 			</div> -->
<!-- 	 	</div> -->
<!-- 	 	<div class="search"> -->
<!-- 	 		<div class="navigationSelect"> -->
<!-- 				<img src="images/navigation/搜索框.png"> -->
<!-- 			</div> -->
<!-- 			<div class="navigationInputText"> -->
<!-- 				<input type="text" name="navigationInputText"> -->
<!-- 			</div> -->
<!-- 			<div class="navigationGlass"> -->
<!-- 				<img src="images/navigation/放大镜.png"> -->
<!-- 			</div> -->
<!-- 	 	</div> -->
<!-- 	</div> -->
		<div class="navigation-search">
		<div class="navigation">
	 		<div class="navigationBack">
	 			<img src="images/navigation/导航栏.png">
	 		</div>
			<div class="navigationLogo">
	 			<img src="images/navigation/荐食网.png">
	 		</div> 		
			<div class="navigationText">
				<ul>
					<li><a href="index">首页</a></li>
					<li>/</li>
					<li><a href="commoncommunity/recommend!index">美食推荐</a></li>
					<li>/</li>
					<li><a>美食分类</a></li>
					<li>/</li>
					<li><a>美食专区</a></li>
					<li>/</li>
					<li><a>商家推荐</a></li>
					<li>/</li>
					<li><a href="commoncommunity/community!index">社区</a></li>
					<li>/</li>
					<li><a href="systemmanager/usercenteraction!execute">个人中心</a></li>
					<li>/</li>
					<li name="loginin">
						<s:if test="#session.login_user==null">
							<a href="login!loginPage">登陆</a>
						</s:if>
						<s:else>
							<a href="login!loginOut">退出</a>
						</s:else>
					</li>
				</ul>
			</div>
	 	</div>
	 	<div class="search">
	 		<div class="navigationSelect">
				<img src="images/navigation/搜索框.png">
			</div>
			<div class="navigationInputText">
				<input type="text" name="navigationInputText">
			</div>
			<div class="navigationGlass">
				<img src="images/navigation/放大镜.png">
			</div>
	 	</div>
	</div>
  </body>
</html>
