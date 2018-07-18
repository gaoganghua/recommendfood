<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
<!--     <title>My JSP 'pinglun.jsp' starting page</title> -->
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="css/pinglun.css">	

  </head>
  
  <body>
    	<div class="time-area">
		<div class="time-line">
			<img src="images/personalcenter/时间轴.png">

		</div>
	</div>
	<div class="pinglun-area">
		<div class="pinglun-area-one">
			<div class="pinglun-area-one-1">
				<div class="pinglun-area-one-1-pigtu">
					<img src="images/personalcenter/大1-1 .png">
				</div>
				<div class="wenzi-area">
					<div class="wenzi-area-title">
						<span>坐标合肥的学生党吃食全纪录</span>
					</div>
					<div class="wenzi-area-tag">
						<span>各种零食镇楼（ˉ﹃ˉ）你馋不馋</span>
					</div>
					<div class="wenzi-area-tu">
						<div class="wenzi-area-tu1">
							<img src="images/personalcenter/小1-1.png">
						</div>
						<div class="wenzi-area-tu2">
							<img src="images/personalcenter/小1-2.png">
						</div>
						<div class="wenzi-area-tu3">
							<img src="images/personalcenter/小1-3.png">
						</div>
					</div>
				</div>
				<div class="xintie-area">
					/新帖/
				</div>
			</div>
			<div class="juzi-area">
				<div class="juzi-area-tu">
					<img src="images/personalcenter/橘子.png">
				</div>
				<div class="juzi-area-wenzi">
					<div class="juzi-area-name">
						还是橘子最好吃
					</div>
					<div class="juzi-area-words">
						好赞啊，好想吃！
					</div>

				</div>

			</div>
			
			<div class="caomei-area">
				<div class="caomei-area-tu">
					<img src="images/personalcenter/草莓.png">
				</div>
				<div class="caomei-area-wenzi">
					<div class="caomei-area-name">
						<span>还是草莓最好吃</span>
					</div>
					<div class="caomei-area-words">
						<span>@我</span>&nbsp;嗯嗯啊，好想吃！
					</div>

				</div>

			</div>
			<div class="pingguo-area">
				<div class="pingguo-area-tu">
					<img src="images/personalcenter/草莓.png">
				</div>
				<div class="pingguo-area-wenzi">
					<div class="pingguo-area-name">
						<span>还是苹果最好吃</span>
					</div>
					<div class="pingguo-area-words">
						<span>@我</span> 嗯，好想吃！
					</div>

				</div>
			</div>
			<div class="moredian-area">
				<div class="moredian">
					<span>…</span>		
				</div>
			</div>
			<div class="boluo-area">
				<div class="boluo-area-tu">
					<img src="images/personalcenter/菠萝.png">
				</div>
				<div class="boluo-area-wenzi">
					<div class="boluo-area-name">
						还是菠萝最好吃
					</div>
					<div class="boluo-area-words">
						好赞啊，好想吃！
					</div>

				</div>

			</div>
		</div>
		<div class="pinglun-area-two">
		</div>
		<div class="pinglun-area-three"></div>
	</div>
  </body>
</html>
