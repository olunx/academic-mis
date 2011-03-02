<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
%>
<jsp:include page="/top.jsp"></jsp:include>
	<!--内容区 开始 -->
	<div id="content" class="subcontainer fleft">
		<div class="breadcrumb"> <a href="<%=path%>/index">首页</a> &raquo; <a href="#">管理通知类型</a> </div>
	<div class="post">
		<h2 class="mainhead">通知类型</h2>
		<c:choose>
		<c:when test="${pageBean.list == null}">
						没有数据！
		</c:when>
		<c:otherwise>
			<ul id="excerpt">
			<c:forEach items="${pageBean.list}" var="noticeType">
		        <li>
				<div class="p_coleft fleft">
					<p class="date_s"><a href="<%=path%>/noticetype/goModifyNoticeType?id=${noticeType.id }">-----编辑-----</a></p>
					<span class="comment_s"><a href="<%=path%>/noticetype/deleteNoticeType?id=${noticeType.id }">删除</a></span>
				</div>
				<div class="p_coright fright">
					<h1 class="prevtitle">类型名称：<a href="<%=path%>/notice/listTypeNotice?id=${noticeType.id }">${noticeType.name}</a></h1>
				 </div>
				<br class="clear" />
		        </li>
	        </c:forEach>
	        </ul>
			
			<br class="clear">
			<div class="wp-pagenavi">
				<span class="pages">共 ${pageBean.allRow} 条记录  页码 ${pageBean.currentPage}/${pageBean.totalPage}</span>
				<c:choose>
					<c:when test="${pageBean.currentPage == 1}">
						<a class="page">首页</a>
						<a class="page">上一页</a>
					</c:when>
					<c:otherwise>
						<a class="page" href="<%=path%>/noticetype/listNoticeType?page=1">首页</a>
						<a class="page" href="<%=path%>/noticetype/listNoticeType?page=${pageBean.currentPage-1}">上一页</a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${pageBean.currentPage != pageBean.totalPage}">
						<a class="page" href="<%=path%>/noticetype/listNoticeType?page=${pageBean.currentPage+1}">下一页</a>
						<a class="last" href="<%=path%>/noticetype/listNoticeType?page=${pageBean.totalPage}">尾页</a>
					</c:when>
					<c:otherwise>
						<a class="page">下一页</a>
						<a class="last">尾页</a>
					</c:otherwise>
				</c:choose>
			</div>
			</c:otherwise>
	</c:choose>
	</div>
	</div>
	<!--内容区 结束 -->
	
<jsp:include page="/bottom.jsp"></jsp:include>