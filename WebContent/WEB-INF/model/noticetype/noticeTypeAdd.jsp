<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>创建通知类型</title>

<%
	String path = request.getContextPath();
%>

</head>
<body>
	创建通知类型页面<br />
	<form action="<%=path %>/noticetype/addNoticeType" method="post">
		类型名称：<input type="text" name="ntDto.name" /><br/>
		<input type="submit" value="创建">
	</form>
</body>
</html>