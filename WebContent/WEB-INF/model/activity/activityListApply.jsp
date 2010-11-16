<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="my" uri="http://gdpu.cn/functions"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript">
	$(function() {
		list("#group_more_list", "#wall");
	});
</script>
<title>管理学术活动</title>
</head>
<body>
	<h2>我的学术活动报名审核情况</h2>
	<c:choose>
		<c:when test="${pageBean.list == null}">
						没有数据！
		</c:when>
		<c:otherwise>
			<table class="table">
				<tr>
					<th>活动名称</th>
					<th>参赛方式</th>
					<th>状态</th>
					<th>记录</th>
				</tr>
				<c:forEach items="${pageBean.list}" var="activityApply">
					<tr>
						<td><a onclick="ajaxload(this);return false;" href="<%=path%>/activity/viewActivity?id=${activityApply.activity.id }">${activityApply.activity.name}</a></td>
						<td>${activityApply.activity.applyCount == 1 ? '个人参赛' : '团队参赛'}</td>
						<td>${activityApply.status == 2 ? '通过' : activityApply.status == 3 ? '拒绝' : '审核中' }</td>
						<td>${activityApply.record}</td>
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
						<a onclick="ajaxload(this);return false;" href="<%=path%>/activity/listApplyActivity?page=1"><span>首页</span></a>
						<a onclick="ajaxload(this);return false;" href="<%=path%>/activity/listApplyActivity?page=${pageBean.currentPage-1}"><span>上一页</span></a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${pageBean.currentPage != pageBean.totalPage}">
						<a onclick="ajaxload(this);return false;" href="<%=path%>/activity/listApplyActivity?page=${pageBean.currentPage+1}"><span>下一页</span></a>
						<a onclick="ajaxload(this);return false;" href="<%=path%>/activity/listApplyActivity?page=${pageBean.totalPage}"><span>尾页</span></a>
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