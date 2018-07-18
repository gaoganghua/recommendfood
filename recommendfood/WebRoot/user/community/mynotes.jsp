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
    
    <title>My JSP 'mynotes.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- jQuery文件。务必在bootstrap.min.js之前引入 -->
	<script src="js/jquery-3.2.1.min.js"></script>
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="resource/bootstrap/js/bootstrap.min.js"></script>
	<!-- 新 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="css/bootstrap/bootstrap.min.css">
	<script type="text/javascript" src="js/ejs_production.js"></script>
	<script type="text/javascript" src="resource/js/jquery-3.0.0.js"></script>
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
			font-size:20px;
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
		button.delbtn{
			background-color:#555;
			color:#999;
		}
		button.writebtn{
			font-size:25px;
			background-color:#555;
			color:#999;
		}
		div.writenote{
			bottom: 20px;
		}
		div.writenotediv{
			position: absolute;
			width:700px;
			height:500px;
			margin-left: 80px;
			margin-top: -300px;
			z-index: 2000;
			border:1px solid #f5a623;
			background-color: #4a4a4a;
		}
		div.writetitle{
			height:50px;
			font-size:27px;
			background-color: #f5a623;
			padding: 10px;
		}
		span.titleone{
			color: white
		}
		span.titletwo{
			color: #999;
			text-align:right;
			cursor: pointer;
		}
		.writebody{
			font-size:18px;
			padding-top:10px;
			padding-left: 50px;
			color:#9B9B9B;
		}
		.writenotebtn{
			background-color: #f5a623;
		}
		.notetitle{
			background-color:#4a4a4a;
			border:#f5a623 solid 1px;
			width: 600px;
			height:40px;
			color: #999;
		}
		.notecontent{
			background-color:#4a4a4a;
			border:#f5a623 solid 1px;
			width: 600px;
			height:250px;
			resize: none;
			color: #999;
/* 			op */
		}
	</style>
	<script type="text/javascript">
	$(function(){
		var writeNoteOptions = function(data) {
		    return new EJS({url: "resource/ejs/writenote.ejs"}).render({
		    	data:data,
		    });
		}
		//菜单栏选择
		$("ul.navbar li", window.parent.document).click(function(){
			$("li.selectli", window.parent.document).find("a").css("text-decoration", "none");
			$("li.selectli", window.parent.document).attr("class", "");
			$(this).attr("class", "selectli");
			$(this).find("a").css("text-decoration", "underline");
		})
		//删除帖子
		$("button.delbtn").click(function(){
			delbtnOption(this);
		})
		//写帖子
		$("button.writebtn").click(function(){
			$("div.writenotediv").show();
		})
		//取消
		$("button.writenotecancel").click(function(){
			$("div.writenotediv").hide();
		})
		//发布
		$("button.writenotebtn").click(function(){
			var notetitle = $("input.notetitle").val();
			var notecontent = $(".notecontent").val();
			$.post("commoncommunity/community!addNote",{"title":notetitle, "content":notecontent}, function(data){
				data = eval('(' + data+')');
				if(data.success==true){
					data.data.noteTime = String(data.data.noteTime).substr(0, String(data.data.noteTime).lastIndexOf(":"));
					var shtml = writeNoteOptions(data.data);
					$("div.notes:last").after(shtml)
					$("input.notetitle").val("");
					$(".notecontent").val("");
				}
			})
		})
	})
	</script>
  </head>
  
  <body>
    <div class="container">
    	<s:if test="notes!=null">
    		<s:iterator value="notes">
		    	<div class="row notes">
		    		<br>
		    		<div class="col-md-7 strong title" id='<s:property value="id"/>'><a href="commoncommunity/community!noteInfo?noteId=<s:property value="id"/>">【<s:property value="title"/>】</a></div>
		    		<div class="col-md-2 text-center btm2">评论量：<s:property value="commentTotal"/></div>
		    		<div class="col-md-2 pull-left btm" ><s:date name="noteTime" format="yyyy-MM-dd HH:mm" /></div>
		    		<div class="col-md-1 pull-right" ><button class="btn btn-default delbtn">删除</button></div>
		    	</div>
			</s:iterator>
			<div class="row writenote">
				<br><br>
				<div class="col-md-12">
					<button class="btn btn-default writebtn pull-right">发布新帖</button>
				</div>
			</div>
			 <div class="writenotediv" style="display: none;">
		     	<div class="writetitle">
		     		<span class="titleone ">发布帖子</span>
		     	</div>
		     	<div class="writebody">
					<div class="notetitlelabel">标题：</div>
					<input type="text" name="content" placeholder="" class="notetitle"><br>
					<div class="notecontentlabel">帖子：</div>
					<textarea rows="8px" cols="60px" class="notecontent"></textarea>
					<br><br>
					<button class="btn btn-lg writenotebtn">发布</button>
					&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
					<button class="btn btn-lg writenotecancel">取消</button>
		     	</div>
			</div>	
    	</s:if>
		<s:else>
			<br>
			<a class="btn btn-default btn-warning" href="javscript:void(0)" onclick="window.parent.location.href='login!loginPage'">去登陆</a>
		</s:else>
     </div>
  </body>
  <script type="text/javascript">
  function delbtnOption(node){
		var noteid = $(node).parent().parent("div.row").find("div.title").attr("id");
		$.post("commoncommunity/community!deleteNote", {"noteId":noteid}, function(data){
			data = eval('(' +data + ')');
			if(data.success==true){
				$(node).parent().parent("div.row").remove();
			}
		})
  }
  </script>
</html>