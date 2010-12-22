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

<title>管理通知类型</title>
</head>
<body>
	<h2>通知类型</h2>
	<c:choose>
		<c:when test="${pageBean.list == null}">
						没有数据！
		</c:when>
		<c:otherwise>
			<table class="table">
				<tr>
					<th>类型名称</th>
					<th>编辑</th>
					<th>删除</th>
				</tr>
				<c:forEach items="${pageBean.list}" var="noticeType">
					<tr>
						<td><a href="<%=path%>/noticetype/viewNoticeType?id=${noticeType.id }">${noticeType.name}</a></td>
						<td><a href="<%=path%>/noticetype/goModifyNoticeType?id=${noticeType.id }">编辑</a></td>
						<td><a href="<%=path%>/noticetype/deleteNoticeType?id=${noticeType.id }">删除</a></td>
					</tr>
				</c:forEach>
			</table>
	
			<div id="pagecount">
				<p>共  ${pageBean.allRow} 条记录 共 ${pageBean.totalPage} 页 当前第 ${pageBean.currentPage}页</p>
				<c:choose>
					<c:when test="${pageBean.currentPage == 1}">
						<a><span>首页</span></a>
						<a><span>上一页</span></a>
					</c:when>
					<c:otherwise>
						<a onclick="ajaxload(this);return false;" href="<%=path%>/noticetype/listNoticeType?page=1"><span>首页</span></a>
						<a onclick="ajaxload(this);return false;" href="<%=path%>/noticetype/listNoticeType?page=${pageBean.currentPage-1}"><span>上一页</span></a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${pageBean.currentPage != pageBean.totalPage}">
						<a onclick="ajaxload(this);return false;" href="<%=path%>/noticetype/listNoticeType?page=${pageBean.currentPage+1}"><span>下一页</span></a>
						<a onclick="ajaxload(this);return false;" href="<%=path%>/noticetype/listNoticeType?page=${pageBean.totalPage}"><span>尾页</span></a>
					</c:when>
					<c:otherwise>
						<a><span>下一页</span></a>
						<a><span>尾页</span></a>
					</c:otherwise>
				</c:choose>
				</div>
		
	
		</c:otherwise>
	</c:choose>

</body>
</html>