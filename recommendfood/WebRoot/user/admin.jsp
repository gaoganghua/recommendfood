<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	<link rel="stylesheet" type="text/css" href="css/manage.css">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
	<script type="text/javascript">
	$(function(){
		//查询
		$(".navigationGlass").click(function(){
			var foodinfo = $("input[name='navigationInputText']").val();
			window.location.href="systemmanager/foodaction!searchFood?queryinfo="+foodinfo;
			//跳转到搜索结果页面，传值。
		})
	})
	</script>
  </head>
  
  <body>
  	<jsp:include page="common/head.jsp"></jsp:include>
	<div class="wholepage">
		<div class="left-area">
			<div class="user-headpic-area">
				<a href="systemmanager/adminmanager!userControl" target="iframehh"><img src="images/user/用户管理-未选中.png"></a>
			</div>
			<div class="check-headpic-area">
				<a href="systemmanager/adminmanager!reviewFood" target="iframehh"><img src="images/user/审核申请-未选中.png"></a>
			</div>
		</div>
		<div class="changepage">
			<iframe src="systemmanager/adminmanager!userControl" name="iframehh" id="changeInfo" frameBorder=0 marginwidth=0 marginheight=0 style="width:100%;height:1200px;" scrolling="yes" ALLOWTRANSPARENCY="true" onload="setIframeHeight(this)">
			</iframe>
			<!-- <div style="clear:both"></div> -->
		</div>
	</div>
  </body>
</html>
