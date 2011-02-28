<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="my" uri="http://gdpu.cn/functions"%>
<%
	String path = request.getContextPath();
%>
<jsp:include page="/top.jsp"></jsp:include>
	<!--内容区 开始 -->
	<div id="content" class="subcontainer fleft">
		<div class="breadcrumb"> <a href="<%=path%>/index">首页</a> &raquo; <a href="<%=path %>/myindex">个人中心</a> &raquo; <a href="#">我的消息</a> </div>
	<div class="post">
		<h2 class="mainhead">消息列表</h2>
		<c:choose>
		<c:when test="${pageBean.list == null}">
						没有数据！
		</c:when>
		<c:otherwise>
			<ul id="excerpt">
			<c:forEach items="${pageBean.list}" var="feedBox">
		        <li>
				<div class="p_coleft fleft">
					<p class="date_s">
						${my:checkFeedType(feedBox.feed) }<br/>
						[${feedBox.hasRead == 0 ? '<font color="red">新消息</font>' : '<font color="blue">已读</font>'}]
					</p>
					<span class="comment_s">
						<fmt:formatDate value="${feedBox.feed.time}" pattern="yyyy-MM-dd"/>
                    </span>
				</div>
				<div class="p_coright fright">
					<h1 class="prevtitle"><a href="<%=path%>/feed/viewFeed?id=${feedBox.id }">${feedBox.feed.news}</a></h1>
                        &nbsp;&nbsp;&nbsp;<a href="<%=path%>/feed/deleteFeed?id=${feedBox.id }">删除</a>
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
						<a class="page" href="<%=path%>/feed/listMeFeed?page=1">首页</a>
						<a class="page" href="<%=path%>/feed/listMeFeed?page=${pageBean.currentPage-1}">上一页</a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${pageBean.currentPage != pageBean.totalPage}">
						<a class="page" href="<%=path%>/feed/listMeFeed?page=${pageBean.currentPage+1}">下一页</a>
						<a class="last" href="<%=path%>/feed/listMeFeed?page=${pageBean.totalPage}">尾页</a>
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