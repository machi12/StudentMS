<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="sms.bean.*" %>
<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="utf-8" />
		<title>交互式管理</title>
		<link type="text/css" rel="stylesheet" href="css/index.css">
		<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css">
		<script src="js/echarts.js" type="text/javascript"></script>
		<script src="js/jquery-3.4.1.min.js" type="text/javascript"></script>
	</head>
	<body>
		<%
			Admin a = (Admin)request.getSession().getAttribute("admin");
			//Teacher t = (Teacher)request.getSession().getAttribute("teacher");
			if(a == null){
				response.sendRedirect("notlogin.jsp");
			}
		%>
		<div class="main">
			<div class="navigation">
				<span>欢迎回来! 
					<%
						if(a != null){
							out.print(a.getAname());
						}
					%>
					管理员
				</span>
				<a class="exit" href="/StudentMS/LogoutServlet"><span>退出登录</span></a>
			</div>
			<table class="table" style="margin:0 auto;width:90%">
				<tr>
					<td style="width:20%"><button class= "btn btn-info" style="width:100%" onclick="window.location.href='index_Admin.jsp'">公告</button>	</td>
					<td style="width:20%"><button class= "btn btn-info" style="width:100%" onclick="window.location.href='Manage_Students.jsp?pages=1'">学生管理</button></td>
					<td style="width:20%"><button class= "btn btn-info" style="width:100%" onclick="window.location.href='Manage_Teachers.jsp'">教师管理</button></td>
					<td style="width:20%"><button class= "btn btn-info" style="width:100%" onclick="window.location.href='Interaction.jsp'">可视化管理</button></td>
					<td style="width:20%"><button class= "btn btn-info" style="width:100%" onclick="window.location.href='Database.jsp'">备份还原</button></td>
				</tr>
			</table>
			<div>
				<div id="one" style="width:1000px;height:400px;margin:0 auto;">
				</div>
				<script type="text/javascript">
					var myChart = echarts.init(document.getElementById('one'));
					var url = 'CourseNumberServlet';
					$.getJSON(url).done(function(json){
						course = json.course;
						num = json.num;
						console.log(course + "###" + num);
						var option = {
								title:{
									text:'各科选课人数'
								},
								tooltip:{},
								legend:{
									data:['选课人数']
								},
								xAxis:{
									data:course,
									axisLabel: {
							            interval: 0,
							            formatter:function(value){
							                     return value.split("").join("\n");
							                     }
							        	}
								},
								yAxis:{},
								series:[{
									name:'选课人数',
									type:'bar',
									data:num
								}],
						}
						myChart.setOption(option);
					});
				</script>
			</div>
			<div class="clear"></div>			
		</div>

	</body>
</html>
