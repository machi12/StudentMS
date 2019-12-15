<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="sms.bean.*" %>
<%@ page import="sms.dao.*" %>
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
					<td style="width:25%"><button class= "btn btn-info" style="width:100%" onclick="window.location.href='index_Admin.jsp'">公告</button>	</td>
					<td style="width:25%"><button class= "btn btn-info" style="width:100%" onclick="window.location.href='Manage_Students.jsp?pages=1'">学生管理</button></td>
					<td style="width:25%"><button class= "btn btn-info" style="width:100%" onclick="window.location.href='Manage_Teachers.jsp'">教师管理</button></td>
					<td style="width:25%"><button class= "btn btn-info" style="width:100%" onclick="window.location.href='Interaction.jsp'">可视化管理</button></td>
				</tr>
			</table>
			<div>
				<%
					String sno = request.getParameter("sno");
					Student student = AdminSql.getThisStudent(sno);
				%>
				<form method="post" action="AlterStudentServlet">
					<table class="table table-hover; table_center" style="margin:0 auto;width:90%">				
					<tr>
						<td>学号:<%=student.getId() %><br/>
						<td>姓名:<%=student.getName() %><br/>
						<td>学院:<%=student.getSdepartment() %><br/>
						<td>状态:<select name="state">
								<option value="在校">在校</option>
								<option value="退学">退学</option> 
						    </select><br/>
						 <td><button class="btn btn-default btn-sm"  type="submit" value="提交" >提交</button></td>
					 	<input type="hidden" name="sno" value="<%=sno %>" />
				</form>
			</div>
			<div class="clear"></div>			
		</div>

	</body>
</html>
