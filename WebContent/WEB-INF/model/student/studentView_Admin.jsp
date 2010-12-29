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
	查看学生信息,${student.realName}<br />
	学生参加活动情况<br />
	<c:forEach items="${student.activityApplys}" var="aa">
		${aa.activity.name }<br />
	</c:forEach>
</body>
</html>