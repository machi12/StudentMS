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
		<title>学生界面</title>
		<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css">
		<link type="text/css" rel="stylesheet" href="css/index.css">
	<body>
		<%
			Admin a = (Admin)request.getSession().getAttribute("admin");
			//Teacher t = (Teacher)request.getSession().getAttribute("teacher");
			if(a == null){
				response.sendRedirect("notlogin.jsp");
			}
		%>
		<%
			request.setCharacterEncoding("UTF-8");
			String pages = request.getParameter("pages");	//获取当前页数
			int pagesNo = Integer.parseInt(pages);	//把当前页数从字符串转为整形
			int startLine = (Integer.parseInt(pages)-1)*10;	//指定数据库从哪一行开始读取
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
				<%
					int pageSize = 15;	//指定数据库一次读取多少行
					int pagesCount = 0;	//总页数
					int lastRow = AdminSql.countStudents();	//记录数据库的最后一行
					ArrayList<Student> list = AdminSql.getStudents(startLine, pageSize);	//对数据库进行伪分页
					//ArrayList<Student> list = AdminSql.getAllStudents();
					Student student = null;
					//int index = 0;
				%>
				<table class="table table-hover; table_center" style="margin:0 auto;width:90%">
					<tr>
						<th>学号</th>
						<th>姓名</th>
						<th>学院</th>
						<th>状态</th>
						<th><button class="btn btn-default btn-sm" onclick="window.location.href='Insert_Student.jsp'">添加学生</button></th>
						<th>
							<form action="Select_Student.jsp" method="post">
								<input type="text" name="check" placeholder="请输入查询学号或姓名"/>
								<button class="btn btn-default btn-sm" type="submit" name="submit" >搜索</button>
							</form>
						</th>
					</tr>
					<%
						if(list != null){
							Iterator<Student> iterator = list.iterator();
							while(iterator.hasNext()){
								student = iterator.next();
					%>
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
						<td><button class= "btn btn-default btn-sm" ><a href="Alter_Student.jsp?sno=<%=student.getId() %>">修改</a></button></td>
						<td><button class= "btn btn-default btn-sm" onclick='javascript:return del();'><a href="RemoveStudentServlet?sno=<%=student.getId() %>">删除</a></button></td>
					</tr>
					<%
							}
						}
					%>
				</table>
				<table class="table table-condensed;table-condensed_new" style="margin:0 auto;width:90%">
				
					<tr>
					<%
						int prePage;	//上一页的页数
						if(pagesNo == 1){
							prePage = 1;	//若当前页是第一页,则第一页只能是当前页
						}
						else{
							prePage = pagesNo - 1;	//除了上述情况外上一页等于当前页-1页
						}
					%>
					<td><button class="btn btn-default btn-sm" style="width:50%"><a href="Manage_Students.jsp?pages=<%=prePage %>">上一页</a></button></td>
					<%
						pagesCount = (lastRow%pageSize == 0)?(lastRow/pageSize):(lastRow/pageSize + 1);	//计算数据库能读出来的全部页数
						int minPages = (pagesNo - 3 > 0)?(pagesNo - 3):1;	//设定最小页,防止页数小于第一页
						int maxPages = (pagesNo + 3 >= pagesCount)?(pagesCount):(pagesNo+3);	//设定最大页
						for(int i = minPages; i <= maxPages; i++){
							if(i == pagesNo){	//当前页和遍历出来的页数相等时,需要通过调用css里面的样式"active"进行高亮
								out.print("<td> <button class=\"btn btn-default btn-sm\" > ");
								out.print("<a href='Manage_Students.jsp?pages=" + i + "'>" + i + "</a>");
								out.print("</button> </td>");
							}
							else{	//输出每一个分页								
								out.print("<td> <button class=\"btn btn-default btn-sm\" > ");
								out.print("<a href='Manage_Students.jsp?pages=" + i + "'>" + i + "</a>");
								out.print("</button> </td>");
							}
						}
					%>
					<%
						int nextPage;
						if(pagesNo == pagesCount){	//下一页的原理和上一页相同
							nextPage = pagesCount;
						}
						else{
							nextPage = pagesNo + 1;
						}
					%>
					<td><button class="btn btn-default btn-sm" style="width:50%"><a href="Manage_Students.jsp?pages=<%=nextPage %>">下一页</a></button></td>
					</tr>

				</table>
			</div>		
		</div>

	</body>
</html>
