<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>荐食网——全球最大的美食网站</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="css/usermanage.css">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
	<script type="text/javascript">
	$(function(){
		$("input#checkbox0").click(function(){
			var checks = $(".secondline :checkbox");
			for(var i=0;i<checks.length;i++){
				checks[i].checked = $(this).is(":checked");
			}
		})
		//启用用户
		$(".startbtn").click(function(){
			var checks = $(".secondline :checkbox:checked");
			var ids = "";
			if(checks.length>0){
				for(var i=0;i<checks.length;i++){
					var id = $(checks[i]).parent().parent("tr").attr("name");
					ids = ids + id+",";
					var trNode = $(checks[i]).parent("td").parent("tr");
					if(trNode.find("td[name='status']").find("span").attr("class")=="qi"){
						alert(trNode.find("td[name='loginname']").text()+"用户不能被启用");
						return false;
					}
				}
				ids=ids.substring(0,ids.lastIndexOf(","));
				var params = {"ids":ids};
				$.post("systemmanager/adminmanager!changeUserStatus", params, function(data){
					data = eval('(' + data+ ')');
					if(data.success == true){
						//alert(checks.length)
						for(var i=0;i<checks.length;i++){
							var trNode = $(checks[i]).parent().parent("tr");
							checks[i].checked = false;
							/*if(trNode.find("td").find("span").attr("class")=="qi"){
								if($(".jin:last").length<1){
									$("table:first").append(trNode);
								}else{
									$(".jin:last").parent().parent("tr").after(trNode);
								}
								trNode.find("td").find("span").text("禁用");
								trNode.find("td").find("span").attr("class", "jin");
							}else */
							if(trNode.find("td").find("span").attr("class")=="jin"){
								if($(".qi:last").length<1){
									$("tr.secondline:first").before(trNode);
								}else{
									$(".qi:last").parent().parent("tr").after(trNode);
								}
								trNode.find("td").find("span").text("启用");
								trNode.find("td").find("span").attr("class", "qi");
							}
						}
					}else if(data.success==false){
						alert(data.msg);
					}
				})
			}else{
				alert("请选择用户");
			}
		})
		//禁用用户
		$(".stopbtn").click(function(){
			var checks = $(".secondline :checkbox:checked");
			var ids = "";
			if(checks.length>0){
				for(var i=0;i<checks.length;i++){
					var id = $(checks[i]).parent().parent("tr").attr("name");
					ids = ids + id+",";
					var trNode = $(checks[i]).parent("td").parent("tr");
					if(trNode.find("td[name='status']").find("span").attr("class")=="jin"){
						alert(trNode.find("td[name='loginname']").text()+"用户不能被禁用");
						return false;
					}
				}
				ids=ids.substring(0,ids.lastIndexOf(","));
				var params = {"ids":ids};
				$.post("systemmanager/adminmanager!changeUserStatus", params, function(data){
					data = eval('(' + data+ ')');
					if(data.success == true){
						//alert(checks.length)
						for(var i=0;i<checks.length;i++){
							var trNode = $(checks[i]).parent().parent("tr");
							checks[i].checked = false;
							if(trNode.find("td").find("span").attr("class")=="qi"){
								if($(".jin:last").length<1){
									$("table:first").append(trNode);
								}else{
									$(".jin:last").parent().parent("tr").after(trNode);
								}
								trNode.find("td").find("span").text("禁用");
								trNode.find("td").find("span").attr("class", "jin");
							}
						}
					}else if(data.success==false){
						alert(data.msg);
					}
				})
			}else{
				alert("请选择用户");
			}
		})
		//查询用户
		$(".queryimg").click(function(){
			var query = $(".querybtn").val();
			if(query==""){
				alert("请输入查询的内容");
			}else{
				window.location.href="systemmanager/adminmanager!userControl?query="+query;
			}
		})
		//上一页
		$("div[name='uppage']").click(function(){
// 			alert("dfff");
			var pageIndex = parseInt($(".currentpage").attr("name"))-1;
			var query = $("input:hidden[name='query']").val();
// 			alert(pageIndex)
			window.location.href="systemmanager/adminmanager!userControl?pageIndex="+pageIndex+"&query="+query;
		})
		//下一页
		$(".downpage").click(function(){
			var pageIndex = parseInt($(".currentpage").attr("name"))+1;
			var query = $("input:hidden[name='query']").val();
			window.location.href="systemmanager/adminmanager!userControl?pageIndex="+pageIndex+"&query="+query;
		})
		//首页
		$(".firstpage").click(function(){
			var query = $("input:hidden[name='query']").val();
			window.location.href="systemmanager/adminmanager!userControl?pageIndex=1&query="+query;
		})
		//尾页
		$(".endpage").click(function(){
		var query = $("input:hidden[name='query']").val();
			window.location.href="systemmanager/adminmanager!userControl?pageType=endpage"+"&query="+query;
		})
		
	})
	</script>
  </head>
  
  <body>
    <div class="title-area">
	<p>用户管理<span>-管理用户，启用或禁用帐号</span></p>			
	</div>
	<div class="button-area">			
		<button class="startbtn">启用</button>
		<button class="stopbtn">禁用</button>
		<div class="sousuo-area">
			<input type="text" class="querybtn" name="queryinfo" placeholder="  用户名、手机号、邮箱" oninput="this.style.color='white'" onblur="this.style.color='#4A4A4A'">
			<div class="queryimg" style="width:40px;height: 40px"><img src="images/user/放大镜 copy.png" width="35px" height="35px"></div>
		</div>
	</div>
	<div class="table-area">
		<table class="table-areaTab">
			<tr class="firstline">
				<td width="114px">
					<input type='checkbox' id='checkbox0' name='checkboox[]'>
					</input>
					<label for='checkbox0'></label>
				</td>
				<td width="414px">用户名</td>
				<td width="335px">手机号</td>
				<td width="364px">邮箱</td>
				<td width="192px">状态</td>
			</tr>
			<s:iterator value="dataList" status="singledata">
				<tr class="secondline" name='<s:property value="id"/>'>
					<td>
						<input type='checkbox'  name='checkboox'>
						<label for='checkbox'></label>
					</td>
					<td name="loginname"><s:property value="loginName"/> </td>
					<td><s:property value="phone"/> </td>
					<td><s:property value="email"/></td>
					<td name="status">
						<s:if test="status==1">
							<span class="qi">启用</span>
						</s:if>
						<s:elseif test="status==0">
							<span class="jin">禁用</span>
						</s:elseif>
					</td>
				</tr>
			</s:iterator>
		</table>
		<input type="hidden" value='<s:property value="query"/>' name="query">
		<div class="page">
			<div class="firstpage">首页</div>
			<div class="uppage" name="uppage">上一页</div>
			<div class="currentpage" name='<s:property value="pageIndex"/>'>
				页码:<s:property value="pageIndex"/>
			</div>
			<div class="totalpage">总页数:<s:property value="pageTotal"/></div>
			<div class="totalnum">总记录数:<s:property value="recordSize"/></div>
			<div class="downpage">下一页</div>
			<div class="endpage">尾页</div>
		</div>
	</div>
  </body>
</html>
