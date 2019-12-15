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
		<script type="text/javascript">
			function del() {
				if(!confirm("确认要删除？")) {
					window.event.returnValue = false;
				}
			}
		</script>
		<title>管理员界面</title>
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
			<div>
				<div>
				<%
					ArrayList<Teacher> list = AdminSql.getAllTeachers();
					Teacher teacher = null;
				%>
				<table class="table table-hover; table_center" style="margin:0 auto;width:90%">
						<tr>
							<th>教师号</th><th>姓名</th><th>职称</th><th>学院</th><th><button class="btn btn-default btn-sm" ><a href="Insert_Teacher.jsp">添加教师</a></button></th>
						</tr>
						<%
							if(list != null){
								Iterator<Teacher> iterator = list.iterator();
								while(iterator.hasNext()){
									teacher = iterator.next();
						%>
						<tr>
							<td><%=teacher.getId() %></td>
							<td><%=teacher.getName() %></td>
							<td><%=teacher.getTitle() %></td>
							<td><%=teacher.getTdepartment() %></td>
							<td><button class="btn btn-default btn-sm" ><a>修改</a></button>
							<td><button class="btn btn-default btn-sm" ><a href="RemoveTeacherServlet?tno=<%=teacher.getId() %>" onclick='javascript:return del();'>删除</a></button>
						</tr>
						<%
								}
							}
						%>
					</table>
				</div>
			</div>
			<div class="clear"></div>			
		</div>

	</body>
</html>
