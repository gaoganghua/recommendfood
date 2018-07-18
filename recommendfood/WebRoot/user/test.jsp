<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
	<title>alert</title>
	<meta charset="utf-8">
	
	<link rel="stylesheet" href="css/bootstrap/bootstrap.css">
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery-3.2.1.js"></script>
	<script>
	$(function(){
		$("#btn1").click(function(){
// 			alert("fff");
			$("#fff").click();
// 			alert($("#myModal"));
// 			$("#myModal").modal(); 
		})
		$("input[name='confirmbtn']").click(function(){
			$("#myModal").modal("hide");
		})
	})
	</script>

</head>
<body>
	<!-- 按钮触发模态框 -->
	<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" id="modalbtn" >
		开始演示模态框
	</button>
<!-- 	<button class="btn btn-default btn-lg" data-toggle="modal" id="btn1"> -->
<!-- 		开始演示模态框 -->
<!-- 	</button> -->
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="background-color: #F5A623; border-bottom: 0px;">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel" style="color: white;">
						提示：
					</h4>
				</div>
				<div class="modal-body" style="background-color: #4A4A4A; color: white; height: 100px;">
					在这里添加一些文本
				</div>
				<div class="modal-footer" style="background-color: #4A4A4A; border-top: 0px;">
<!-- 					<button type="button" class="btn btn-default" data-dismiss="modal">关闭 -->
<!-- 					</button> -->
					<button type="button" class="btn btn-primary" style="background-color: #F5A623;" name="confirmbtn">
						提交更改
					</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
</body>
</html>
