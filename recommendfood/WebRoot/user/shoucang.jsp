<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'shoucang.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="css/shoucang.css">	
<script type="text/javascript" src="resource/js/jquery-3.0.0.js"></script>
	<script type="text/javascript">
	$(function(){
		$("div[class^='shoucang-area-one'] p.caiming").mouseover(function(){
			$(this).css("opacity", "0.5");
		})
		$("div[class^='shoucang-area-one'] p.caiming").mouseout(function(){
			$(this).css("opacity", "1");
		})
		$("div[class^='shoucang-area-one'] span img").mouseover(function(){
			$(this).css("opacity", "0.5");
		})
		$("div[class^='shoucang-area-one'] span img").mouseout(function(){
			$(this).css("opacity", "1");
		})
		$("div[class^='shoucang-area-one'] .pinglun-dianzan-area font").mouseover(function(){
			$(this).css("opacity", "0.5");
		})
		$("div[class^='shoucang-area-one'] .pinglun-dianzan-area font").mouseout(function(){
			$(this).css("opacity", "1");
		})
		$("div[class^='shoucang-area-one'] p img[class='dianzanimg']").mouseover(function(){
			$(this).css("color", "red");
		})
		$("div[class^='shoucang-area-one'] p img[class='dianzanimg']").mouseout(function(){
			$(this).css("color", "white");
		})
		//查看美食详细信息通过照片
		$("div[class^='shoucang-area-one'] span img").click(function(){
			top.location.href="systemmanager/foodaction!foodInfo?foodId="+$(this).attr("name");
		})
		//查看美食详细信息通过名字
		$("div[class^='shoucang-area-one'] p.caiming").click(function(){
			top.location.href="systemmanager/foodaction!foodInfo?foodId="+$(this).attr("name");
		})
		//点赞
		$("div[class^='shoucang-area-one'] p img[class='dianzanimg']").click(function(){
// 			alert($(this).attr("name"));
			var currentNode = this;
			var params = {"foodId": $(this).attr("name")};
			if($(this).next("font:first").attr("name")!="true"){//点赞
				$.post("systemmanager/usercenterajax!userThumbsup", params, function(data){
					data = eval('(' + data+ ')');
					if(data.success==false){
						$(currentNode).next("font:first").css("color", "red");
						$(currentNode).next("font:first").attr("name", "true");
						alert(data.msg);
					}else if(data.success==true){
// 						alert("true");
						var currentFont = $(currentNode).next("font:first").text();
						var currentTotal = currentFont.substring(currentFont.indexOf("(")+1, currentFont.indexOf(")"));
						var currentText = currentFont.substring(0,currentFont.indexOf("(")+1)+(parseInt(currentTotal)+1)+currentFont.substring(currentFont.indexOf(")"))
						$(currentNode).next("font:first").text(currentText);
						$(currentNode).next("font:first").css("color", "red");
						$(currentNode).next("font:first").attr("name", "true");
					}
				})
			}else{//取消点赞
				$.post("systemmanager/usercenterajax!userThumbsupCancel", params, function(data){
					data = eval('(' + data+ ')');
					if(data.success==false){
						$(currentNode).next("font:first").css("color", "white");
						$(currentNode).next("font:first").attr("name", "");
						alert(data.msg);
					}else if(data.success==true){
						var currentFont = $(currentNode).next("font:first").text();
						var currentTotal = currentFont.substring(currentFont.indexOf("(")+1, currentFont.indexOf(")"));
						var currentText = currentFont.substring(0,currentFont.indexOf("(")+1)+(parseInt(currentTotal)-1)+currentFont.substring(currentFont.indexOf(")"))
						$(currentNode).next("font:first").text(currentText);
						$(currentNode).next("font:first").css("color", "white");
						$(currentNode).next("font:first").attr("name", "");
					}
				})
			}
		})
// 		查看评论
// 		$("div[class^='shoucang-area-one'] .pinglun-dianzan-area font.pinglunfont").click(function(){
// 			alert($(this).attr("name"))
// 		})
		$("div[class^='shoucang-area-one'] .shoucangcancel").click(function(){
			//alert("fff");
// 			alert($(this).attr('name'));
			var currentNode = this;
			var params = {"foodId": $(this).attr("name")};
			$.post("systemmanager/usercenterajax!favoriteCancel", params, function(data){
				data = eval('(' +data + ')');
				if(data.success==true){
					$(currentNode).parent().parent().remove();
				}else if(data.success==false){
					alert(data.msg);
				}
			})
		})
	})
	</script>
  </head>
  
  <body>
    <div class="shoucang-area-one">
    	<s:iterator value="dataList" step="singledata" status="index">
	    		<div class="shoucang-area-one-5">
					<span>
						<img src='<s:property value="foodPictures"/>' width="300px" height="300px" name='<s:property value='foodId'/>'>
					</span>
					<p class="caiming" name='<s:property value='foodId'/>'><s:property value="foodName"/> </h6>
					<p class="pinglun-dianzan-area">
						<img src="images/shoucang/评论.png">
						<font class="pinglunfont" name='<s:property value='foodId'/>'>评论(<s:property value="commentTotal"/>)</font>&nbsp;&nbsp;&nbsp;
						<img src="images/shoucang/赞.png" class="dianzanimg" name='<s:property value='foodId'/>'>
						<s:if test="thumbsup==true">
							<font class="dianzanfont" name="true" style="color: red"/>点赞(<s:property value="thumbsupTotal"/>)</font>
						</s:if>
						<s:else>
							<font class="dianzanfont" />点赞(<s:property value="thumbsupTotal"/>)</font>
						</s:else>
						<font class="shoucangcancel" name='<s:property value='foodId'/>'>取消收藏</font>
						<p class="shoucangshijian-1">
						<font class="shoucangdate">收藏时间：<s:date name="collectTime" format="yyyy-MM-dd"/></font>
						</p>
					</p>
					<p class="foodstyle">/<s:property value="foodTypes"/>/ </p>
				</div>
    	</s:iterator>
    </div>
  </body>
</html>
