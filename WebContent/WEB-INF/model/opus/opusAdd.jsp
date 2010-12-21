<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>创建活动作品</title>

<%
	String path = request.getContextPath();
%>

</head>
<body>
	创建活动作品页面<br />
	<form action="<%=path %>/opus/addOpus" method="post">
		<input type="hidden" name="id" value="${id}"/><br/>
		作品名称：<input type="text" name="opusDto.name" /><br/>
		作品简介：<textarea name="opusDto.intro" rows="" cols="" ></textarea><br/>
		指导老师：<input type="text" name="opusDto.instructor" /><br/>
		<input type="submit" value="创建">
	</form>
</body>
</html>