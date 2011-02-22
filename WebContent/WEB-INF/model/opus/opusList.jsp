<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
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
		<c:choose>
			<c:when test="${listtype == 'list'}">
				<div class="breadcrumb"> <a href="<%=path%>/index">首页</a> &raquo; <a href="<%=path %>/opus/listOpus">作品展示</a> </div>
			</c:when>
			<c:when test="${listtype == 'listMyCmt'}">
				<div class="breadcrumb"> <a href="<%=path%>/index">首页</a> &raquo; <a href="<%=path %>/opus/listOpus">我点评的作品</a> </div>
			</c:when>
			<c:otherwise>
				<div class="breadcrumb"> <a href="<%=path%>/index">首页</a>  </div>
			</c:otherwise>
		</c:choose>
		
	<div class="post">
		<c:choose>
			<c:when test="${listtype == 'list'}">
				<h2 class="mainhead">作品展示</h2>
			</c:when>
			<c:when test="${listtype == 'listMyCmt'}">
				<h2 class="mainhead">我点评的作品</h2>
			</c:when>
			<c:otherwise>
				<h2 class="mainhead">返回首页</h2>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
		<c:when test="${pageBean.list == null}">
						没有数据！
		</c:when>
		<c:otherwise>
			<ul id="excerpt">
			<c:forEach items="${pageBean.list}" var="opus">
		        <li>
				<div class="p_coleft fleft">
					<p class="date_s">作品名字： <br/> <a href="<%=path%>/opus/viewOpus?id=${opus.id }">${opus.name}</a></p>
					<span class="comment_s">所属学术活动：<br/><a href="<%=path %>/activity/viewActivity?id=${opus.activityApply.activity.id}">${opus.activityApply.activity.name }</a></span>
				</div>
				<div class="p_coright fright">
					<h1 class="prevtitle">作品简介：
					<c:if test="${my:userTypeCompare(user) == 4 && my:isIcanCmt(opus,user)}"><a href="<%=path %>/opus/goVoteOpus?id=${opus.id}"><font color="red">我要点评</font></a></c:if>
					</h1>
					${fn:substring(fn:replace(opus.intro,"<","&lt;"),0,100)}<br/>
					点评<a href="<%=path%>/opus/viewOpus?id=${opus.id }">${fn:length(opus.comments)}</a>,教师评定[${my:evaluate(opus)}]
					
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
						<a class="page" href="<%=path%>/opus/listOpus?page=1">首页</a>
						<a class="page" href="<%=path%>/opus/listOpus?page=${pageBean.currentPage-1}">上一页</a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${pageBean.currentPage != pageBean.totalPage}">
						<a class="page" href="<%=path%>/opus/listOpus?page=${pageBean.currentPage+1}">下一页</a>
						<a class="last" href="<%=path%>/opus/listOpus?page=${pageBean.totalPage}">尾页</a>
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