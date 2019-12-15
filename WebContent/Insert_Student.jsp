<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="sms.bean.*" %>
<%@ page import="sms.dao.*" %>
<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="utf-8" />
		<title>插入学生</title>
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
			<table class="table" style="margin:0 auto;width:90%">
				<tr>
					<td style="width:25%"><button class= "btn btn-info" style="width:100%" onclick="window.location.href='index_Admin.jsp'">公告</button>	</td>
					<td style="width:25%"><button class= "btn btn-info" style="width:100%" onclick="window.location.href='Manage_Students.jsp?pages=1'">学生管理</button></td>
					<td style="width:25%"><button class= "btn btn-info" style="width:100%" onclick="window.location.href='Manage_Teachers.jsp'">教师管理</button></td>
					<td style="width:25%"><button class= "btn btn-info" style="width:100%" onclick="window.location.href='Interaction.jsp'">可视化管理</button></td>
				</tr>
			</table>
			<div>
				<table class="table">
				<tr>
					<form class="form-inline" method="post" action="InsertStudentServlet">
						<td>
							<div class="form-group">
								<label >姓名</label>
								<input type="text" name="sname" />
							</div>
						</td>
						<td>
							<div class="form-group">
								<label >学号</label>
								<input type="text" name="sno" />
							</div>
						</td>
						<td>
							<div>
								<label>学院: </label>
								<select name="sdepartment">
									<option value="马克思主义学院">马克思主义学院</option>
									<option value="音乐学院">音乐学院</option>
									<option value="新闻与传媒学院">新闻与传媒学院</option>
									<option value="文学院">文学院</option>
									<option value="历史与社会发展学院">历史与社会发展学院</option>
								</select>
							</div>
						</td>
						<td>
							<div>
								<label>状态: </label>
								<select name="state">
									<option value="在校">在校</option>
									<option value="退学">退学</option> 
							    </select>
							</div>
						</td>
						<td>
						 <button type="submit" class="btn btn-default btn-sm" >提交</button>
						</td>
					</form>
				</tr>
				</table>
			</div>
			<div class="clear"></div>			
		</div>

	</body>
</html>
