<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教师用户注册</title>

<%
	String path = request.getContextPath();
%>

<!-- JQuery库 -->
<script type="text/javascript" src="<%=path%>/content/js/jquery-1.4.2.min.js"></script>

<link type="text/css" rel="stylesheet" href="<%=path%>/content/jq-ui/jquery-ui-1.8.custom.css" />
<script type="text/javascript" src="<%=path%>/content/jq-ui/jquery-ui-1.8.custom.min.js"></script>

</head>
<body>
	教师注册页面<br />
	<form action="<%=path %>/teacher/addTeacher" method="post">
		用户账号：<input type="text" name="teaDto.username" /><br/>
		用户密码：<input type="password" name="teaDto.password" /><br/>
		确认密码：<input type="password" name="teaDto.rpassword" /><br/>
		教师号：<input type="text" name="teaDto.tnum" /><br/>
		真实姓名：<input type="text" name="teaDto.realName" /><br/>
		用户性别：<input type="radio" name="teaDto.sex" value="1" checked="checked">男<input type="radio" name="teaDto.sex" value="0">女<br/>
		用户年龄：<input type="text" name="teaDto.age" /><br/>
		<div id="select">
			<label>选择班级：</label>
			<select name="teaDto.institute" size="1">
				<c:forEach items="${institutes}" var="institute" ><option value="${institute.id}">${institute.name}</option></c:forEach>
			</select>
		</div>
		<input type="submit" value="注册">
	</form>
</body>
</html>