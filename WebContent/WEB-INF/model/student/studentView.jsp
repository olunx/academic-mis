<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生用户管理</title>

<%
	String path = request.getContextPath();
%>

</head>
<body>
	学生注册成功,欢迎您${student.realName}<br />
	<a href="<%=path %>/group/goAddGroup">创建小组</a><br/>
	<a href="<%=path %>/group/listGroup">查看我加入的小组</a><br/>
	<a href="<%=path %>/group/listMeGroup">查看我创建的小组</a><br/>
	<a href="<%=path %>/group/listApplyGroup">查看我申请的小组</a><br/>
	<a href="<%=path %>/group/listAllGroup">查看所有的小组</a>
</body>
</html>