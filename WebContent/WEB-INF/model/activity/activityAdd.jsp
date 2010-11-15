<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>创建学术活动</title>

<%
	String path = request.getContextPath();
%>

</head>
<body>
	创建学术活动页面<br />
	<form action="<%=path %>/activity/addActivity" method="post">
		活动名称：<input type="text" name="acDto.name" /><br/>
		活动届次：<input type="text" name="acDto.session" /><br/>
		活动类型：<div id="select">
					<label>选择类型：</label>
					<select name="acDto.activityType" size="1">
						<c:forEach items="${ats}" var="atype" ><option value="${atype.id}">${atype.name}</option></c:forEach>
					</select>
				</div>
		活动内容：<br/><textarea name="activity.intro" rows="10" cols="60" ></textarea><br/>
		活动报名开始时间: <input type="text" name="acDto.airtime" /><br/>
		活动报名截止时间: <input type="text" name="acDto.deadtime" /><br/>
		<input type="submit" value="创建">
	</form>
</body>
</html>