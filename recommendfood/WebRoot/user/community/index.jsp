<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" href="css/communityindex.css" charset="utf-8" type="text/css"> 
	<!-- jQuery文件。务必在bootstrap.min.js之前引入 -->
	<script src="js/jquery-3.2.1.min.js"></script>
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="resource/bootstrap/js/bootstrap.min.js"></script>
	<!-- 新 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="css/bootstrap/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/manage.css">
	
	<style type="text/css">
		.navbar li{
			color: #FFFFFF;
			font-size: 20px;
			width:24%;
			text-align: center;
			background-color: #f5a623;
		}
		.nav2{
			border-bottom: 1px #f5a623 solid;
		}
		.query{
			color: #f5a623;
		}
		.table1{
			color:#f5a623;
		}
		li.selectli{
			background-color: white;
		}
		.selecta{
			text-decoration: underline;
		}
		.queryinput{
			height:100%;
		}
		.loginbtn{
			width:100%;
			color: #999;
		}
		.loginfont{
			color: #999;
		}
		.goindex{
			cursor: pointer;
		}
	</style>
	<script type="text/javascript">
	$(function(){
		var child=$("input[name='childUrl']").val();
		var relUrl=$("input[name='relUrl']").val();
		var noteId = $("input[name='noteId']").val();
		if(relUrl!=null && relUrl!=''){
			$("li.selectli").find("a").css("text-decoration", "none");
			$("li.selectli").attr("class", "");
			var num = parseInt(child)-1;
			var selectnode = $("ul li:eq("+num+")");
			$(selectnode).attr("class", "selectli");
			$(selectnode).find("a").css("text-decoration", "underline");
			var url = relUrl + "?noteId="+noteId;
			$("#changeInfo").attr("src", url);
			return ;
		}
		$("ul li", window.parent.document).click(function(){
			$("li.selectli").find("a").css("text-decoration", "none");
			$("li.selectli").attr("class", "");
			$(this).attr("class", "selectli");
			$(this).find("a").css("text-decoration", "underline");
		})
		//退出社区
		$("a.goindex").click(function(){
			window.parent.location.href="index";
		})
		$(".loginbtn").click(function(){
			window.parent.location.href="login!loginPage";
		})
	})
	</script>
  </head>
  <body style="background-color: #f5a623">
  	<input type="hidden" name="childUrl" value='<s:property value="#parameters.childUrl"/>'>
  	<input type="hidden" name="relUrl" value='<s:property value="#parameters.relUrl"/>'>
  	<input type="hidden" name="noteId" value='<s:property value="#parameters.noteId"/>'>
  	<div class="container" id="container" style="background-color: #373636">
  		<br>
  		<div class="row nav1">
  			<div class="col-lg-3">
  				<div class="text-center">
  					<img src="images/navigation/荐食网.png">
  				</div>
  			</div>
  			<div class="col-lg-8">
   				<form class="form-inline col-lg-12"> 
					<div class="from-group" style="height: 50px">
						<div class="col-lg-10">
							<input type="text" class="form-control pull-right queryinput" id="name" placeholder="请输入名称" style="width: 100%;display: block">
						</div>
						<button type="submit" class="btn btn-default btn-lg query">搜索</button>
				    </div>
				</form>
  			</div>
  			<div class="col-lg-1 pull-right">
  				<s:if test="#session.login_user!=null">
  					<a herf="javascript:void(0)" class="loginbtn"><s:property value="#session.login_user.loginName"/></a>
  				</s:if>
  				<s:else>
  					<a herf="javascript:void(0)" class="loginbtn">登陆</a>
  				</s:else>
  				<div><a herf="javascript:void(0)" class="goindex">退出社区</a></div>
  			</div>
  		</div>
  		<div class="row nav2" >
  			<div class="col-lg-12">
	  			<ul class="nav nav-pills navbar">
				  <li class="selectli"><a href="commoncommunity/community!newNotes" target="iframehh" class="selecta">新帖</a></li>
				  <li><a href="commoncommunity/community!hotNotes" target="iframehh">热帖</a></li>
				  <li><a href="commoncommunity/community!expertAdvice" target="iframehh">专家问答</a></li>
				  <li><a href="commoncommunity/community!myNotes" target="iframehh">我的帖子</a></li>
				</ul>
			</div>
  		</div>
  		<br>
  		<div class="row">
  			<div class="col-lg-12">
				<iframe src="commoncommunity/community!newNotes" name="iframehh" id="changeInfo" frameBorder=0 marginwidth=0 marginheight=0 style="width:100%;height:100%" scrolling="auto" ALLOWTRANSPARENCY="true">
				</iframe>
				</div>
  			</div>
  		</div>
  	</div>
  </body>
</html>
