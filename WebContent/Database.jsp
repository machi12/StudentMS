<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="sms.bean.*" %>
<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="utf-8" />
		<title>学生界面</title>
		<link type="text/css" rel="stylesheet" href="css/index.css">
		<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css">
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
			<div style="margin-left:100px; margin-top:50px">
				<h3>通过下面两个按钮可以实现数据库的备份还原:</h3><br/>
				<button class="btn btn-default" onclick="window.location.href='DatabaseBackupsServlet'" style="margin-left:50px">备份</button>
				<button class="btn btn-default" onclick="window.location.href='DatabaseRestoreServlet'" style="margin-left:100px">还原</button>
			</div>
			<div class="clear"></div>			
		</div>

	</body>
</html>
