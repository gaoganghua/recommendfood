<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>荐食网——全球最大的美食网站</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="./css/indexStyle.css">	
	<link rel="stylesheet" type="text/css" href="./css/sliderStyle.css">
	<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
	<script type="text/javascript" src="js/recommendRright.js"></script>
<!-- 	<link rel="stylesheet" href="css/bootstrap/bootstrap.min.css"> -->
<!-- 	<script src="js/jquery-3.2.1.min.js"></script> -->
<!-- 	<script src="js/bootstrap.js"></script> -->
	<script>
		$(function(){
			//查询
			$(".navigationGlass").click(function(){
// 				$("#myModal").modal({backdrop: "static", keyboard: false}); 
				var foodinfo = $("input[name='navigationInputText']").val();
				window.location.href="systemmanager/foodaction!searchFood?queryinfo="+foodinfo;
				//跳转到搜索结果页面，传值。
			})
		})
	</script>
  </head>
  
  <body>
<%--   	<jsp:include page="common/alert.jsp"></jsp:include> --%>
	<jsp:include page="common/head.jsp"></jsp:include>
	<div>
		<div class="slider">
			<div class="slider-img">
				<ul class="slider-img-ul">
					<li><img src="images/index/slider-5.png"></li>
					<li><img src="images/index/slider-1.png"></li>
					<li><img src="images/index/slider-2.png"></li>
					<li><img src="images/index/slider-3.png"></li>
					<li><img src="images/index/slider-4.png"></li>
					<li><img src="images/index/slider-5.png"></li>
					<li><img src="images/index/slider-1.png"></li>
				</ul>
			</div>
		</div>
	</div>
	<script src="js/jquery-3.2.1.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/xSlider.js"></script>
	
	<div class="foodRecommend">
		美食推荐
	</div>
	<div class="food_Recommend">
		<img src="images/index/下划线.png">
	</div>
	<div class="food_RecommendMore">more</div>
	<div class="foodRecommendImg" id="foodRecommendImg">
		<div class="foodRecommendImg1" id="foodRecommendImg1">
			<img id="foodRecommendImg1img" src="./images/index/推荐1.png">
		</div>
		<div class="foodRecommendImg2" id="foodRecommendImg2">
			<img id="foodRecommendImg2img" src="./images/index/推荐2.png">
		</div>
		<div class="foodRecommendImg3" id="foodRecommendImg3">
			<img id="foodRecommendImg3img" src="./images/index/推荐3.png">
		</div>
		<div class="foodRecommendImg4" id="foodRecommendImg4">
			<img id="foodRecommendImg4img" src="./images/index/推荐4.png">
		</div>
	</div>
	<div class="foodRecommendImgBright" id="foodRecommendImgBright">
		<div class="foodRecommendImg1Bright" id="foodRecommendImg1Bright">
			<img id="foodRecommendImg1Brightimg" src="./images/index/推荐1-动画.png">
		</div>
		<div class="foodRecommendImg2Bright" id="foodRecommendImg2Bright">
			<img id="foodRecommendImg2Brightimg" src="./images/index/推荐2-动画.png">
		</div>
		<div class="foodRecommendImg3Bright" id="foodRecommendImg3Bright">
			<img id="foodRecommendImg3Brightimg" src="./images/index/推荐3-动画.png">
		</div>
		<div class="foodRecommendImg4Bright" id="foodRecommendImg4Bright">
			<img id="foodRecommendImg4Brightimg" src="./images/index/推荐4-动画.png">
		</div>
	</div>
	
	<div class="foodClass">
		美食分类
	</div>
	<div class="food_Class">
		<img src="images/index/下划线.png">
	</div>
	<div class="foodClassImg">
		<div class="foodClassImgRow1" id="foodClassImgRow1">
			<div class="foodClassImgRow1Id1" id="foodClassImgRow1Id1">
				<img src="images/index/中餐.png">
			</div>
			<div class="foodClassImgRow1Id2" id="foodClassImgRow1Id2">
				<img src="images/index/西餐.png">
			</div>
			<div class="foodClassImgRow1Id3" id="foodClassImgRow1Id3">
				<img src="images/index/小食.png">
			</div>
		</div>
		<div class="foodClassImgRow1Bright" id="foodClassImgRow1Bright">
			<div class="foodClassImgRow1BrightId1" id="foodClassImgRow1BrightId1">
				<img id="foodClassImgRow1Brightimg1" src="images/index/分类动画1.png">
			</div>
			<div class="foodClassImgRow1BrightId2" id="foodClassImgRow1BrightId2">
				<img id="foodClassImgRow1Brightimg2" src="images/index/分类动画2.png">
			</div>
			<div class="foodClassImgRow1BrightId3" id="foodClassImgRow1BrightId3">
				<img id="foodClassImgRow1Brightimg3" src="images/index/分类动画3.png">
			</div>
		</div>
		<ul class="foodClassImgText1">
			<li>中餐</li>
			<li>西餐</li>
			<li>小食</li>
		</ul>
		<div class="foodClassImgRow2" id="foodClassImgRow2">
			<div class="foodClassImgRow2Id1" id="foodClassImgRow2Id1">
				<img src="images/index/烘焙.png">
			</div>
			<div class="foodClassImgRow2Id2" id="foodClassImgRow2Id2">
				<img src="images/index/饮料.png">
			</div>
			<div class="foodClassImgRow2Id3" id="foodClassImgRow2Id3">
				<img src="images/index/下午茶.png">
			</div>
		</div>
		<div class="foodClassImgRow2Bright">
			<div>
				<img id="foodClassImgRow2Brightimg1" src="images/index/分类动画4.png">
			</div>
			<div>
				<img id="foodClassImgRow2Brightimg2" src="images/index/分类动画5.png">
			</div>
			<div>
				<img id="foodClassImgRow2Brightimg3" src="images/index/分类动画6.png">
			</div>
		</div>
		<ul class="foodClassImgText2">
			<li>烘焙</li>
			<li>饮料</li>
			<li>品茶</li>
		</ul>
	</div>

	<div class="foodZone">
		美食专区
	</div>
	<div class="food_Zone">
		<img src="images/index/下划线.png">
	</div>
	<div class="food_ZoneMore">more</div>
	<div>
		<img src="images/index/减肥专区.png">
	</div>
	<div>
		<img src="images/index/健身专区.png">
	</div>
	
	<div class="merchantRecommend">
		商家推荐
	</div>
	<div class="merchant_Recommend">
		<img src="images/index/下划线.png">
	</div>
	<div class="merchant_RecommendMore">more</div>
	<div>
		<img src="images/index/商家推荐.png">
	</div>
	<div>
		<img src="images/index/底部.png">
	</div>
<%-- 	<jsp:include page="common/alert.jsp"></jsp:include> --%>
  </body>
</html>
