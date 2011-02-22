<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="my" uri="http://gdpu.cn/functions"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
%>
<jsp:include page="/top.jsp"></jsp:include>
	<!--内容区 开始 -->
	<div id="content" class="subcontainer fleft">
		<div class="breadcrumb"> <a href="<%=path%>/index">首页</a> &raquo; <a href="<%=path %>/activity/listActivity">所有学术活动</a> </div>
	<div class="post">
		<h2 class="mainhead">所有学术活动</h2>
		<c:choose>
		<c:when test="${pageBean.list == null}">
						没有数据！
		</c:when>
		<c:otherwise>
			<ul id="excerpt">
			<c:forEach items="${pageBean.list}" var="activity">
		        <li>
				<div class="p_coleft fleft">
					<p class="date_s"><fmt:formatDate value="${activity.time}" pattern="yyyy-MM-dd"/></p>
					<span class="comment_s">${my:userTypeCompare(activity.publisher) == 1? '管理员' : '助理员'}:${activity.publisher.realName}</span>
				</div>
				<div class="p_coright fright">
					<h1 class="prevtitle"><a href="<%=path%>/activity/viewActivity?id=${activity.id }">${activity.name}</a></h1>
							<c:if test="${my:userTypeCompare(user) == 1 || my:userTypeCompare(user) == 2}">
							<c:choose>
								<c:when test="${my:activityApplyCount(activity) != 0}">
									<font color="red" >当前有${my:activityApplyCount(activity)}个报名</font><br />
								</c:when>
								<c:otherwise>暂时没有报名<br /></c:otherwise>
							</c:choose>
						</c:if>
                   	参赛方式： ${activity.applyCount == 1 ? '单人报名' : '团队报名'}，限${activity.applyCount }人。      其它：${activity.opusNeed == 1  ? '要求作品' : '无需作品'}
                    <br />简介:${fn:substring(fn:replace(activity.intro,"<","&lt;"),0,100)}
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
						<a class="page" href="<%=path%>/activity/listActivity?page=1">首页</a>
						<a class="page" href="<%=path%>/activity/listActivity?page=${pageBean.currentPage-1}">上一页</a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${pageBean.currentPage != pageBean.totalPage}">
						<a class="page" href="<%=path%>/activity/listActivity?page=${pageBean.currentPage+1}">下一页</a>
						<a class="last" href="<%=path%>/activity/listActivity?page=${pageBean.totalPage}">尾页</a>
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