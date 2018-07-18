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
    
    <title>My JSP 'noteinfo.jsp' starting page</title>
    
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
	<!-- 加载编辑器的容器 -->
    <!-- 配置文件 -->
    <script type="text/javascript" src="resource/ueditor/ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="resource/ueditor/ueditor.all.js"></script>
    <script type="text/javascript" src="resource/ueditor/ueditor.parse.js"></script>
	<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
	<script type="text/javascript" src="js/ejs_production.js"></script>
	
<%-- 	<script type="text/javascript" src="../.resource/ueditor/ueditor.config.js"></script> --%>
    <!-- 编辑器源码文件 -->
<%--     <script type="text/javascript" src="../../resource/ueditor/ueditor.all.js"></script> --%>
<%--     <script type="text/javascript" src="../../resource/ueditor/ueditor.parse.js"></script> --%>
<%-- 	<script type="text/javascript" src="../../js/jquery-3.2.1.js"></script> --%>
	<style type="text/css">
		body{
			background-color:#4a4a4a;
			line-height:1.5;
		}
		div.row{
			margin-top:5px;
			width:100%;
			border-bottom:1px solid white;
			font-size:15px;
			padding-top:3px;
			color:#999;
		}
		.title{
			font-size:25px;
			color:#f5a623;
		}
		.top{
			color:#f5a623;
		}
		.btm1{
			text-align: right;
			margin-bottom: 5px;
		}
		.content{
			color:#bbb;
			text-align: left;
		}
		.contenttop{
			color:#ddd;
		}
		.btn-area-hh{
			position: relative;
			float: left;
			width: 1296px;
			height: 37px;
			margin-left: 152px;
			margin-top: 17px;
		}
		.btn-area-hh button{
			position: relative;
			float: right;
			right: 17px;
			width: 116px;
			height: 37px;
			outline: none;
			border: none;
			font-family: "黑体";
			color: white;
			font-size: 16px;
			background-color: #f5a623;
		}
		.btn-area-hh button:hover{
			color: #373636;
		}
		div.btmrow{
			border-bottom:0px;
		}
		font.replyUserId{
			cursor: pointer;
		}
		.replyinput{
			background-color:#333; 
			color:#999;
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
		//退出
		$("a.goindex", window.parent.document).click(function(){
			window.parent.location.href="index";
		})
		var ue = UE.getEditor('contenttxt',{"initialFrameHeight":150});
		//对主贴进行回复
		$("div.btn-area-hh").click(function(){
			 var html = ue.getContent();
			 var txt = ue.getContentTxt();
			 if($.trim(html)!=''){
			 	var noteId = parseInt($("input[name='noteId']").val());
			 	var replydata = {"content":html, "noteId":noteId,"parentId":0}
			 	$.post("commoncommunity/community!replyNote", replydata, function(data){
			 		data = eval('(' +data + ')');
			 		if(data==false){
			 			alert("即将跳转登录界面");
			 			var url = "oldUrl=commoncommunity/community!index&childUrl=2&relUrl=commoncommunity/community!noteInfo&noteId="+$("input[name='noteId']").val();
			 			window.parent.location.href="login!loginPage?"+url;
			 			return ;
			 		}else{
// 			 			alert("成功");
			 			var datetime = String(data.data.replyTime);
			 			data.data.replyTime = datetime.substring(0, datetime.lastIndexOf(":"));
			 			var rowhtml = noteReplyOptions(data.data);
			 			if($("div.contentrow").length>0){
			 				$("div.contentrow:last").after(rowhtml);
			 			}else{
			 				$("div.firstrow:first").after(rowhtml);
			 			}
			 			ue.setContent("");
			 		}
			 	})
			 }
		})
		//回复发表按钮
		$("button[name='sreplybtn']").click(function(){
			sreplyClick(this);
		})
		//二级回复
		$("div.btm1 a").click(function(){
			bindClick1(this);
		})
		//@用户回复
		$("div.btm2 a").click(function(){
			bindClick(this);
		})
	})
	
	</script>
	</head>
  <body>
    <div class="container bigpage">
    	<input type="hidden" name="noteId" value="<s:property value="#request.indexNote.id"/>"/>
    	<div class="row">
    		<div class="col-md-12 text-center title"><s:property value="#request.indexNote.title"/></div>
    	</div>
    	<br>
    	
    	<div class="row firstrow">
    		<div class="col-md-3">
    			<div class="col-md-8"><img src="<s:property value="#request.indexNote.userPic"/>" width="100%" height="100px"></div>
    			<div class="col-md-8 text-center"><s:property value="#request.indexNote.userName"/></div>
    			<div class="col-md-8 text-center top">楼主</div>
    		</div>
    		<div class="col-md-9 text">
    			<div class="col-md-12 contenttop">
    				<s:property value="#request.indexNote.noteMsg" escapeHtml="false"/>
    			</div>
    		</div>
    		<div class="col-md-12 btm1">
    			<s:date name="#request.indexNote.noteTime" format="yyyy-MM-dd HH:mm"/> 
    			&nbsp&nbsp<span><img src="images/shoucang/赞.png"></span><s:property value="#request.indexNote.upvoteTotal"/>
    		</div>
    	</div>
    	<s:iterator value="noteReplys">
    		<div class="row contentrow" name='<s:property value="id"/>'>
	    		<div class="col-md-3">
	    			<div class="col-md-8"><img src="<s:property value="userPic"/>" width="100%" height="100px"></div>
	    			<div class="col-md-8 text-center"><s:property value="userName"/></div>
	    			<div class="col-md-8 text-center"><s:property value="floorNumber"/>楼</div>
	    		</div>
	    		<div class="col-md-9 text">
	    			<div class="col-md-12 content">
	    				<s:property value="replyMsg" escapeHtml="false"/>
	    			</div>
	    		</div>
	    		<div class="col-md-12 btm1">
	    			<s:date name="replyTime" format="yyyy-MM-dd HH:mm"/>
	    			&nbsp&nbsp<a href="javascript:void(0)" name="0">回复</a>
	    		</div>
	    		<s:iterator value="replys">
	    			<div class="col-md-11 pull-right secondreply">
		    			<div class="col-md-4">
			    			<div class="col-md-2"><img src='<s:property value="userPic"/>' width="20px" height="20px"></div>
			    			<div class="col-md-10">
			    				<font class="replyUserId" id='<s:property value="userId"/>' name='<s:property value="userName"/>'>
			    					<s:property value="userName"/>
			    				</font>
				    			<s:if test="respUserId!=0l">
				    				@<s:property value="respNoteUserName"/>
				    			</s:if>
		    				：</div>
			    		</div>
			    		<div class="col-md-5">
			    			<div class="col-md-12 secondreplycontent">
			    				<s:property value="replyMsg" escapeHtml="false"/>
			    			</div>
			    		</div>
			    		<div class="col-md-3 pull-right btm2" style="text-align: right">
			    			<s:date name="replyTime" format="MM-dd HH:mm"/>
	    					&nbsp&nbsp<a href="javascript:void(0)" name="0">回复</a>
			    		</div>
	    			</div>
	    		</s:iterator>
	    		<div class="col-md-6  pull-right replydiv" style="display: none">
	    			<div class="col-md-9">
	    				<input type="text" placeholder="请输入" name="replyinput" class="form-control replyinput">
	    			</div>
	    			<button class="btn btn-default col-md-3" name="sreplybtn" style="background-color:#777">发表</button>
	    			<br><br>
	    		</div>
	    	</div>
    	</s:iterator>
    	<br>
    	<div class="row btmrow">
    		<div class="col-md-12">
    			<div id="contenttxt"></div>
    		</div>
    		<div class="col-md-12">
    			<div class="btn-area-hh pull-right">
					<button>提交评论</button>
				</div>
    		</div>
    	</div>
    	<br>
     </div>
  </body>
  <script type="text/javascript">
  var respUserId = null;
		var noteReplyOptions = function(data) {
		    return new EJS({url: "resource/ejs/notereply.ejs"}).render({
		    	data:data,
		    });
		}
		var secondReplyOptions = function(data) {
		    return new EJS({url: "resource/ejs/secondreply.ejs"}).render({
		    	data:data,
		    });
		}
		function sreplyClick(node){
			var params = {};
			var replymsg = String($(node).parent(".replydiv").find("input[name='replyinput']").val()).substring($(node).parent(".replydiv").find("input[name='replyinput']").val().indexOf(":")+1);
			if(replymsg==""){
				alert("请输入回复信息");
				return ;
			}
			var noteId = $("input[name='noteId']").val();
			var parentId = $(node).parent().parent(".contentrow").attr("name");
			if(respUserId!=null){
				params={"content":replymsg,"noteId":noteId,"respUserId":respUserId,"parentId":parentId};
			}
			if(respUserId==null){
				params={"content":replymsg,"noteId":noteId,"parentId":parentId};
			}
			var currentnode = node;
// 			p = JSON.stringify(params)
// 			alert(p)
			$.post("commoncommunity/community!replyNote", params, function(data){
				data = eval('(' + data+')');
				if(data==false){
					window.parent.location.href="login!loginPage";
				}else{
					var stime = String(data.data.replyTime);
					stime = stime.substr(0,stime.lastIndexOf(":"));
					data.data.replyTime = stime.substr(stime.indexOf("-")+1);
					var html = secondReplyOptions(data.data);
// 					alert(html);
					var grandpanode = $(currentnode).parent().parent(".contentrow")
					if(grandpanode.find("div.secondreply").length>0){
						grandpanode.find("div.secondreply:last").after(html);
					}else{
						grandpanode.find(".replydiv").before(html);
					}
				}
				$(currentnode).parent(".replydiv").find("input[name='replyinput']").val("");
				$(currentnode).parent(".replydiv").hide();
				respUserId=null;
				$("a[name='1']").text("回复");
				$("a[name='1']").attr("name", "0");
			})
		}
		function bindClick1(node){
			if($(node).attr("name")=="0"){
				$(node).parent().parent(".contentrow").find("div.replydiv").show();
				$(node).attr("name", "1");
				$(node).text("取消回复");
			}else{
				$(node).parent().parent(".contentrow").find("div.replydiv").find("input[name='replyinput']").val("");
				$(node).parent().parent(".contentrow").find("div.replydiv").hide();
				$(node).attr("name", "0");
				$(node).text("回复");
			}
		}
		//@用户的绑定事件
		function bindClick(node){
			var replydiv = $(node).parent().parent().parent(".contentrow").find("div.replydiv");
			if($(node).attr("name")=="0"){
				var replyobj = $(node).parent().parent(".secondreply").find("font.replyUserId");
				var replyname = replyobj.attr("name");
				respUserId = replyobj.attr("id");
				replydiv.show();
				replydiv.find("input[name='replyinput']").val("@"+replyname+":");
				$(node).attr("name", "1");
				$(node).text("取消回复");
			}else{
				replydiv.hide();
				replydiv.find("input[name='replyinput']").val("");
				respUserId=null;
				$(node).attr("name", "0");
				$(node).text("回复");
			}
		}
  </script>
 </html>
