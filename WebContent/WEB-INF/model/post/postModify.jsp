<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改回帖</title>

<%
	String path = request.getContextPath();
%>

</head>
<body>
	<h2 class="caption">修改回帖</h2>
				
	<div id="notice_post">
		<form action="<%=path %>/post/modifyPost" method="post">
			评论：
			<input type="text" name="id" value="${id }" />
			<input type="text" name="pid" value="${pid }" />
			<textarea rows="3" cols="40" name="postDto.content">${post.content }</textarea>
			<input type="submit" value="修改" />
		</form>
	</div>
</body>
</html>