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
	<h2>全部学术活动</h2>
	<c:choose>
		<c:when test="${pageBean.list == null}">
						没有数据！
		</c:when>
		<c:otherwise>
			<table class="table">
				<tr>
					<th>活动名称</th>
					<th>活动内容</th>
					<th>届次</th>
					<th>所属类型</th>
					<th>报名方式</th>
					<th>发布人</th>
					<th>创建时间</th>
					<c:if test="${manager != null }">
					<th>报名情况</th>
					</c:if>
				</tr>
				<c:forEach items="${pageBean.list}" var="activity">
					<tr>
						<td><a onclick="ajaxload(this);return false;" href="<%=path%>/activity/viewActivity?id=${activity.id }">${activity.name}</a></td>
						<td>${fn:substring(fn:replace(activity.intro,"<","&lt;"),0,20)}...</td>
						<td>第${activity.session}届</td>
						<td>${activity.activityType.name}</td>
						<td>${activity.applyCount == 1 ? '单人报名' : '团队报名'},限${activity.applyCount }人</td>
						<td>${activity.publisher.permission == 1? '系统管理员' : '管理员助理'}:${activity.publisher.realName}</td>
						<td>${activity.time}</td>
						<c:if test="${manager != null }">
						<th>
							<c:choose>
								<c:when test="${my:activityApplyCount(activity) != 0}">
									<font color="red" >当前有${my:activityApplyCount(activity)}个报名</font>
								</c:when>
								<c:otherwise>暂时没有报名</c:otherwise>
							</c:choose>
						</c:if>
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
						<a onclick="ajaxload(this);return false;" href="<%=path%>/activity/listActivity?page=1"><span>首页</span></a>
						<a onclick="ajaxload(this);return false;" href="<%=path%>/activity/listActivity?page=${pageBean.currentPage-1}"><span>上一页</span></a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${pageBean.currentPage != pageBean.totalPage}">
						<a onclick="ajaxload(this);return false;" href="<%=path%>/activity/listActivity?page=${pageBean.currentPage+1}"><span>下一页</span></a>
						<a onclick="ajaxload(this);return false;" href="<%=path%>/activity/listActivity?page=${pageBean.totalPage}"><span>尾页</span></a>
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