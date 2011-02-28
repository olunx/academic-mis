<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
%>
<jsp:include page="/top.jsp"></jsp:include>
	<!--内容区 开始 -->
	<div id="content" class="subcontainer fleft">
		<div class="breadcrumb"> <a href="<%=path%>/index">首页</a> &raquo; <a href="#">管理学术活动类型</a> </div>
	<div class="post">
		<h2 class="mainhead">学术活动类型列表</h2>
		<c:choose>
		<c:when test="${pageBean.list == null}">
						没有数据！
		</c:when>
		<c:otherwise>
			<ul id="excerpt">
			<c:forEach items="${pageBean.list}" var="notice">
		        <li>
				<div class="p_coleft fleft">
					<p class="date_s"><fmt:formatDate value="${notice.time}" pattern="yyyy-MM-dd"/></p>
					<span class="comment_s">
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
                    </span>
				</div>
				<div class="p_coright fright">
					<h1 class="prevtitle">(${activityType.level})${activityType.name}</h1>
						<a href="<%=path%>/activity/listByTypeActivity?id=${activityType.id }&page=${page}" class="btn_edit">查看相关活动</a>
                        &nbsp;&nbsp;&nbsp;<a href="<%=path%>/activitytype/goModifyActivityType?id=${activityType.id }&page=${page}">编辑</a>
                        &nbsp;&nbsp;&nbsp;<a href="<%=path%>/activitytype/deleteActivityType?id=${activityType.id }&page=${page}">删除</a>
						<br />活动简介：${fn:substring(fn:replace(activityType.intro,"<","&lt;"),0,100)}...
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