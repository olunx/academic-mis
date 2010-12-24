<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看通知</title>

<%
	String path = request.getContextPath();
%>

</head>
<body>
	<h2 class="caption">公告内容</h2>
		<div>
			<div id="notice">
				<h1>
					${notice.title } <span>${notice.author.realName }</span>
				</h1>
				<div class="content">
				${notice.content }
				</div>
			</div>
			<c:choose>
				<c:when test="${notice.isCmsAllow == 1}">
					<div id="notice_post">
						<form action="<%=path %>/post/addPost" method="post">
							评论：
							<input type="hidden" name="id" value="${param.id }" />
							<textarea rows="3" cols="40" name="postDto.content"></textarea>
							<input type="submit" value="写好了，保存" />
						</form>
					</div>
					<br/><br/>
					<c:forEach items="${notice.comments}" var="post" varStatus="i">
						<div class="post">
							<div class="post_info">
	                        <a class="btn_del float_right"  href="<%=path %>/post/deletePost?id=${notice.id }&pid=${post.id }">删除</a>
	                        <a class="btn_edit float_right" href="<%=path %>/post/goModifyPost?id=${notice.id }&pid=${post.id }">编辑</a>
	                        ${i.count}.${post.author.realName} <fmt:formatDate value="${post.time}" pattern="yyyy-MM-dd HH:mm"/>
							</div>
							<div class="post_content">
							${post.content}
							</div>
						</div>
					</c:forEach>
					
				</c:when>
				<c:otherwise>
					评论已关闭
				</c:otherwise>
			</c:choose>
		</div>
</body>
</html>