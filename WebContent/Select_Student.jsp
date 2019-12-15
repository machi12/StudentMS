<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="sms.bean.*" %>
<%@ page import="sms.dao.*" %>
<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="utf-8" />
		<script type="text/javascript">
			function del() {
				if(!confirm("确认要删除？")) {
					window.event.returnValue = false;
				}
			}
		</script>
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
			<div class="button_menu">
				<ul>
					<li>
					
					<button onclick="window.location.href='index_Admin.jsp'"><a href="index_Admin.jsp">公告</a></button>
					
					</li>
					<li><button onclick="window.location.href='Manage_Students.jsp?pages=1'"><a href="Manage_Students.jsp?pages=1">学生管理</a></button></li>
					<li><button onclick="window.location.href='StudentCourses.jsp'"><a href="StudentCourses.jsp">课表查询</a></button></li>
					<li><button onclick="window.location.href='MyGrade.jsp'"><a href="MyGrade.jsp">成绩查询</a></button></li>
					<div class="clear"></div>
					
				</ul>
				<div class="clear"></div>
			</div>
			<div>
				<div>
					<form action="" method="post">
						<input type="text" name="check" placeholder="请输入查询学号或姓名"/>
						<input type="submit" name="submit" value="搜索"/>
					</form>
				</div>
				<div>
				<%
					String search = request.getParameter("check");
					Student student;
					if(search.matches("[0-9]+")){
						student = AdminSql.getStudentBySno(search);
					}
					else{
						student = AdminSql.getStudentByName(search);
					}
				%>
					<table>
						<tr>
							<th>学号</th><th>姓名</th><th>学院</th><th>状态</th><button><a href="Insert_Student.jsp">添加学生</a></button>
						</tr>
						<tr>
							<td><%=student.getId() %></td>
							<td><%=student.getName() %></td>
							<td><%=student.getSdepartment() %></td>
							<td>
							<%
								String state = student.getState();
								if(state == null){
									state = "";
								}
								out.print(state);
							%>
							</td>
							<td><button><a href="Alter_Student.jsp?sno=<%=student.getId() %>">修改</a></button>
							<td><button><a href="RemoveStudentServlet?sno=<%=student.getId() %>" onclick='javascript:return del();'>删除</a></button>
						</tr>
					</table>
				</div>
			</div>
			<div class="clear"></div>			
		</div>

	</body>
</html>
