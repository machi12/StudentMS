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
				String sno = request.getParameter("sno");
				//out.println(cno);
				//out.println(sno);
				Student student = TeacherSql.getStudent(sno);
				%>
				<div>
					<form method="post" action="SetScoreServlet">
						<table class="table table-hover; table_center" style="margin:0 auto;width:90%">
							<tr>
								<td>姓名:<%=student.getName() %><br/></td>
								<td>学号:<%=student.getId() %><br/></td>
								<td>学院:<%=student.getSdepartment() %><br/></td>
								<td>成绩:<input type="text" name="score" id="score" /></td>
								<!-- 通过隐藏域向后台传值 -->
								<input type="hidden" name="sno" value="<%=sno %>" />
								<input type="hidden" name="cno" value="<%=cno %>" />
								<br/>
								<td><button class="btn btn-default btn-sm"  type="submit" name="submit" id="submit" value="提交"/>提交</td>
					</form>
				</div>
			</div>
			<div class="clear"></div>			
		</div>

	</body>
</html>
