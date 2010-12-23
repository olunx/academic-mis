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
	<a href="<%=path %>/activity/listActivity">列出学术活动</a><br/>
	<a href="<%=path %>/noticetype/goAddNoticeType">添加通知类型</a><br/>
	<a href="<%=path %>/noticetype/listNoticeType">列出通知类型</a><br/>
	<a href="<%=path %>/notice/goAddNotice">添加通知</a><br/>
	<a href="<%=path %>/notice/listNotice">列出通知</a><br/>
	
</body>
</html>