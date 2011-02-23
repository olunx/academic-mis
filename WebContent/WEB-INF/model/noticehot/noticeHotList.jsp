<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
%>
<jsp:include page="/top.jsp"></jsp:include>

	<!--内容区 开始 -->
	<div id="content" class="subcontainer fleft">
		<div class="breadcrumb"> <a href="<%=path%>/index">首页</a> &raquo; <a href="<%=path %>/notice/ListNotice">所有通知</a> &raquo; <a href="#">管理热门通知</a> </div>
	    <!--评论列表 开始-->
	    <div id="comments">
	       <!--发表评论 开始-->
	      <div id="respond">
	        <h2 class="mainhead">管理热门通知</h2>
	        <div class="cancel-comment-reply"> <a rel="nofollow" id="cancel-comment-reply-link" href="/wordpress/?p=552#respond" style="display:none;">Cancel</a> </div>
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
			</div>
	       <!--发表评论 结束-->
	    </div>
    <!--评论列表 结束-->
	</div>
	<!--内容区 结束 -->

<jsp:include page="/bottom.jsp"></jsp:include>
