<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="sms.bean.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="sms.dao.*" %>
<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="utf-8" />
		<title>教师界面</title>
		<link type="text/css" rel="stylesheet" href="css/index.css">
		<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css">
	</head>
	<body>
		<%
			//Student s = (Student)request.getSession().getAttribute("student");
			Teacher t = (Teacher)request.getSession().getAttribute("teacher");
			if(t == null){
				response.sendRedirect("notlogin.jsp");
			}
		%>
		<div class="main">
			<div class="navigation">
				<span>欢迎回来! 
					<%
						if(t != null){
							out.print(t.getName());
						}
					%>
					老师
				</span>
				<a class="exit" href="/StudentMS/LogoutServlet"><span>退出登录</span></a>
			</div>
			<table class="table" style="margin:0 auto;width:90%">
				<tr>
					<td style="width:33%"><button class= "btn btn-info" style="width:100%" onclick="window.location.href='index_Teacher.jsp'">公告</button>	</td>
					<td style="width:33%"><button class= "btn btn-info" style="width:100%" onclick="window.location.href='MyCourses.jsp'">负责课程</button></td>
					<td style="width:33%"><button class= "btn btn-info" style="width:100%" onclick="window.location.href='School_Grades.jsp'">成绩录入</button></td>
					</tr>
			</table>
			<div>
				<%
					String cno = request.getParameter("cno");
					ArrayList<Student> list = TeacherSql.getMyStudents(cno);
					Student student = null;
					int index = 0;
				%>
				<table class="table table-hover; table_center" style="margin:0 auto;width:90%">
					<tr>
						<th>序号</th><th>学号</th><th>姓名</th><th>学院</th><th>成绩</th>
					</tr>
					<%
						if(list != null){
							Iterator<Student> iterator = list.iterator();
							while(iterator.hasNext()){
								student = iterator.next();
								index++;
					%>
					<tr>
						<td><%=index %></td>
						<td><%=student.getId() %></td>
						<td><%=student.getName() %></td>
						<td><%=student.getSdepartment() %></td>
						<td>
							<%
								String score = student.getScore();
								if(score == null){
									score = "成绩未录入";
								}
								out.print(score);
							%>
						</td>
						<td><button class="btn btn-default btn-sm" ><a href="SetScore.jsp?cno=<%=cno %>&sno=<%=student.getId() %>">录入</a></button>
					</tr>
					<%
							}
						}else{
							
						}
					%>
					</table>
			</div>
			<div class="clear"></div>			
		</div>

	</body>
</html>
