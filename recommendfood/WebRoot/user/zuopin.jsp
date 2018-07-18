<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="css/zuopin.css">	
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
			$(this).parent().parent().find("p.caiming").css("opacity", "0.5");
		})
		$("div[class^='shoucang-area-one'] span img").mouseout(function(){
			$(this).parent().parent().find("p.caiming").css("opacity", "1");
		})
		$("div[class^='shoucang-area-one'] .pinglun-dianzan-area font").mouseover(function(){
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
// 		查看美食详细信息通过名字
		$("div[class^='shoucang-area-one'] p.caiming").click(function(){
			top.location.href="systemmanager/foodaction!foodInfo?foodId="+$(this).attr("name");
		})
		//点赞
		$("div[class^='shoucang-area-one'] p img[class='dianzanimg']").click(function(){
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
		//收藏
		$("div[class^='shoucang-area-one'] p.pinglun-dianzan-area font[class='shoucangfont']").click(function(){
			var currentNode = this;
			var params = {"foodId": $(this).parent(".pinglun-dianzan-area").attr("name")};
			if($(this).attr("name")!="true"){//收藏
				$.post("systemmanager/usercenterajax!userFavorites", params, function(data){
					data = eval('(' + data+ ')');
					if(data.success==true){
						var currentFont = $(currentNode).text();
						var currentTotal = currentFont.substring(currentFont.indexOf("(")+1, currentFont.indexOf(")"));
						var currentText = "已收藏(" + (parseInt(currentTotal)+1) + ")";
						$(currentNode).attr("name", "true");
						$(currentNode).text(currentText)
						$(currentNode).css("color", "red");
					}else{
						alert(data.msg);
					}
				})
			}else{//取消收藏
				$.post("systemmanager/usercenterajax!favoriteCancel", params, function(data){
					data = eval('(' + data+ ')');
					if(data.success==true){
						var currentFont = $(currentNode).text();
						var currentTotal = currentFont.substring(currentFont.indexOf("(")+1, currentFont.indexOf(")"));
						var currentText = "收藏(" + (parseInt(currentTotal)-1) + ")";
						$(currentNode).attr("name", "");
						$(currentNode).text(currentText);
						$(currentNode).css("color", "white");
					}else{
						alert(data.msg);
					}
				})
			}
		})
// 		查看评论
// 		$("div[class^='shoucang-area-one'] .pinglun-dianzan-area font.pinglunfont").click(function(){
// 			alert($(this).attr("name"))
// 		})
		$(".getmore").click(function(){
			var page = parseInt($("input:hidden[name='currentpage']").val())+1;
			var params = {"pageIndex":page};
			$.post("systemmanager/usercenteraction!userRecommends", params, function(data){
				data = eval('(' +data + ')');
				if(data.success==false){
					alert(data.msg);
				}else{
// 					addZuopin(data);
					$("input:hidden[name='currentpage']").val(page);
				}
			})
		})
		/*var addZuopin = function(data){
			for(var i=0;i<data.length;i++){
				var bigdiv = $("<div></div>");
				bigdiv.attr("class", "shoucang-area-one-1");//大div
				bigdiv.appendTo($("div.zuopin-area-one"));
				var imgspan = $("<span></span>");
				var imgNode = $("<img/>")
				imgNode.attr("src", data[i].pictures);
				imgNode.attr("width", "300px");
				imgNode.attr("height", "300px");
				imgNode.attr("name", data[i].foodId);
				imgNode.appendTo(imgspan);
				imgspan.appendTo(bigdiv);
				var namepnode = $("<p class='caiming' name='" +data[i].foodId + "'>" + data[i].foodName+ "<h6/>")
				namepnode.appendTo(bigdiv);
				var pinglunnode = $("<p class='pinglun-dianzan-area' name='" + data[i].foodId+"'></p>")
				pinglunnode.appendTo(bigdiv);
				var pinglunimg = $("<img src='images/shoucang/评论.png'/>");
				var pinglunfont = $("<font class='pinglunfont'name='"+data[i].foodId+"'>评论("+ data[i].commentTotal+")</font>");
				var dianzanimg = $("<img src='images/shoucang/赞.png' class='dianzan' name='" +data[i].foodId+"'/>");
				var dianzanfont = $("<font class='dianzanfont'></font>");
				dianzanfont.text("点赞("+data[i].thumbsupTotal+")");
				if(data[i].thumbsup==true){
					dianzanfont.attr("name", "true");
					dianzanfont.css("color", "red");
				}
				var shoucangfont = $("<font class='shoucangfont'></font>");
				shoucangfont.text("收藏("+data[i].thumbsupTotal+")");
				if(data[i].favorites==true){
					shoucangfont.attr("name", "true");
					shoucangfont.css("color", "red");
				}
				var timenode = $("<font class='recommenddate'></font>");
				var timeyear = data[i].recommendTime.substring(0,data[i].recommendTime.indexOf(" "));
				timenode.text("推出时间："+timeyear);
				pinglunimg.appendTo(pinglunnode);
				pinglunfont.appendTo(pinglunnode);
				dianzanimg.appendTo(pinglunnode);
				dianzanfont.appendTo(pinglunnode);
				shoucangfont.appendTo(pinglunnode);
				timenode.appendTo(pinglunnode);
				var typenode = $("<p class='foodstyle'>/" + data[i].foodTypes+"/ </p>");
				typenode.appendTo(bigdiv);
			}
		}*/
// 		$(".zuopin-area-one").scroll(function(){
// 			alert("fff");
// 		})
	})
	</script>
  </head>
  
  <body>
    <div class="zuopin-area-one">
    	<s:iterator value="dataList" step="singledata" status="index">
    		<div class="shoucang-area-one-1">
				<span>
					<img src='<s:property value="foodPictures"/>' width="300px" height="300px" name='<s:property value='foodId'/>'>
				</span>
				<p class="caiming" name='<s:property value='foodId'/>'><s:property value="foodName"/> </h6>
				<p class="pinglun-dianzan-area" name='<s:property value='foodId'/>'>
					<img src="images/shoucang/评论.png">
					<font class=" " name='<s:property value='foodId'/>'>评论(<s:property value="commentTotal"/>)</font>&nbsp;&nbsp;&nbsp;
					<img src="images/shoucang/赞.png" class="dianzanimg" name='<s:property value='foodId'/>'>
					<s:if test="thumbsup==true">
						<font class="dianzanfont" name="true" style="color: red"/>点赞(<s:property value="thumbsupTotal"/>)</font>
					</s:if>
					<s:else>
						<font class="dianzanfont" />点赞(<s:property value="thumbsupTotal"/>)</font>
					</s:else>&nbsp&nbsp
					<s:if test="favorites==true">
						<font class="shoucangfont" name="true" style="color: red"/>已收藏(<s:property value="favoritesTotal"/>)</font>
					</s:if>
					<s:else>
						<font class="shoucangfont" />收藏(<s:property value="favoritesTotal"/>)</font>
					</s:else>
					<p class="recommend">
					<font class="recommenddate">推出时间：<s:date name="recommendTime" format="yyyy-MM-dd"/></font>
					</p>
				</p>
				<p class="foodstyle">/<s:property value="foodTypes"/>/ </p>
			</div>
    	</s:iterator>
    	<input type="hidden" name="currentpage" value='<s:property value="pageIndex"/>'>
<%--     	<div class="getmore" name='<s:property value="pageIndex"/>'>更多作品</div> --%>
    </div>
  </body>
</html>
