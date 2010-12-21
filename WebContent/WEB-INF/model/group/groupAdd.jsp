<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>创建学生小组</title>

<%
	String path = request.getContextPath();
%>

</head>
<body>
	创建学生小组页面<br />
	<form action="<%=path %>/group/addGroup" method="post">
		小组名称：<input type="text" name="group.name" /><br/>
		小组简介：<textarea name="group.intro" rows="" cols="" ></textarea><br/>
		<input type="submit" value="创建">
	</form>
</body>
</html>