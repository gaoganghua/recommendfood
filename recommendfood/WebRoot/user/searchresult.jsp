<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
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
	<link rel="stylesheet" type="text/css" href="css/searchresult.css">	
    
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
		$(".beforepagebtn").click(function(){
			var page = parseInt($("div.page").text())-1;
			var queryinfo = $("input[name='queryinfo']").val();
			window.location.href="systemmanager/foodaction!searchFood?queryinfo="+queryinfo+"&pageIndex="+page;
		})
		$(".afterpagebtn").click(function(){
			var page = parseInt($("div.page").text())+1;
			var queryinfo = $("input[name='queryinfo']").val();
			window.location.href="systemmanager/foodaction!searchFood?queryinfo="+queryinfo+"&pageIndex="+page;
		})
		$("img[name='foodimg']").click(function(){
			var foodid = $(this).parent().parent("div.pic-area-2").attr("name");
			var query = $("input[name='query']").val();
			window.location.href="systemmanager/foodaction!foodInfo?foodId="+foodid+"&queryinfo="+query;
// 			window.location.href="systemmanager/foodaction!foodInfo?foodId="+foodid;
		})
		$("p.caiming").click(function(){
			var foodid = $(this).parent().parent("div.pic-area-2").attr("name");
			var query = $("input[name='query']").val();
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
    <jsp:include page="common/head.jsp"></jsp:include>
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
			<input type="hidden" value='<s:property value="queryinfo"/>' name="query">
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
		</div>
	</div>
<!-- 		<div class="pic-area-2"> -->
<%-- 				<span><img src="images/searchresult/酸辣牛肉面.png"></span> --%>
<!-- 				<p class="caiming">酸辣牛肉面</h6> -->
<!-- 				<p class="pinglun-dianzan-area"> -->
<!-- 					<img src="images/searchresult/评论.png"> -->
<!-- 					评论(289)&nbsp;&nbsp;&nbsp; -->
<!-- 					<img src="images/searchresult/赞.png"> -->
<!-- 					点赞(1289) -->
<!-- 				</p> -->
<!-- 				<p class="foodstyle">/中餐/</p> -->
<!-- 		</div> -->
		<input type="hidden" name="queryinfo" value='<s:property value="queryinfo"/>'>
		<div class="btn-area">
			<button class="beforepagebtn">上一页</button>
			<div class="page"><s:property value="pageIndex"/></div>
			<button class="afterpagebtn">下一页</button>
		</div>
  </body>
</html>
