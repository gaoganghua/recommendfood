<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags"  prefix="s"%>
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
	<link rel="stylesheet" type="text/css" href="css/deliciousfood.css">	
    
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
		//点赞
		$("div.dianzan-area").click(function(){
			var foodid = $("input[name='foodid']").val();
			var currentNode = $(this);
// 			alert($(this).find("img").attr("name"))Z
			if($(this).find("img").attr("name")=="true"){
				$.post("systemmanager/usercenterajax!userThumbsupCancel", {"foodId":foodid}, function(data){
					data = eval('(' +data +')')
					if(data==null){
						alert("请先登录");
					}
					if(data.success==true){
						currentNode.find("img").attr("src", "images/deliciousfood/点赞-未选中.png");
						currentNode.find("img").attr("name", "");
						currentNode.find("font").text(parseInt(currentNode.find("font").text())-1);
					}
				})
			}else{
				$.post("systemmanager/usercenterajax!userThumbsup", {"foodId":foodid}, function(data){
					data = eval('(' +data +')')
					if(data==null){
						alert("请先登录");
					}
					if(data.success==true){
						currentNode.find("img").attr("src", "images/deliciousfood/点赞-选中.png");
						currentNode.find("img").attr("name", "true");
						currentNode.find("font").text(parseInt(currentNode.find("font").text())+1);
					}
				})
			}
		})
		//收藏
		$("div.shoucang-area").click(function(){
			var foodid = $("input[name='foodid']").val();
			var currentNode = $(this);
			if($(this).find("img").attr("name")=="true"){
				$.post("systemmanager/usercenterajax!favoriteCancel", {"foodId":foodid}, function(data){
					data = eval('(' +data +')')
					if(data==null){
						alert("请先登录");
					}
					if(data.success==true){
						currentNode.find("img").attr("src", "images/deliciousfood/收藏-未选中.png");
						currentNode.find("img").attr("name", "");
						currentNode.find("font").text(parseInt(currentNode.find("font").text())-1);
					}
				})
			}else{
				$.post("systemmanager/usercenterajax!userFavorites", {"foodId":foodid}, function(data){
					data = eval('(' +data +')')
					if(data==null){
						alert("请先登录");
					}
					if(data.success==true){
						currentNode.find("img").attr("src", "images/deliciousfood/收藏-选中.png");
						currentNode.find("img").attr("name", "true");
						currentNode.find("font").text(parseInt(currentNode.find("font").text())+1);
					}
				})
			}
		})
		//评论
		$("div.btn-area-hh button").click(function(){
			var comments = $("div.pinglun-area-area textarea").val();
			var foodid = $("input[name='foodid']").val();
			$.post("systemmanager/usercenterajax!userComment", {"foodId":foodid, "comment":comments}, function(data){
				data =eval('(' + data+')');
				if(data==null){
					alert("请先登录");
				}
				if(data.success==true){
					var div = $("<div class='juzi-area-hh'></div>")
					$("div.comments").prepend(div);
					var picdiv = $("<div class='nicheng-pic'></div>");
					var img = $("<img/>");
					//alert($(".pinglun-area-area .image-area img").attr("src"));
					var imgsrc= $(".pinglun-area-area .image-area img").attr("src")
					imgsrc = imgsrc.replace("\\", "/");
					img.attr("src",imgsrc);
					img.attr("width","50px");
					img.attr("height","50px");
					picdiv.append(img);
					div.append(picdiv);
					var namediv=$("<div class='nicheng'>" +$(".pinglun-area-area input[name='username']").val() +"</div>");
					div.append(namediv)
					var commentdiv=$("<div class='words'>" + comments+"</div>");
					div.append(commentdiv)
				}
			})
		})
		$(".searchresult").click(function(){
			var query = $("input[name='query']").val();
			window.location.href="systemmanager/foodaction!searchFood?queryinfo="+query;
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
	<div class="wholeback">
		<div class="niuroumian-pic">
		<img src="images/deliciousfood/banner.png">
			<input type="hidden" value='<s:property value="foodId"/>' name="foodid">
			<div class="dianzan-area">
				<s:if test="#request.thumbup==true">
					<img src="images/deliciousfood/点赞-选中.png" name="true">
				</s:if>
				<s:else>
					<img src="images/deliciousfood/点赞-未选中.png">
				</s:else>
				(<font><s:property value="#request.thumbuptotal"/></font>)
			</div>
			<div class="shoucang-area">
				<s:if test="#request.favorites==true">
					<img src="images/deliciousfood/收藏-选中.png" name="true">
				</s:if>
				<s:else>
					<img src="images/deliciousfood/收藏-未选中.png">
				</s:else>
				(<font><s:property value="#request.favoritestotal"/></font>)
			</div>
		</div>
		<div class="shicai-title">
			──·食材·──
		</div>
		<div class="shicai-area">
			<div class="zhuliao-area">
					<img src="images/deliciousfood/主料.png"><br>
					<span>主料</span>
				</div>
			<div class="tiaoliao-area">
					<div class="tiaoliaozi">食材</div>
					<div class="tiaoliao-input-one">
						<s:iterator value="stuffs">
							<div class="outputarea"><s:property value="stuffName"/> </div>
						</s:iterator>
<!-- 						<div class="outputarea"></div> -->
<!-- 						<div class="outputarea"></div> -->
					</div>
				</div>
				<div class="shuliang-area2">
					<div class="shuliangzi2">数量(个/克)</div>
					<div class="shuliang-input-one2">
						<s:iterator value="stuffs">
							<div class="outputarea"><s:property value="stuffAmount"/> </div>
						</s:iterator>
					</div>
				</div>
		</div>
		<div class="shicai-area-2">
			<div class="peiliao-area2">
					<img src="images/deliciousfood/辅料.png"><br>
					<span>辅料</span>
				</div>
				<div class="tiaoliao-area">
					<div class="tiaoliaozi">调料</div>
					<div class="tiaoliao-input-one">
						<s:iterator value="seasonings">
							<div class="outputarea"><s:property value="seasoningName"/> </div>
						</s:iterator>
					</div>
				</div>
				<div class="shuliang-area2">
					<div class="shuliangzi2">数量(个/克)</div>
					<div class="shuliang-input-one2">
						<s:iterator value="seasonings">
							<div class="outputarea"><s:property value="seasoningAmount"/> </div>
						</s:iterator>
					</div>
				</div>
		</div>
		<div class="buzhou-title">
			──·步骤·──
		</div>
		<s:iterator value="steps">
			<div class="step-1-title">
				<img src="images/deliciousfood/序号1.png">
			</div>
			<div class="step-1-word">
				<font size="5"><s:property value="introduce"/></font>
			</div>
			<div class="step-1-pic">
				<img src='<s:property value="picture"/>' width="100%" height="100%"/>
			</div>
		</s:iterator>
		
		
		<div class="pinglun-title">──·评论·──</div>
		<div class="pinglun-area-area">
			<input type="hidden" value='<s:property value="#request.user.loginName"/>' name="username">
			<div class="image-area"><img src='<s:property value="#request.user.photo"/>' width="60px" height="60px"></div>
			<textarea rows="6" cols="50" placeholder="你想说点什么.." oninput="this.style.color='white'">你想说些什么吗？</textarea>
		</div>
		<div class="btn-area-hh">
			<button>提交评论</button>
		</div>
		<div class="comments">
			<s:iterator value="#request.comments" status="index" step="ss">
			<div class="juzi-area-hh">
				<div class="nicheng-pic">
					<img src='<s:property value="userPicture"/>' width="50px" height="50px">
				</div>
				<div class="nicheng"><s:property value="userName"/> </div>
				<div class="words"><s:property value="comment"/> </div>
			</div>
			</s:iterator>
		</div>
<!-- 		<div class="searchresult" > -->
<%-- 			<input type="hidden" value='<s:property value="queryinfo"/>' name="query"> --%>
<%-- 			<span>返回查询结果</span> --%>
<!-- 		</div> -->
<!-- 		<div class="qita-area-hh"> -->
<!-- 			<div class="nicheng-pic"> -->
<!-- 			<img src="images/deliciousfood/菠萝.png"> -->
<!-- 			</div> -->
<!-- 			<div class="nicheng">还是菠萝最好吃</div> -->
<!-- 			<div class="words">最好吃</div> -->
<!-- 		</div> -->
<!-- 		</div> -->
	</div>
	
  </body>
</html>
