<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="sms.bean.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="sms.dao.*" %>
<%@ page import="java.util.Iterator" %>
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
					String tno = t.getId();
					ArrayList<Course> list = TeacherSql.getTCourses(tno);
					Course course = null;
				%>
				<table class="table table-hover; table_center" style="margin:0 auto;width:90%">
					<tr>
						<th>课程号</th><th>课程名称</th><th>课容量</th><th>选课人数</th><th>学分</th><th>教室</th>
					</tr>
					<%
						if(list != null){
							Iterator<Course> iterator = list.iterator();
							while(iterator.hasNext()){
								course = iterator.next();
					%>
					<tr>
						<td><%=course.getCno() %></td>
						<td><%=course.getCname() %></td>
						<td><%=course.getScale() %></td>
						<td><%=course.getNumber() %></td>
						<td><%=course.getCredit() %></td>
						<td><%=course.getRoom() %></td>
						<td><button class="btn btn-default btn-sm" ><a href="MyCourses_details.jsp?cno=<%=course.getCno() %>">详情</a></button>
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
