<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" uri="http://gdpu.cn/functions"%>
<%
	String path = request.getContextPath();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>作品显示页面</title>
</head>
<body>
	作品显示页面<br/>
	作品名称：${opus.name }<br/>
	所属比赛: ${opus.activityApply.activity.name}<br/>
	作品介绍: ${opus.intro }<br/><br/>
	<c:if test="${my:isMyOpus(activityApply,student)}"><a href="<%=path %>/opus/goModifyOpus?id=${opus.id}">修改作品</a></c:if>
	<c:choose>
		<c:when test="${opus.instructor != null}">
			指导老师:<a href="<%=path %>/teacher/viewTeacher?id=${opus.instructor.id}">${opus.instructor.realName}</a>
		</c:when>
		<c:otherwise>
			<br/>你的作品还没有指导老师，请输入正确的教师号添加
			<form action="<%=path %>/opus/modifyOpus" method="post"> 
				<input type="hidden" name="opusDto.id" value="opus.id">
				指导老师号:<input type="text" name="opusDto.instructor" /><input type="submit" value="添加" />
			</form>
		</c:otherwise>
	</c:choose>
</body>
</html>