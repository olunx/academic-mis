<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="my" uri="http://gdpu.cn/functions"%>
<%
	String path = request.getContextPath();
%>
<jsp:include page="/top.jsp"></jsp:include>
	<!--内容区 开始 -->
	<div id="content" class="subcontainer fleft">
		<div class="breadcrumb"> <a href="<%=path%>/index">首页</a> &raquo; <a href="#">学术活动介绍</a> </div>
	<div class="post">
		<h2 class="mainhead">学术活动介绍</h2>
		<c:choose>
		<c:when test="${pageBean.list == null}">
						没有数据！
		</c:when>
		<c:otherwise>
			<ul id="excerpt">
			<c:forEach items="${pageBean.list}" var="activityType">
		        <li>
				<div class="p_coleft fleft">
					<p class="date_s">${activityType.name}</p>
					<span class="comment_s">
						${activityType.level}
						<c:if test="${my:userTypeCompare(user) == 1 || my:userTypeCompare(user) == 2}">
						<a href="<%=path%>/activitytype/goModifyActivityType?id=${activityType.id }&page=${page}" class="btn_edit">编辑</a>
						<a href="<%=path%>/activitytype/deleteActivityType?id=${activityType.id }&page=${page}" class="btn_del">删除</a>
                    	</c:if>
                    </span>
				</div>
				<div class="p_coright fright">
					${fn:substring(fn:replace(activityType.intro,"<","&lt;"),0,20)}...
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
						<a class="page" href="<%=path%>/activitytype/listActivityType?page=1">首页</a>
						<a class="page" href="<%=path%>/activitytype/listActivityType?page=${pageBean.currentPage-1}">上一页</a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${pageBean.currentPage != pageBean.totalPage}">
						<a class="page" href="<%=path%>/activitytype/listActivityType?page=${pageBean.currentPage+1}">下一页</a>
						<a class="last" href="<%=path%>/activitytype/listActivityType?page=${pageBean.totalPage}">尾页</a>
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