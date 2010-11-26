<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加活动结果</title>

<%
	String path = request.getContextPath();
%>

</head>
<body>
	添加活动结果页面<br />
	<form action="<%=path %>/activityResult/addActivityResult" method="post">
		<input type="hidden" name="id" value="${id}"/><br/>
		获奖等级：<input type="text" name="arDto.prize" /><br/>
		获奖名称: <input type="text" name="arDto.name" /><br/> 
		获奖说明：<textarea name="arDto.remark" rows="" cols="" ></textarea><br/>
		<input type="submit" value="添加">
	</form>
</body>
</html>