<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="my" uri="http://gdpu.cn/functions"%>
<%
	String path = request.getContextPath();
%>
<jsp:include page="/top.jsp"></jsp:include>
	<!--内容区 开始 -->
	<div id="content" class="subcontainer fleft">
		<div class="breadcrumb"> <a href="<%=path%>/index">首页</a> &raquo; <a href="<%=path %>/notice/viewNotice?id=${post.parent.id}">查看通知</a> &raquo; <a href="#">修改回帖</a> </div>
	<div class="post">
		<h2 class="mainhead">通知内容</h2>
		<div class="content">
			<p>
				${post.parent.title }<br/> 
				<span>发布人：${post.parent.author.realName }</span>
			</p>
			<br/><br/>
			<h2 class="mainhead">修改评论：</h2>
			<form action="<%=path %>/post/modifyPost" method="post">
			<input type="hidden" name="id" value="${id }" />
			<input type="hidden" name="pid" value="${pid }" />
			<p>
				<textarea name="postDto.content" id="comment" cols="100%" rows="10" >${post.content }</textarea>
			</p>
			<div class="clear"></div>
			<p>
				<input name="submit" type="submit" class="submit2" value="修改提交" />
			</p>
		</form>
		</div>
	</div>
	</div>
	<!--内容区 结束 -->
	
<jsp:include page="/bottom.jsp"></jsp:include>
