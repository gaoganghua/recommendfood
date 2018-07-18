<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 5.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
<!--     <title>My JSP 'recommendfood.jsp' starting page</title> -->
    <title>荐食网——全球最大的美食网站</title>
	<meta charset="utf-8">
	
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="css/uploding.css">
	<script type="text/javascript" src="resource/js/jquery-3.0.0.js"></script>
	<script type="text/javascript">
	$(function(){
		var flag;
		loadFoodCategory();
		//加载美食类型
		function loadFoodCategory(){
			$.post("systemmanager/loadfoodaction!loadFoodCategory", {}, function(data){
				data = eval('(' + data+ ')');
				if(data.success==true){
					//alert(data.data)
					loadcategory(data.data);
				}
			})
		}
		var loadcategory = function(data){
			flag = new Array(data.length);
// 			alert("ff");
			for(var i=0;i<data.length;i++){
				var spans = $("<span id='" + data[i].id+ "' name='" +i + "'>" + data[i].name+ "</span>");
// 				var inputs = $("<input type='hidden' name='foodcs[" +i +"]' value='" +data[i].id + "'>");
				var divs=$("<div class='zhongcan' style='background-image: url(images/uploading/正常标签-未选中.png)'></div>");
				divs.append(spans);
				//divs.append(inputs);
				$(".tag-style-area").append(divs);
				
				flag[i] = 0;
				divs.click(function(){
					divclick(this);
				})
			}
		}
		var foodcs= "";
		var divclick = function(arg1){
			var sname = $(arg1).find("span").attr("name");//序号
			var sid = $(arg1).find("span").attr("id");//id
			var index = parseInt(sname);
// 			alert(index)
			if(flag[index]==0){
				$(arg1).css("background-image", "url(images/uploading/正常标签-选中.png)");
// 				foodcs = foodcs + sid + ",";
				flag[index]=1;
			}else if(flag[index]==1){
				$(arg1).css("background-image", "url(images/uploading/正常标签-未选中.png)");
// 				var start = foodcs.substring(0, foodcs.indexOf(sid));
// 				var end = foodcs.substring(foodcs.indexOf(sid)+2);
// 				alert(start+  ":" + end)
				flag[index]=0;	
			}
		}
		//更多步骤
		$("div#moreprocessbtn").click(function(){
			var step = $("div[class^='zuofa'][class$='put']");
			var processInputs = $("input[name^=stepnote]");
			var processStyle = $("<div class='zuofa-2-style'><img src='images/uploading/序号3.png'></div>");
			var processInput =$("<div class='zuofa-style-input2'><input type='text' value='做法介绍' name='stepnote[" + processInputs.length+"]'></input></div>");
			
			var processPutP = $("<p>上传作品</p><p>格式可是JPG、PNG</p><p>建议大小不超过10M</p>");
			var processPutHref = $("<a href='javascript:void(0);' class='upload'></a>");
			var processPutFile = $("<input type='button' style='background-image: url(images/uploading/添加.png)'><input class='uploadchange' type='file' name='steppic' id='uploadfoodsteppicchange'>")
			var processPutWork = $("<div class='putwork2' id='putwork" + step.length+ "'></div>");
			var processPutDiv = $("<div class='zuofa-2-put'></div>");
			processPutHref.append(processPutFile);
			processPutWork.append(processPutHref);
			processPutWork.append(processPutP);
			processPutDiv.append(processPutWork);
			processPutHref.change(function(){
				seeFile(this);
			})
			
			$(step[step.length-1]).after(processPutDiv);
			$(step[step.length-1]).after(processInput);
			$(step[step.length-1]).after(processStyle);
			
			return false;
		})
		//图片预览
		var seeFile = function(arg1){
			//alert($(arg1).find("input[name='steppic']").length);
			var foodStepPicFile = $(arg1).find("input[name='steppic']")[0];
			var putworkpic = $(arg1).parent().parent().find(".putworkpic");
			var currentNode = $(arg1);
			if(putworkpic.length<1){
		if(window.FileReader){//chrome,firefox7+,opera,IE10+
		oFReader=new FileReader();
			oFReader.readAsDataURL(foodStepPicFile.files[0]);
			oFReader.onload=function(oFREvent){
						var foodPicFileSubmit = $("<input class='uploadchange' type='file' name='steppic'>");
						currentNode.append(foodPicFileSubmit);
						var foodStepPic =$("<img/>");
						foodStepPic.attr("name", "steppic");
						foodStepPic.attr("width", "100%");
						foodStepPic.attr("height", "100%");
						var picDiv = $("<div class='putworkpic'></div>");
						foodStepPic.appendTo(picDiv);
						var removeImg = $("<img src='images/uploading/RedX.png'>");
						var imgDiv = $("<div class='RedXDiv'></div>");
						removeImg.appendTo(imgDiv);
						imgDiv.prependTo(picDiv);
						imgDiv.css("display", "none");
						imgDiv.click(function(){
							precessRedXClick(picDiv, currentNode.parent().parent().find("div[id^='putwork']"),foodStepPicFile);
						});
						picDiv.mouseover(function(){
							mouseoverPicDiv(imgDiv);
						});
						picDiv.mouseout(function(){
							mouseoutPicDiv(imgDiv);
						});
						
						foodStepPic.attr("src", oFREvent.target.result);
						picDiv.css("height", "220px");
						picDiv.prependTo(currentNode.parent().parent());
						currentNode.parent().parent().find("div[id^='putwork']").css("margin-left", "80px");
					};
	}
			}else{
				alert("最多上传1张图片");
			}
		}
		//步骤一二文件上传
		$("div[id^='putwork'] .upload").change(function(){
			//var foodStepPicFile = $("#uploadfoodsteppicchange1")[0];
			seeFile(this);
		})	
		$(".RedXDiv").css("display","none");
		//美食图片上传
		$(".xiaopost .upload").change(function(){
			var currentNode = $(this);
			//var foodPicFile = $("#uploadfoodphotochange")[0];
			
			var xiaoposts = $(".xiaopost");
			var className = "xiaopost"+xiaoposts.length;
			var foodPicFiles = $("input[name='foodPic']");
			var foodPicFile = foodPicFiles[foodPicFiles.length-1];
			//alert($(foodPicFile).attr("id"));
			if(xiaoposts.length<6){
		if(window.FileReader){//chrome,firefox7+,opera,IE10+
		oFReader=new FileReader();
			oFReader.readAsDataURL(foodPicFile.files[0]);
		oFReader.onload=function(oFREvent){
						var foodPicFileSubmit = $("<input class='uploadchange' type='file' name='foodPic'>");
						var foodPic =$("<img/>");
						foodPic.attr("name", "foodPic");
						foodPic.attr("width", "100%");
						foodPic.attr("height", "100%");
						var picDiv = $("<div class='xiaopost'></div>");
						foodPic.appendTo(picDiv);
						var removeImg = $("<img src='images/uploading/RedX.png'>");
						var imgDiv = $("<div class='RedXDiv'></div>");
// 						imgDiv.css("display", "none");
						removeImg.appendTo(imgDiv);
						imgDiv.prependTo(picDiv);
						imgDiv.css("display", "none");
						imgDiv.click(function(){
							redXClick(picDiv, foodPicFile);
						});
						picDiv.mouseover(function(){
							mouseoverPicDiv(imgDiv);
						});
						picDiv.mouseout(function(){
							mouseoutPicDiv(imgDiv);
						});
						
						currentNode.append(foodPicFileSubmit);
						
						foodPic.attr("src", oFREvent.target.result);
						picDiv.css("padding-top", "0px");
						picDiv.css("height", "220px");
						picDiv.prependTo($(".postworks"));
						
					};
	}
			}else{
				alert("最多上传5张图片");
			}
		})
		var precessRedXClick = function(arg1, arg2, arg3){
			$(arg1).remove();
			$(arg3).remove();
			$(arg2).css("margin-left", "300px");
		}	
		var redXClick = function(arg1,arg2){
// 			var divLength = $(arg1).parent().find("div.xiaopost").length;
// 			var divnextLength = $(arg1).nextAll("div.xiaopost").length;
			$(arg2).remove();
			$(arg1).remove();
			
		}
		var mouseoverPicDiv = function(arg1){
			$(arg1).css("display","inline-block");
		}
		var mouseoutPicDiv = function(arg1){
			$(arg1).css("display","none");
		}
		//添加食材
		$(".addshicailiao").click(function(){
			var stuffNames = $("input[name^=stuffs][name$=stuffName]")
			var stuffAmounts = $("input[name^=stuffs][name$=stuffAmount]")
			if(stuffNames.length<4){
				var newstuffName = $("<input type='text' name='stuffs[" + stuffNames.length +"].stuffName'>");
				var newstuffAmount = $("<input type='text' name='stuffs[" + stuffAmounts.length +"].stuffAmount'>");
				newstuffName.appendTo($(".shicai-input-one"));
				newstuffAmount.appendTo($(".shuliang-input-one:first"));
			}else{
				alert("error");
			}
		})
		//添加辅料
		$(".addfuliao").click(function(){
			var seasoningNames = $("input[name^=seasonings][name$=seasoningName]")
			var seasoningAmounts = $("input[name^=seasonings][name$=seasoningAmount]")
			if(seasoningNames.length<6){
				var newstuffName = $("<input type='text' name='seasonings[" + seasoningNames.length +"].seasoningName'>");
				var newstuffAmount = $("<input type='text' name='seasonings[" + seasoningAmounts.length +"].seasoningAmount'>");
				newstuffName.appendTo($(".tiaoliao-input-one"));
				newstuffAmount.appendTo($(".shuliang-input-one2"));
			}else{
				alert("error");
			}
		})
		
		$("div#submit").click(function(){
			foodcs = "";
			for(var i=0;i<flag.length;i++){
				if(flag[i]==1){
					var node = $(".tag-style-area").find("span")[i];
					foodcs = foodcs + $(node).attr("id") + ",";
				}
			}
			$(".tag-style-area").append($("<input type='hidden' value='" + foodcs+ "' name='foodTypes'>"));
			var form = $("#form1")[0];
			form.submit();
		})
		//返回个人中心
		$("div.ok div.cancel1").click(function(){
			window.location.href="systemmanager/usercenteraction";
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
  	<form action="systemmanager/foodaction!recommendFood" method="post" enctype="multipart/form-data" id="form1">
	<div class="wholeback">
		<div class="work-area">
			<div class="putwork">
				<div class="putwork-title">
				上传作品
				</div>
				<div class="puwork-sentence">
				—上传你的作品，让更多的朋友和你一起享受美味！
				</div>			
			</div>
			<div class="postworks" id="postworks">
			<div class="xiaopost" id="xiaopost">
<!-- 				<div class="RedXDiv" id="RedXDiv"> -->
<!-- 					<img id="RedXImg" src="images/uploading/RedX.png" /> -->
<!-- 				</div> -->
				<a href="javascript:void(0);" class="upload">
					<input type="button" style="background-image: url(images/uploading/添加.png)">
    				<input class="uploadchange" type="file" name="foodPic">
				</a>
<!-- 				<div class="upload"> -->
<!-- 					<input type="button"style="background-image: url(images/uploading/添加.png)"> -->
<!-- 					<input class="uploadchange" type="file"></input> -->
<!-- 				</div> -->
				<p>上传作品</p>
				<p>格式可是JPG、PNG</p>
				<p>建议大小不超过10M</p>
				<p>（最多只能上传5张图片）</p>
			</div>
<!-- 			<div class="xiaopost"> -->
<!-- 				<img src="" id="imgfoodPic" width="100%" height="100%"> -->
<!-- 			</div> -->
			</div>
			<div class="title-style">
			<p style="color:#f5a623;">标题<span>请输入2-20个字</span></p>
			</div>
			<div class="title-style-input">
				<input class="" type="text" value="" name="foodname">
				</input>
			</div>
			<div class="tag-style">
			<p style="color:#f5a623;">标签<span>选择你的作品类型</span></p>
			</div>
			<div class="tag-style-area">
<%-- 				<div class="zhongcan" style="background-image: url(images/uploading/正常标签-未选中.png)"><span>中餐</span></div> --%>
			</div>
			<div class="jieshao-style">
			<p style="color:#f5a623;">介绍<span>请输入500字以内</span></p>
			</div>
			<div class="jieshao-style-input">
				<textarea  name="foodintroduction"></textarea>
<!-- 				<input class="" type="text" value=""> -->
				</input>

			</div>
			<div class="peiliao-style">
			<p style="color:#f5a623;">配料</p>
			</div>
			<div class="peiliao-style-area" style="background-image: url(images/uploading/配料背景.png)">
				<div class="zhuliao-area">
					<img src="images/uploading/主料.png"><br>
					<span>主料</span><br>
<!-- 					<img src="images/uploading/添加.png"> -->
				</div>
				<div class="shicai-area">
					<div class="shicaizi">食材</div>
					<div class="shicai-input-one">
						<input type="text" value="猪肉" name="stuffs[0].stuffName"></input>
						<input type="text" value="" name="stuffs[1].stuffName"></input>
						<input type="text" value="" name="stuffs[2].stuffName"></input>
					</div>
				</div>
				<div class="shuliang-area">
					<div class="shuliangzi">数量(个/克)</div>
					<div class="shuliang-input-one">
						<input type="text" value="500g" name="stuffs[0].stuffAmount"></input>
						<input type="text" value="" name="stuffs[1].stuffAmount"></input>
						<input type="text" value="" name="stuffs[2].stuffAmount"></input>
					</div>
				</div>
			</div>
			<div class="addshicailiao">
				<img src="images/uploading/添加.png">
			</div>
			<div class="peiliao-style-area2" style="background-image: url(images/uploading/配料背景.png)">
				<div class="peiliao-area2">
					<img src="images/uploading/辅料.png"><br>
					<span>辅料</span>
				</div>
				<div class="tiaoliao-area">
					<div class="tiaoliaozi">调料</div>
					<div class="tiaoliao-input-one">
						<input type="text" value="" name="seasonings[0].seasoningName"></input>
						<input type="text" value="" name="seasonings[1].seasoningName"></input>
						<input type="text" value="" name="seasonings[2].seasoningName"></input>
						<input type="text" value="" name="seasonings[3].seasoningName"></input>
					</div>
				</div>
				<div class="shuliang-area2">
					<div class="shuliangzi2">数量(个/克)</div>
					<div class="shuliang-input-one2">
						<input type="text" value="" name="seasonings[0].seasoningAmount"></input>
						<input type="text" value="" name="seasonings[1].seasoningAmount"></input>
						<input type="text" value="" name="seasonings[2].seasoningAmount"></input>
						<input type="text" value="" name="seasonings[3].seasoningAmount"></input>
					</div>
				</div>
			</div>
			<div class="addfuliao">
				<img src="images/uploading/添加.png">
			</div>
			<div class="zuofa-style">
			<p style="color:#f5a623;">做法<span>让其他用户也能享受你创造的美味</span></p>
			</div>
			<div class="zuofa-1-style">
			<img src="images/uploading/序号1.png">
			</div>
			<div class="zuofa-style-input">
				<input class="" type="text" value="做法介绍" name="stepnote[0]">
				</input>
			</div>
			<div class="zuofa-1-put">
				<div class="putwork1" id="putwork1" align="center">
					<a href="javascript:void(0);" class="upload">
						<input type="button" style="background-image: url(images/uploading/添加.png)">
		   				<input class="uploadchange" type="file" name="steppic" id="uploadfoodsteppicchange1">
					</a>
<!-- 					<input type="button" value=""  style="background-image: url(images/uploading/添加.png)"></input> -->
					<p>上传作品</p>
					<p>格式可是JPG、PNG</p>
					<p>建议大小不超过10M</p>
				</div>
			</div>
			<div class="zuofa-2-style">
			<img src="images/uploading/序号2.png">
			</div>
			<div class="zuofa-style-input2">
				<input class="" type="text" value="做法介绍" name="stepnote[1]">
				</input>
			</div>
			<div class="zuofa-2-put">
				<div class="putwork2" id="putwork2">
					<a href="javascript:void(0);" class="upload">
						<input type="button" style="background-image: url(images/uploading/添加.png)">
		   				<input class="uploadchange" type="file" name="steppic" id="uploadfoodsteppicchange2">
					</a>
					<p>上传作品</p>
					<p>格式可是JPG、PNG</p>
					<p>建议大小不超过10M</p>

				</div>
			</div>
			<div class="more" id="moreprocessbtn">
				<input type='button' value='更多步骤'>
			</div>
			<div class="ok">
				<div class="ok1" id="submit">
					<input type='button' value='确定'>
<!-- 					<button>确定</button> -->
				</div>
				<div class="cancel1">
					<input type='button' value='返回个人中心'>
				</div>
<!-- 				<img src="images/uploading/添加.png"> -->
			</div>
		</div>
	</div>
	</form>
  </body>
</html>
