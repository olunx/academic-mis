<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>管理热门通知</title>
</head>
<body>
	<h2>热门通知</h2>
	<c:choose>
		<c:when test="${nhs == null}">
						没有数据！
		</c:when>
		<c:otherwise>
			<table class="table">
				<tr>
					<th>ID</th>
					<th>标题</th>
					<th>序号</th>
					<th>删除</th>
				</tr>
				<c:forEach items="${nhs}" var="noticeHot">
					<tr>
						<td>${noticeHot.id}</td>
						<td>${noticeHot.notice.title}</td>
						<td>${noticeHot.rank}</td>
						<td><a href="<%=path%>/noticehot/deleteNoticeHot?id=${noticeHot.id }">删除</a></td>
					</tr>
				</c:forEach>
			</table>
	
		</c:otherwise>
	</c:choose>

</body>
</html>