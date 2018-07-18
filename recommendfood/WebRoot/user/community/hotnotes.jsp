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
    
    <title>My JSP 'hotnotes.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<!-- 	<link rel="stylesheet" href="css/communityindex.css" charset="utf-8" type="text/css">  -->
	<!-- jQuery文件。务必在bootstrap.min.js之前引入 -->
	<script src="js/jquery-3.2.1.min.js"></script>
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="resource/bootstrap/js/bootstrap.min.js"></script>
	<!-- 新 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="css/bootstrap/bootstrap.min.css">
	<style type="text/css">
		body{
			background-color:#4a4a4a;
			line-height:1.5;
		}
		.row a{
			color:#f5a623;
			cursor: pointer;
		}
		.title{
			font-size:25px;
		}
		.content{
			color:#999;
			font-size:21px;
		}
		.btm {
			color:#777;
		}
		.btm2{
			color:#777;
			text-align: left;
		}
	</style>
	<script type="text/javascript">
	$(function(){
		//菜单栏选择
		$("ul.navbar li", window.parent.document).click(function(){
			$("li.selectli", window.parent.document).find("a").css("text-decoration", "none");
			$("li.selectli", window.parent.document).attr("class", "");
			$(this).attr("class", "selectli");
			$(this).find("a").css("text-decoration", "underline");
		})
	})
	</script>
  </head>
  
  <body>
    <div class="container">
		<s:iterator value="notes">
			<br>
	    	<div class="row">
	    		<div class="col-md-8 strong title"><a href="commoncommunity/community!noteInfo?noteId=<s:property value="id"/>">【<s:property value="title"/>】</a></div>
	    		<div class="col-md-3 text-center btm2">评论量：<s:property value="commentTotal"/></div>
	    		<div class="col-md-12 content"><s:property value="noteMsg"/></div>
	    		<div class="col-md-2 pull-left btm"><s:property value="userName"/></div>
	    		<div class="col-md-3 pull-left btm" ><s:date name="noteTime" format="yyyy-MM-dd HH:mm" /></div>
	    	</div>
		</s:iterator>
     </div>
  </body>
</html>
