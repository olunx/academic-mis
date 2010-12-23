<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改通知</title>

<%
	String path = request.getContextPath();
%>

</head>
<body>
	修改通知页面<br />
	<form action="<%=path %>/notice/modifyNotice" method="post">
		<input type="hidden" name="id" value="${notice.id }"/>
		通知标题：<input type="text" name="noticeDto.title" value="${notice.title }"/><br/>
		通知类型: 
			<select name="noticeDto.type" size="1">
					<c:forEach items="${nts}" var="type" >
						<c:choose>
							<c:when test="${notice.id == type.id}">
								<option value="${type.id}" selected="selected">${type.name}</option>
							</c:when>
							<c:otherwise>
								<option value="${type.id}">${type.name}</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
			</select>
			<a href="<%=path %>/noticetype/goAddNoticeType">新建类型</a>
		是否允许评论: 
			<c:choose>
				<c:when test="${notice.isCmsAllow == 1}">
					<input type="radio" name="noticeDto.isCmsAllow" value="1" checked="checked" />是
					<input type="radio" name="noticeDto.isCmsAllow" value="0" />否<br/>
				</c:when>
				<c:otherwise>
					<input type="radio" name="noticeDto.isCmsAllow" value="1" />是
					<input type="radio" name="noticeDto.isCmsAllow" value="0" checked="checked"/>否<br/>
				</c:otherwise>
			</c:choose>
		通知内容：<br/><textarea name="noticeDto.content" rows="10" cols="60" >${notice.content }</textarea><br/>
		
		<input type="submit" value="修改">
	</form>
</body>
</html>