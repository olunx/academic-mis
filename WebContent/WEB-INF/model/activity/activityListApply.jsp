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
		<div class="breadcrumb"> <a href="<%=path%>/index">首页</a> &raquo; <a href="<%=path %>/activity/listApplyActivity">我申请的活动</a> </div>
	<div class="post">
		<h2 class="mainhead">我申请的活动</h2>
		<c:choose>
		<c:when test="${pageBean.list == null}">
						没有数据！
		</c:when>
		<c:otherwise>
			<ul id="excerpt">
			<c:forEach items="${pageBean.list}" var="activityApply">
		        <li>
				<div class="p_coleft fleft">
					<p class="date_s"> 审核状态：<a>${activityApply.status == 2 ? '通过' : activityApply.status == 3 ? '拒绝' : '审核中' }</a></p>
					<span class="comment_s">记录：${activityApply.record}</span>
				</div>
				<div class="p_coright fright">
					<h1 class="prevtitle"><a href="<%=path%>/activity/viewActivity?id=${activityApply.activity.id }">${activityApply.activity.name}</a></h1>
					<c:choose>
                    <c:when test="${activityApply.activity.opusNeed == 1 && activityApply.opus == null}">
                            <a href="<%=path %>/opus/goAddOpus?id=${activityApply.id}"><font color="red">创建作品</font></a>
                        </c:when>	
                        <c:when test="${activityApply.activity.opusNeed == 1 && activityApply.opus != null}">
                            <a href="<%=path %>/opus/viewOpus?id=${activityApply.opus.id}">查看作品</a>
                        </c:when>
                        <c:otherwise>该活动无需作品</c:otherwise>
                     </c:choose>
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
						<a class="page" href="<%=path%>/activity/listApplyActivity?page=1">首页</a>
						<a class="page" href="<%=path%>/activity/listApplyActivity?page=${pageBean.currentPage-1}">上一页</a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${pageBean.currentPage != pageBean.totalPage}">
						<a class="page" href="<%=path%>/activity/listApplyActivity?page=${pageBean.currentPage+1}">下一页</a>
						<a class="last" href="<%=path%>/activity/listApplyActivity?page=${pageBean.totalPage}">尾页</a>
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