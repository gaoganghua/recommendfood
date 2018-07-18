<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
<!--     <title>My JSP 'register.jsp' starting page</title> -->
    <meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="css/register.css">
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
		$("div.changeheadpic").hide();
		$("div.change-bt-area").click(function(){
			$("div.changeheadpic").show();
			
			document.getElementById('light').style.display='block';
			document.getElementById('fade').style.display='block';
		})
		$("div.changeheadpic-title span.a-2").click(function(){
			$("div.changeheadpic").hide();
			
			document.getElementById('light').style.display='none';
			document.getElementById('fade').style.display='none';
		})
		//
		$("div.changeheadpic-btn-save").click(function(){
			$("div.changeheadpic").hide();
			
			document.getElementById('light').style.display='none';
			document.getElementById('fade').style.display='none';
		})
		//填写注册信息
		$("div.ok div.ok1").click(function(){
			var loginName = $("div.title-style-input input.loginName").val();
			var psd = $("div.input-1-area input[name='loginPassword']").val();
			var repsd = $("div.input-2-area input[name='repassword']").val();
			var notes = $("div.per-style-input input.notes").val();
			var addressprovice = $("div[name='address'] select.select-atyle").val();
			var addresscity = $("div[name='address'] select.select2-atyle").val();
			var email = $("div.per-style-input input.email").val();
			var phone = $("div.per-style-input input.phone").val();
// 			var birthyear = $("div[name='birth'] select.select-atyle").val();
// 			var birthmonth = $("div[name='birth'] select.select3-atyle").val();
// 			var birthday = $("div[name='birth'] select.select4-atyle").val();

// 			alert(email+phone)
			if(loginName==""){
				alert("没有填写用户名");
				return false;
			}
			$("div.input-1-area span").remove();
			$("div.input-2-area span").remove();
			if($.trim(psd)==""){
				var span = $("<span>密码不能为空</span>")
				span.attr("class", "psdspan")
				$("div.input-1-area").append(span)
				return false;
			}
			if($.trim(repsd) ==""){
				$("div.input-2-area").append($("<span>确认密码不能为空</span>"))
				return false;
			}
			if($.trim(repsd) != $.trim(psd)){
				$("div.input-2-area").append($("<span>确认密码与密码不相同</span>"))
				return false;
			}
			if($.trim(phone)==""){
				alert("手机号码没有填写")
				return false;
			};
			var phonetest=/^[\d]+$/;
			if($.trim(phone).length!=11 || !phonetest.test(phone)){
				alert("手机号码格式错误")
				return false;
			}
			if($.trim(email)==""){
				alert('邮箱没有填写');
				return false;
			}
			var emailtest = /^([0-9A-Za-z\-_\.]+)@([0-9a-z]+\.[a-z]{2,3}(\.[a-z]{2})?)$/g;
			if(!emailtest.test(email) || email.indexOf("com")==-1){
				alert("邮箱格式不正确");
				return false;
			}
			var formdata = new FormData();
			formdata.append("file", $("div.changeheadpic-btn-select .upload").find("input[name='file']")[0].files[0]);
			formdata.append("loginName", loginName);
			formdata.append("loginPassword", psd);
			formdata.append("notes", notes);
			formdata.append("addressProvice", addressprovice);
			formdata.append("addressCity", addresscity);
			formdata.append("email", email);
			formdata.append("phone", phone);
// 			formdata.append("birthYear", addresscity);
			/*var params = {
				"loginName":loginName,
				"loginPassword":psd,
				"notes":notes,
				"addressProvice":addressprovice,
				"addressCity":addresscity,
				"birthYear":birthYear,
				"birthMonth":birthmonth,
				"birthDay":birthday,
			}*/
			$.ajax({
				url: "login!register",
				type: "POST",
				processData: false,
				contentType: false,
				data: formdata,
				success: function(data){
					data = eval('(' +data +')');
// 					alert(data)
					if(data.success ==true){
						alert("注册成功");
						window.location.href="login";
					}else{
						alert(data.msg);
					}
				}
			})
		})
		//加载年份
		var loadtime = function(){
			var selectyear = $("div[name='birth'] select.select-atyle");
			for(var i=1960;i<2020;i++){
				var opt = $("<option value=" + i+">" + i+"</option>");
				selectyear.append(opt);
			}
			var selectmonth =  $("div[name='birth'] select.select3-atyle");
			var selectday = $("div[name='birth'] select.select4-atyle");
			for(var i=1;i<=12;i++){
				var optmonth = $("<option value=" + i+">" + i+"</option>");
				selectmonth.append(optmonth);
			}
			for(var i=1;i<=31;i++){
				var optday = $("<option value=" + i+">" + i+"</option>");
				selectday.append(optday);
			}
		}
		$("div[name='birth'] select.select3-atyle").change(function(){
			var m = $(this).val();
			var selectday = $("div[name='birth'] select.select4-atyle");
			selectday.empty();
			$.post("loaddata!loadDay", {"month":m}, function(data){
				data = eval('(' +data+ ')');
				if(data.success ==true){
					for(var i=1;i<=data.data;i++){
						var optday = $("<option value=" + i+">" + i+"</option>");
						selectday.append(optday);
					}
				}
			})
		})
		//加载省份
		var loadprovice = function(){
			var provice = $("div[name='address'] select.select-atyle");
			$.post("loaddata!loadProvice", {}, function(data){
				data = eval('(' +data+ ')');
				if(data.success ==true){
					for(var i=0;i<data.data.length;i++){
						var optpro = $("<option value=" + data.data[i]+">" + data.data[i]+"</option>");
						provice.append(optpro);
					}
				}
			})
		};
		//加载城市
		$("div[name='address'] select.select-atyle").change(function(){
			var provice = $(this).val();
			var citys = $("div[name='address'] select.select2-atyle");
			citys.empty();
			if(provice==""){
				citys.append($("<option value=''>市</option>"));
				return ;
			}
			$.post("loaddata!loadCity", {"provice":provice}, function(data){
				data = eval('(' +data+ ')');
				if(data.success ==true){
					for(var i=0;i<data.data.length;i++){
						var optpro = $("<option value=" + data.data[i]+">" + data.data[i]+"</option>");
						citys.append(optpro);
					}
				}
			})
		})
		loadtime();
		loadprovice();
		var userphotofile;
		//修改图片
		$("div.changeheadpic-btn-select .upload").change(function(){
			var userphoto = $(this).find("input[name='file']")[0];
			var currentNode = $(this);
			if(currentNode.find("input[name='file']").length<=1){
			if(window.FileReader){//chrome,firefox7+,opera,IE10+
				oFReader=new FileReader();
				oFReader.readAsDataURL(userphoto.files[0]);
				oFReader.onload=function (oFREvent){
						var imgNode = $("<img/>");
						imgNode.attr("src", oFREvent.target.result);
						imgNode.attr("width", "100%");
						imgNode.attr("height", "100%");
						$("div.pic-area").append(imgNode);
						
						var inputfile = $("<input type='file' name='file'>");
						inputfile.attr("class", "userphoto");
						currentNode.append(inputfile);
						userphotofile = userphoto;
					}
				}
			}else{
				alert("请先删除图片");
			}
		})
		//删除图片
		$("div.changeheadpic-btn-cancel").click(function(){
			$("div.pic-area").find("img").remove();
			$(userphotofile).remove()
		})
		//修改图片
// 		$("div.changeheadpic-btn-save").click(function(){
// 			var formdata = new FormData();
// 		})
		//退出注册页面
		$("div.ok div.cancel1").click(function(){
			window.location.href="index";
		})
	})
	</script>
  </head>
  
  <body>
   <div class="whole">
   		<div class="title-area">
   			<img src="images/register/顶.png">
   		</div>
   		<div class="work-area">
			<div class="putwork">
			</div>
			<div class="head-picture-area">
				<img src="images/register/头像.png">
			</div>
			<div class="change-bt-area">
				<button>修改头像</button>
			</div>
			<div class="title-style">
			<p style="color:#f5a623;">用户名<span>用户名既是你在荐食网的昵称也是重要标志</span></p>
			</div>
			<div class="title-style-input">
				<input class="loginName" type="text" value="" name="loginName">
				</input>
			</div>
			<div class="per-style">
			<p style="color:#f5a623;">个性签名<span>
				你的美食或者一句话介绍，建议少于16字</span></p>
			</div>
			<div class="per-style-input">
				<input class="notes" type="text" value="" name="notes">
				</input>
			</div>
			<div class="jieshao-style">
				<p style="color:#f5a623;">城市<span>知道了你的城市，我们才能更好的推送美食</span></p>
			</div>
<!-- 			<div class="tag-style"> -->
<%-- 			<p style="color:#f5a623;">生日<span>你的出生日要好好庆祝哦</span></p> --%>
<!-- 			</div> -->
<!-- 			<div class="birthday-style-area" name="birth"> -->
<!-- 				<form> -->
<%-- 					<select class="select-atyle"> --%>
<%-- 					</select> --%>
<%-- 					<select class="select3-atyle"> --%>
<%-- 					</select> --%>
<%-- 					<select class="select4-atyle"> --%>
<%-- 					</select> --%>
<!-- 				</form> -->
<!-- 			</div> -->
			<div class="birthday-style-area" name="address">
				<select class="select-atyle">
					<option value="">省</option>
				</select>
				<select class="select2-atyle">
					<option value="">市</option>
				</select>
			</div>
			<div class="password-title-area">
				<p style="color:#f5a623;">密码<span>修改密码长度要在4-20个字符之间</span></p>
			</div>
			
			<div class="input-1-area">
				<input type="password" placeholder="请填写密码"  oninput="this.style.color='white'" name="loginPassword">
				</input>
			</div>	
			<div class="input-2-area">
				<input type="password" placeholder="请再次确认密码" oninput="this.style.color='white'" name="repassword">
				</input>
<%-- 				<span>两次密码不一致</span> --%>
			</div>
						
			<div class="email-style">
				<p style="color:#f5a623;">邮箱<span>有了你的邮箱，我们能更好的联系你</span></p>
			</div>

			<div class="per-style-input">
				<input class="email" type="text" value="">
				</input>
			</div>
			<div class="phone-style">
				<p style="color:#f5a623;">手机<span>有了你的手机，我们能更好的联系你</span></p>
			</div>
			<div class="per-style-input">
				<input class="phone" type="text" value="">
				</input>
			</div>
			<div class="ok">
				<div class="ok1">
					<button>确定</button>
				</div>
				<div class="cancel1">
					<button>取消注册<button>
				</div>
			</div>
		</div>
   </div>
   <div class="changeheadpic" id="light">
		<div class="changeheadpic-title">
			<span class="a-1">修改头像</span>
			<span class="a-2"><!-- x -->×</span>
		</div>
		<div class="changeheadpic-btn-select">
			<div>
				<a href="javascript:void(0);" class="upload">
	<!-- 				<button>选择图片</button> -->
					<input type="button" value="选择图片">
					<input type="file" name="file" class="userphoto">
				</a>
			</div>
			<div class="changeheadpic-btn-cancel">
				<input type="button" value="删除图片">
			</div>
		</div>
		
		<div class="pic-area">
		</div>
		<div class="words-area">
			(请保证图片大小在2M以内)
		</div>
		<div class="changeheadpic-btn-save">
			<button>保存</button>		
		</div>
	</div>
	<div class="black_over" id="fade"></div>
  </body>
</html>
