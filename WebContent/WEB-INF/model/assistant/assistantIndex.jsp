<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理页面</title>
</head>
<body>
	欢迎您 ${manager.realName } 进入助理管理页面<br/>
	<a href="<%=path %>/activity/goAddActivity">添加学术活动</a><br/>
	
</body>
</html>