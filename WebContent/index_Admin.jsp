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
			<div class="message_board">
				<h1 class="message_title">公告</h1>
				<!-- <article class="message_content">内容</article> -->
				<div class="content_1">
				<p>
					&nbsp;&nbsp;网络视频课程（课程号080005开头的任选课）必须通过选课系统选定该类课程，一般在每学期的第二周开放在线学习平台，期末考试前一周安排网上测试。
					选定该类课程的同学通过登录教务处网站或信息技术管理处网站点击“网络视频课程在线学习平台”链接进入，学习登录时，用户名为学号，初始登录密码为‘123456’，初次登录后修改学习密码。  
				</p>
				<p>
  					&nbsp;&nbsp;请认真核实自己的课程表，不要漏选应修的课程，课程表中未有的课程将不予登记成绩；不要多选不修的课程，否则将影响毕业学分审核及平均学分绩点计算。    
				</p>
				<p>
  					&nbsp;&nbsp;选课中遇到问题请查看选课公告中相关文件或咨询本学院教务员老师。
				</p>
				<p>
  					&nbsp;&nbsp;忘记密码请联系本学院教务员老师查询。
  				</p>
				</div>

			</div>
			<div class="clear"></div>			
		</div>

	</body>
</html>
