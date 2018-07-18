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
    
   	<title>荐食网——全球最大的美食网站</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="css/check.css">
    
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
		$("button.agreebtn").click(function(){
			var checks = $("input:checkbox:checked")
			if(checks.length<1){
				alert("请选择推荐美食");
			}else{
				var ids = "";
				for(var i=0;i<checks.length;i++){
					ids = ids + $(checks[i]).parent().parent().attr("name") + ",";
				}
				window.location.href="systemmanager/adminmanager!adminCheck?ids="+ids+"&status=agree";
			}
		})
		$("button.disagreebtn").click(function(){
			var checks = $("input:checkbox:checked")
			if(checks.length<1){
				alert("请选择推荐美食");
			}else{
				var ids = "";
				for(var i=0;i<checks.length;i++){
					ids = ids + $(checks[i]).parent().parent().attr("name") + ",";
				}
				window.location.href="systemmanager/adminmanager!adminCheck?ids="+ids+"&status=disagree";
			}
		})
	})
	</script>
  </head>
  
  <body>
    <div class="title-area">
		<p>申请审核<span>-审核用户的申请</span>
			<button class="agreebtn">同意</button>
			<button class="disagreebtn">不同意</button>
		</p>	
	</div>
	<div class="button-area"></div>
	<div class="table-area">
		<table>
			<tr class="firstline" height="41px">
				<td width="60px">
					</input>
				</td>
				<td width="167px" style="background-color:#373535">图片</td>
				<td width="167px" style="background-color:#373535">名称</td>
				<td width="155px" style="background-color:#373535">类型</td>
				<td width="656px" style="background-color:#373535">介绍</td>
				<td width="178px" style="background-color:#373535">推荐人</td>
			</tr>
<!-- 			<tr class="secondline" height="37px"> -->
<!-- 				<td></td> -->
<!-- 				<td class="today" style="text-align:left" colspan="5"> 今天<hr class="hh"> -->
<!-- 					<div class="xuxian"></div> -->
<!-- 				</td> -->
<!-- 			</tr> -->
			<s:iterator value="dataList" status="signledata">
				<tr class="secondline" height="169px" name='<s:property value="id"/>'>
					<td>
						<input type='checkbox' name='checkboox[]'>
						</input>
						<label for='checkbox1'></label>
					</td>
					<td><img src='<s:property value="foodPictures"/>' style="width:100px;height:100px"></td>
					<td><s:property value="foodName"/> </td>
					<td><s:property value="foodTypes"/> </td>
					<td>
						<s:property value="foodIntroduce"/>
					</td>
					<td>
						<span class="qi"><s:property value="userLoginName"/> </span>
					</td>
				</tr>
				</tr>
					<tr class="secondline" height="37px">
						<td></td>
					<td class="today" style="text-align:left"><s:date name="recommendTime" format="MM.dd"/> </td>
				</tr>
			</s:iterator>
		</table>
		</div>
		<div class="button-area1">	
	</div>
	<div class="table-area">
		<table>
			<tr class="firstline" height="41px">
				<td width="60px">
					
				</td>
				<td width="167px" style="background-color:#373535">图片</td>
				<td width="167px" style="background-color:#373535">名称</td>
				<td width="155px" style="background-color:#373535">类型</td>
				<td width="656px" style="background-color:#373535">介绍</td>
				<td width="178px" style="background-color:#373535">状态</td>
			</tr>
			<s:iterator value="all" status="signledata">
				<tr class="secondline" height="169px" name='<s:property value="id"/>'>
					<td></td>
					<td><img src='<s:property value="foodPictures"/>' style="width:100px;height:100px"></td>
					<td><s:property value="foodName"/> </td>
					<td><s:property value="foodTypes"/> </td>
					<td>
						<s:property value="foodIntroduce"/>
					</td>
					<td>
						<span class="qi">
<%-- 						<s:property value="passCheck"/> --%>
							<s:if test="passCheck==true">同意</s:if>
							<s:elseif test="passCheck==false">不同意</s:elseif>
						</span>
					</td>
				</tr>
				</tr>
					<tr class="secondline" height="37px">
						<td></td>
					<td class="today" style="text-align:left"><s:date name="recommendTime" format="MM.dd"/> </td>
				</tr>
			</s:iterator>
<!-- 			<tr class="secondline"> -->
<!-- 				<td><input type="checkbox"></input></td> -->
<!-- 				<td class="today" style="text-align:left" colspan="5"> 今天 -->
<!-- 					<div class="xuxian"></div> -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 				<tr class="secondline"> -->
<!-- 				<td> -->
<!-- 					<input type='checkbox' id='checkbox3' name='checkboox[]'> -->
<!-- 					</input> -->
<!-- 					<label for='checkbox3'></label> -->
<!-- 				</td> -->
<!-- 				<td><img src="images/check/鸡肉沙拉.png"></td> -->
<!-- 				<td>鸡肉沙拉</td> -->
<!-- 				<td>小食</td> -->
<!-- 				<td> -->
<!-- 					关于鸡肉沙拉的菜谱：鸡肉蔬菜沙拉 -->
<!-- 				</td> -->
<!-- 				<td> -->
<%-- 				<span class="qi">同意</span> --%>
<%-- 					<span class="jin">不同意</span> --%>
<!-- 				</td> -->
<!-- 			</tr> -->
		</table>
		</div>
  </body>
</html>
