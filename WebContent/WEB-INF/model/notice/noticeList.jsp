<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>管理通知</title>
</head>
<body>
	<h2>通知页面</h2>
	<c:choose>
		<c:when test="${pageBean.list == null}">
						没有数据！
		</c:when>
		<c:otherwise>
			<table class="table">
				<tr>
					<th>通知标题</th>
					<th>通知类型</th>
					<th>评论</th>
					<th>发表人</th>
					<th>发表时间</th>
					<th>热门</th>
					<th>编辑</th>
					<th>删除</th>
				</tr>
				<c:forEach items="${pageBean.list}" var="notice">
					<tr>
						<td><a href="<%=path%>/notice/viewNotice?id=${notice.id }">${notice.title}</a></td>
						<td>${notice.type.name}</td>
						<td>
							<c:choose>
								<c:when test="${notice.isCmsAllow == 1}">
									<c:choose>
										<c:when test="${fn:length(notice.comments) == 0}">
											暂无评论
										</c:when>
										<c:otherwise>
											有<a href="<%=path%>/notice/viewNotice?id=${notice.id }">${fn:length(notice.comments)}</a>条评论
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									禁止评论
								</c:otherwise>
							</c:choose>
						</td>
						<td>${notice.author.realName }</td>
						<td><fmt:formatDate value="${notice.time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td>
							<c:choose>
								<c:when test="${notice.noticeHot == null}">
									<a href="<%=path%>/noticehot/goAddNoticeHot?id=${notice.id }">设为热门</a>
								</c:when>
								<c:otherwise>
									Hot-<a href="<%=path%>/noticehot/deleteNoticeHot?id=${notice.id }">取消</a>
								</c:otherwise>
							</c:choose>
						</td>
						<td><a href="<%=path%>/notice/goModifyNotice?id=${notice.id }">编辑</a></td>
						<td><a href="<%=path%>/notice/deleteNotice?id=${notice.id }">删除</a></td>
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
						<a onclick="ajaxload(this);return false;" href="<%=path%>/notice/listNotice?page=1"><span>首页</span></a>
						<a onclick="ajaxload(this);return false;" href="<%=path%>/notice/listNotice?page=${pageBean.currentPage-1}"><span>上一页</span></a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${pageBean.currentPage != pageBean.totalPage}">
						<a onclick="ajaxload(this);return false;" href="<%=path%>/notice/listNotice?page=${pageBean.currentPage+1}"><span>下一页</span></a>
						<a onclick="ajaxload(this);return false;" href="<%=path%>/notice/listNotice?page=${pageBean.totalPage}"><span>尾页</span></a>
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