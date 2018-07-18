<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags"  prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>荐食网——全球最大的美食网站</title>
	<meta charset="utf-8">
		
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="css/indexStyle.css">	
	<link rel="stylesheet" type="text/css" href="css/personalStyle.css">
	<script type="text/javascript" src="js/recommendRright.js"></script>
	<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
	<script type="text/javascript">
	$(function(){
		$("input[name='modifyuser']").click(function(){
			window.location.href="systemmanager/usercenteraction!modifyUser";
		})
		$("input[name='recommendfood']").click(function(){
			window.location.href="systemmanager/foodaction!recommendFoodPage";
		})
		//查询
		$(".navigationGlass").click(function(){
			var foodinfo = $("input[name='navigationInputText']").val();
			window.location.href="systemmanager/foodaction!searchFood?queryinfo="+foodinfo;
			//跳转到搜索结果页面，传值。
		})
		//下划线
		$("ul[name='ullist'] li a").click(function(){
			$("ul[name='ullist'] li a").css("text-decoration", "none");
			$(this).css("text-decoration", "underline");
		})
		
		var underliner = function(){
			$("ul[name='ullist'] li a:first").css("text-decoration", "underline");
		}
		underliner();
	})
	</script>
  </head>
  
  <body>
    <jsp:include page="common/head.jsp"></jsp:include>
	
	<div class="wholeback">
		<div class="head-picture-area">
			<div class="head-picture">
				<s:if test="#session.login_user==null || #session.login_user.photo==''">
					<img src="resource/pic/commonphoto.png" width="240px" height="240px">
				</s:if>
				<s:else>
					<img src='<s:property value="#request.user.photo"/>' width="240px" height="240px">
				</s:else>
			</div>
			<div class="zhi-picture">
				<img src="images/personalcenter/值.png"><br>
				<input name="modifyuser" value="修改信息" type="button"></input>
				<input name="recommendfood" value="上传作品" type="button" class="buttonstyle">
				</input>
			</div>
		</div>
		<div class="user-name-area">
			<s:property value="#request.user.loginName"/>
		</div>
		<div class="personality-name">
			<s:property value="#requset.user.notes"/>
		</div>

		<div class="navigation2">		
			<div class="navigation-two" style="background-image: url(images/personalcenter/小导航-底.png)">
				<ul name="ullist">
					<li><a href="systemmanager/usercenteraction!userRecommends" target="iframehh" >我的作品</a></li>
					<li>┊</li>
					<li><a href="systemmanager/usercenteraction!userFavorites" target="iframehh" >我的收藏</a></li>
					<li>┊</li>
					<li><a href="systemmanager/usercenteraction!userComments" target="iframehh">我的评论</a></li>
					<li>┊</li>
					<li><a href="systemmanager/usercenteraction!userNotes" target="iframehh">我的帖子</a></li>
				</ul>				
			</div>
			
		</div>


		<div class="changepage">
			<iframe src="systemmanager/usercenteraction!userRecommends" name="iframehh" id="changeInfo" frameBorder=0 marginwidth=0 marginheight=0 style="width:100%;height:100%;" scrolling="no" ALLOWTRANSPARENCY="true" onload="setIframeHeight(this)"></iframe>
			
		</div>

		<div></div>

	</div>
  </body>
</html>
