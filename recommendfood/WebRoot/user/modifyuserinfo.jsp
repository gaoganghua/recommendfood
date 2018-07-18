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
    
<!--     <title>My JSP 'modifyuserinfo.jsp' starting page</title> -->
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<title>荐食网——全球最大的美食网站</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="css/changeinfo.css">	
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
		//修改头像
		$("div.changeheadpic-btn-save").click(function(){
			$("div.changeheadpic").hide();
			document.getElementById('light').style.display='none';
			document.getElementById('fade').style.display='none';

		})
		$("div.password-area-1 div.jiantou-1").click(function(){
			if($(this).attr("name")=="jiantouup"){
				$("div.passworddiv").hide(1000);
				$(this).find("img").attr("src", "images/change/向下.png");
				$(this).attr("name","jiantoudown");
				$(this).find("div.password-area-1").css("background", "url('../images/change/密码-窄.png')");
				$(this).find("div.password-area-1").css("height", "50px");
			}else{
				$("div.passworddiv").show(1000);
				$(this).find("img").attr("src", "images/change/向上.png");
				$(this).attr("name","jiantouup");
				$(this).find("div.password-area-1").css("height", "288px");
			}
		})
		//密码修改
		$(".password-btn-area div.ok-btn").click(function(){
			$("div.old-password span").remove();
			$("div[name='newpassword'] span").remove();
			$("div[name='repassword'] span").remove();
			var oldpassword = $("div.old-password :password").val();
			if(oldpassword==""){
				$("div.old-password").append($("<span>原密码不能为空</span>"))
				return false;
			}
			$.post("systemmanager/usercenterajax!checkPassword", {"oldpassword":oldpassword}, function(data){
				data = eval('(' + data+ ')');
				if(data.success==true){
					var newpassword = $("div[name='newpassword'] :password").val();
					if(newpassword==""){
						$("div[name='newpassword']").append($("<span>新密码不能为空</span>"))
						return false;
					}
					var repassword = $("div[name='repassword']  :password").val();
					if(repassword==""){
						$("div[name='repassword']").append($("<span>确认密码不能为空</span>"))
						return false;
					}
					if(repassword!=newpassword){
						$("div[name='repassword']").append($("<span>密码与确认密码不同</span>"))
						return false;
					}
					$.post("systemmanager/usercenterajax!modifyPassword", {"newpassword":newpassword}, function(data){
						data = eval('(' + data+')');
						if(data.success==true){
							alert("密码修改完成")
							$("div.old-password :password").val("");
							$("div[name='newpassword']  :password").val("");
							$("div[name='repassword']  :password").val("");
						}else{
							alert(data.msg);
						}
					})
				}else{
					$("div.old-password").append($("<span>" +data.msg +"</span>"))
					return false;
				}
			})
		})
		//修改信息
		$("div.ok div.ok1").click(function(){
// 			mizhu.alert("1", "ok");
			var loginName = $("div.title-style-input input.loginName").val();
			var loginPassword = $("div[name='newpassword']  :password").val();
			var notes = $("div.per-style-input input.notes").val();
			var addressprovice = $("div[name='address'] select.select-atyle").val();
			var addresscity = $("div[name='address'] select.select2-atyle").val();
			var birthyear = $("div[name='birth'] select.select-atyle").val();
			var birthmonth = $("div[name='birth'] select.select3-atyle").val();
			var birthday = $("div[name='birth'] select.select4-atyle").val();
// 			alert(loginName)
			var params = {
				"loginName":loginName,
				"loginPassword":loginPassword,
				"notes":notes,
				"addressProvice":addressprovice,
				"addressCity":addresscity,
				"birthYear":birthyear,
				"birthMonth":birthmonth,
				"birthDay":birthday,
			}
			$.post("systemmanager/usercenteraction!modify", params, function(data){
				data = eval('(' +data+ ')');
				if(data.success ==true){
				alert("修改成功");
// 					mizhu.alert("1", "ok");
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
		var useraddressprovice;
		var useraddresscity;
		//加载省份
		var loadprovice = function(){
			var provice = $("div[name='address'] select.select-atyle");
			var useraddress = $("input[name='useraddress']").val();
			if(useraddress!=""){
				useraddressprovice = useraddress.substring(0, useraddress.indexOf("-"));
				useraddresscity = useraddress.substring(useraddress.indexOf("-")+1);
// 				alert(useraddressprovice +useraddresscity)
			}
			$.post("loaddata!loadProvice", {}, function(data){
				data = eval('(' +data+ ')');
				if(data.success ==true){
					for(var i=0;i<data.data.length;i++){
						var optpro = $("<option value=" + data.data[i]+">" + data.data[i]+"</option>");
						provice.append(optpro);
						if(useraddressprovice==data.data[i]){
							optpro.attr("selected", "selected");
							selectprovice(useraddressprovice);
						}
					}
				};
			});
		};
		//加载城市
		$("div[name='address'] select.select-atyle").change(function(){
			var provice = $(this).val();
			var citys = $("div[name='address'] select.select2-atyle");
			if(provice==""){
				citys.append($("<option value=''>市</option>"));
				return ;
			}
			selectprovice(provice);
		})
		var selectprovice = function(arg0){
			var citys = $("div[name='address'] select.select2-atyle");
			citys.empty();
			$.post("loaddata!loadCity", {"provice":arg0}, function(data){
				data = eval('(' +data+ ')');
				if(data.success ==true){
					for(var i=0;i<data.data.length;i++){
						var optpro = $("<option value=" + data.data[i]+">" + data.data[i]+"</option>");
						citys.append(optpro);
						if(useraddresscity!=""){
							if(useraddresscity==data.data[i]){
								optpro.attr("selected", "selected");
							}
						}
					}
				}
			})
		}
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
					oFReader.onload =function(oFREvent){
						var imgNode = $("<img/>");
						imgNode.attr("src", oFREvent.target.result);
						imgNode.attr("width", "100%");
						imgNode.attr("height", "100%");
						$("div.pic-area").append(imgNode);
						
						var inputfile = $("<input type='file' name='file'>");
						inputfile.attr("class", "userphoto");
						currentNode.append(inputfile);
						userphotofile = userphoto;
// 						userphoto
// 						alert(userphotofile)
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
		$("div.changeheadpic-btn-save").click(function(){
			var formdata = new FormData();
			formdata.append("file", $("div.changeheadpic-btn-select .upload").find("input[name='file']")[0].files[0]);
// 			$.post("systemmanager/usercenteraction!modifyPhoto", formdata, function(data){
// 				alert("bbb");
// 				alert(data);
// 			})
			$.ajax({
				url: "systemmanager/usercenteraction!modifyPhoto",
				type: "POST",
				processData: false,
				contentType: false,
				data: formdata,
				success: function(data){
					data = eval('(' +data +')');
					if(data.success ==true){
						alert("修改成功");
						$("div.pic-area").find("img").remove();
						$(userphotofile).remove()
						if(window.FileReader){//chrome,firefox7+,opera,IE10+
						oFReader=new FileReader();
						oFReader.readAsDataURL(userphotofile.files[0]);
							oFReader.onload=function(oFREvent){
								$("div.head-picture-area img").attr("src", oFREvent.target.result);
							}
						}
					}
				}
			});
		})
		$("div[name='usercenter']").click(function(){
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
	<div class="wholeback">
		<div class="work-area">
			<div class="putwork">
				<div class="putwork-title">
				修改信息
				</div>
				<div class="puwork-sentence">
				—修改你的基本资料，将显示在你的个人名片中，并可以让更多的朋友了解和认识你
				</div>			
			</div>
			<div class="head-picture-area">
				<img src='<s:property value="#request.user.photo"/>' width="200px" height="200px"/>
			</div>
			<div class="change-bt-area">
				<button>修改头像</button>
			</div>
			<div class="title-style">
			<p style="color:#f5a623;">用户名<span>用户名既是你在荐食网的昵称也是重要标志</span></p>
			</div>
			<div class="title-style-input">
				<input class="loginName" type="text" value='<s:property value="#request.user.loginName"/>'>
				</input>
			</div>
			<div class="per-style">
			<p style="color:#f5a623;">个性签名<span>
				你的美食或者一句话介绍，建议少于16字</span></p>
			</div>
			<div class="per-style-input">
				<input class="notes" type="text" value='<s:property value="#request.user.notes"/>'>
				</input>
			</div>
			<div class="tag-style">
				<p style="color:#f5a623;">生日<span>你的出生日要好好庆祝哦</span></p>
			</div>
			<div class="birthday-style-area" name="birth">
<!-- 				<form> -->
					<select class="select-atyle">
					</select>
					<select class="select3-atyle">
					</select>
					<select class="select4-atyle">
					</select>
<!-- 				</form> -->
			</div>

			<div class="jieshao-style">
				<p style="color:#f5a623;">城市<span>知道了你的城市，我们才能更好的推送美食</span></p>
			</div>
			<input type="hidden" name="useraddress"value='<s:property value="#request.user.address"/>'>
			<div class="birthday-style-area" name="address">
					<select class="select-atyle">
						<option value="">省</option>
					</select>
					<select class="select2-atyle">
						<option value="">市</option>
					</select>

			</div>
			<div class="password-area-1" style="background: url('../images/change/密码-宽.png')">
				<p style="color:#f5a623;">密码<span>修改密码长度要在4-20个字符之间
				</span>
				<div class="jiantou-1" name="jiantouup"><img src="images/change/向上.png"/></div>					
				</p><br>
				<div class="passworddiv">
					<div class="old-password"> 
						<input type="password" placeholder="请填写原密码" oninput="this.style.color='white'"></input>
					</div>
					<div class="new-password" name="newpassword">
						<input type="password" placeholder="请填写新密码"  oninput="this.style.color='white'"></input>
					</div>
					<div class="new-password" name="repassword">
						<input type="password" placeholder="请再次确认新密码"  oninput="this.style.color='white'"></input>
					</div>
					<div class="password-btn-area">
						<div class="ok-btn">
							<button>确定</button>
						</div>
						<div class="cancel-btn">
							<button>取消</button>
						</div>
					</div>
				</div>
			</div>
			<div class="ok">
				<div class="ok1">
					<button>确定</button>
				</div>
				<div class="cancel1" name="usercenter">
					<button>返回个人中心</button>
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
			<button>保存修改</button>		
		</div>
	</div>
	<div class="black_over" id="fade"></div>
  </body>
</html>
