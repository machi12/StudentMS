<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>未登录,请先登陆</title>
</head>
<body>
	<div>
		未登录,请先登陆
	</div>
	<%
		response.setHeader("Refresh", "2;url=login.html");
	%>

</body>
</html>