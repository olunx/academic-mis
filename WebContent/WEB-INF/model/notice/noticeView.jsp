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
		<div class="breadcrumb"> <a href="<%=path%>/index">首页</a> &raquo; <a href="#">查看通知</a> </div>
	<div class="post">
		<h2 class="mainhead">通知内容</h2>
		<h1>
			${notice.title } <span>${notice.author.realName }</span>
		</h1>
		<div class="content">
			${notice.content }
			<br/><br/>
			<c:choose>
				<c:when test="${notice.isCmsAllow == 1}">
					<hr/>
					<div id="notice_post">
					<c:choose>
						<c:when test="${user != null}">
						<form action="<%=path %>/post/addPost" method="post">
							评论：<br/>
							<input type="hidden" name="id" value="${param.id }" />
							<textarea rows="3" cols="40" name="postDto.content"></textarea>
							<input type="submit" value="写好了，保存" />
						</form>
						</c:when>
						<c:otherwise><font color="blue">注册用户才能进行评论</font></c:otherwise>
					</c:choose>
					</div>
					
					<br/><br/>
					<c:choose>
						<c:when test="${notice.comments != null}">
							<h2 class="mainhead">用户评论</h2>
							<c:forEach items="${notice.comments}" var="post" varStatus="i">
							<div class="post">
								<div class="post_info">
								<c:if test="${user.id == post.author.id || my:userTypeCompare(user) == 1 || my:userTypeCompare(user) == 2}">
			                        <a class="btn_del float_right"  href="<%=path %>/post/deletePost?id=${notice.id }&pid=${post.id }">删除</a>
			                        <a class="btn_edit float_right" href="<%=path %>/post/goModifyPost?id=${notice.id }&pid=${post.id }">编辑</a>
		                        </c:if>
		                        ${i.count}.${post.author.realName} <fmt:formatDate value="${post.time}" pattern="yyyy-MM-dd HH:mm"/>
								</div>
								<div class="post_content">
								${post.content}
								<hr/>
								</div>
								
							</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							暂无评论
						</c:otherwise>
					</c:choose>
				</c:when>
				<c:otherwise>
					评论已关闭
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	</div>
	<!--内容区 结束 -->
	
<jsp:include page="/bottom.jsp"></jsp:include>
