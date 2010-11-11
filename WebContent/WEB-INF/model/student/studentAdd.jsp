<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生用户注册</title>

<%
	String path = request.getContextPath();
%>

<!-- JQuery库 -->
<script type="text/javascript" src="<%=path%>/content/js/jquery-1.4.2.min.js"></script>

<link type="text/css" rel="stylesheet" href="<%=path%>/content/jq-ui/jquery-ui-1.8.custom.css" />
<script type="text/javascript" src="<%=path%>/content/jq-ui/jquery-ui-1.8.custom.min.js"></script>
<script type="text/javascript" src="<%=path %>/content/js/jquery.doubleSelect.min.js"></script>

<script type="text/JavaScript">
	 $(document).ready(function(){
			
		var majorselect = ${clsmap};
	    $('#first').doubleSelect('second', majorselect);      
	 });
</script>
</head>
<body>
	学生注册页面<br />
	<form action="<%=path %>/student/addStudent" method="post">
		用户账号：<input type="text" name="stuDto.username" /><br/>
		用户密码：<input type="password" name="stuDto.password" /><br/>
		确认密码：<input type="password" name="stuDto.rpassword" /><br/>
		学号：<input type="text" name="stuDto.stuNO" /><br/>
		真实姓名：<input type="text" name="stuDto.realName" /><br/>
		用户性别：<input type="radio" name="stuDto.sex" value="1" checked="checked">男<input type="radio" name="stuDto.sex" value="0">女<br/>
		用户年龄：<input type="text" name="stuDto.age" /><br/>
		<div id="select">
			<label>选择班级：</label>
			<select id="first" size="1"><option value="">--</option></select>
			<select id="second" name="stuDto.classes" size="1"><option value="">--</option></select>
		</div>
		入学年份：<input type="text" name="stuDto.schoolYear" /><br/>
		<input type="submit" value="注册">
	</form>
</body>
</html>