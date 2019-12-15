<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="sms.bean.*" %>
<%@ page import="sms.dao.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="utf-8" />
		<title>这是选课系统的主界面</title>
		<link type="text/css" rel="stylesheet" href="css/index.css">
		<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css">
	</head>
	<body>
		<%
			Student s = (Student)request.getSession().getAttribute("student");
			if(s == null){
				response.sendRedirect("notlogin.jsp");
			}
		%>
		<div class="main">
			<div class="navigation">
				<span>欢迎回来! 
					<%
						if(s != null){
							out.print(s.getName());
						}
					%>
				</span>
				<a class="exit" href="/StudentMS/LogoutServlet"><span>退出登录</span></a>
			</div>
			<table class="table" style="margin:0 auto;width:90%">
				<tr>
					<td style="width:25%"><button class= "btn btn-info" style="width:100%" onclick="window.location.href='index_Student.jsp'">公告</button>	</td>
					<td style="width:25%"><button class= "btn btn-info" style="width:100%" onclick="window.location.href='ChoiceCourse.jsp'">选课</button></td>
					<td style="width:25%"><button class= "btn btn-info" style="width:100%" onclick="window.location.href='StudentCourses.jsp'">课表查询</button></td>
					<td style="width:25%"><button class= "btn btn-info" style="width:100%" onclick="window.location.href='MyGrade.jsp'">成绩查询</button></td>
				</tr>
			</table>
			<div>
			<%
				String sno = s.getId();
				ArrayList<Course> list = StudentSql.selectGrade(sno);
				Course course = null;
			%>
				<table class="table table-hover; table_center" style="margin:0 auto;width:90%">
					<tr>
						<th>课程号</th><th>课程名</th><th>任课老师</th><th>学分</th><th>成绩</th>
					</tr>
					<%
						Iterator<Course> iterator = list.iterator();
						while(iterator.hasNext()){
							course = iterator.next();
					%>
					<tr>
						<td><%=course.getCno() %></td>
						<td><%=course.getCname() %></td>
						<td><%=course.getTeacher() %></td>
						<td><%=course.getCredit() %></td>
						<td>
						<%
							String score = course.getScore();
							if(score == null){
								score = "成绩未录入";
							}
							out.print(score);
						%>
						</td>
					</tr>
					<%
						}
					%>
				</table>
			</div>
			<div class="clear"></div>			
		</div>

	</body>
</html>
