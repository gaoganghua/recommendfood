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
    
    <title>My JSP 'index.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/searchresult.css">	
	<link rel="stylesheet" href="css/communityindex.css" charset="utf-8" type="text/css"> 
	<!-- jQuery文件。务必在bootstrap.min.js之前引入 -->
	<script src="js/jquery-3.2.1.min.js"></script>
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="resource/bootstrap/js/bootstrap.min.js"></script>
	<!-- 新 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="css/bootstrap/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/manage.css">
	<script type="text/javascript">
	$(function(){
		if($("input[name='message']").val()!=''){
			alert($("input[name='message']").val())
		}
		//上一页
		$(".beforepagebtn").click(function(){
			var page = parseInt($("div.page").text())-1;
// 			var queryinfo = $("input[name='queryinfo']").val();
			window.location.href="commoncommunity/recommend!index?pageIndex="+page;
		})
		//下一页
		$(".afterpagebtn").click(function(){
			var page = parseInt($("div.page").text())+1;
			window.location.href="commoncommunity/recommend!index?pageIndex="+page
		})
		//查看美食的详情
		$("img[name='foodimg']").click(function(){
			var foodid = $(this).parent().parent("div.pic-area-2").attr("name");
// 			var query = $("input[name='query']").val();
			window.location.href="systemmanager/foodaction!foodInfo?foodId="+foodid+"&queryinfo="+query;
		})
		$("p.caiming").click(function(){
			var foodid = $(this).parent().parent("div.pic-area-2").attr("name");
// 			var query = $("input[name='query']").val();
			window.location.href="systemmanager/foodaction!foodInfo?foodId="+foodid+"&queryinfo="+query;
		})
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
    <jsp:include page="../common/head.jsp"></jsp:include>
	<div class="xiaodaohang-area">
		<div class="moren">
			默认排序
		</div>
		<div class="time">
			发布时间
		</div>
		<div class="redu">
			热度
		</div>
		<div class="renqi">
			人气
		</div>
		<div class="kong"></div>
	</div>

	<div class="pic-area">
		<div class="pic-areainside">
			<input type="hidden" value='<s:property value="message"/>' name="message">
			
			<s:iterator value="dataList" status="index" step="status">
				<div class="pic-area-2" name='<s:property value="id"/>'>
					<span><img  name="foodimg" src='<s:property value="pictures"/>' width="300px" height="300px"></span>
					<p class="caiming"><s:property value="name"/></h6>
					<p class="pinglun-dianzan-area">
						<img src="images/searchresult/评论.png">
						评论(<s:property value="commentTotal"/>)&nbsp;&nbsp;&nbsp;
						<img src="images/searchresult/赞.png">
						点赞(<s:property value="thumbsupTotal"/>)
					</p>
					<p class="foodstyle">/<s:property value="foodType"/>/</p>
				</div>
			</s:iterator>
			<div class="btn-area">
				<button class="beforepagebtn">上一页</button>
				<div class="page"><s:property value="pageIndex"/></div>
				<button class="afterpagebtn">下一页</button>
			</div>
		</div>
	</div>
		
  </body>
</html>

