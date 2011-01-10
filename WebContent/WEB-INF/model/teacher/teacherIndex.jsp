<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教师用户管理</title>

<%
	String path = request.getContextPath();
%>

</head>
<body>
	老师登陆成功,欢迎您${teacher.realName}<br />
	<a href="#">发布课题</a><br />
	<a href="#">查看课题</a><br />
	<a href="#">查看作品</a><br />
	<a href="#">我点评作品</a><br />
	<a href="<%=path %>/group/listAllGroup">查看学习小组</a>
</body>
</html>