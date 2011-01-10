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
<div class="post-552 post type-post hentry category-android tag-37"
	id="post-552">
<div class="posthead">
<div class="maindate fleft">09<br />
<span>十一 </span></div>
<h1 class="maintitle fleft"><a href="#" rel="bookmark">${group.name}</a></h1>
<br class="clear" />
</div>
<div class="entry">小组介绍: ${group.intro }</div>
<p class="postinfo clear"><span class="category">小组组长：<a href="#" rel="category">${group.captain.realName }</a></span>
<c:choose>
	<c:when test="${my:isMyGroup(group,student)}">
		<span class="comment"><a href="<%=path%>/group/quitGroup?id=${group.id}">退出</a></span>
	</c:when>
	<c:otherwise><span class="comment"><a href="<%=path%>/group/applyGroup?id=${group.id}">申请加入</a></span></c:otherwise>
</c:choose> <br />
</p>
<p class="tag"><c:choose>
	<c:when test="${my:isMyApplyGroup(group,student)}">
		<a href="<%=path%>/group/listApplyGroup">你已经申请加入该小组了,请等待审核</a>
	</c:when>
</c:choose></p>
<p></p>
</div>
<!--小组成员 开始-->
<div class="related">
<h3>小组成员</h3>
<ul>
	<c:forEach items="${group.members}" var="member" varStatus="status">
		<li><img src="<%=path%>/style/images/avatar.jpg" width="64" height="64" /> <a
			href="<%=path%>/student/viewStudent?id=${member.id}" rel="bookmark">${member.realName}</a></li>
	</c:forEach>
</ul>
<br class="clear" />
</div>
<!--小组成员 结束--> <!--申请加入小组 开始-->
<div id="comments"><c:choose>
	<c:when test="${group.captain.id == student.id}">
		<c:choose>
			<c:when test="${my:groupApplyCount(group) != 0}">
				<h2 class="mainhead">有${my:groupApplyCount(group)}个学生申请加入小组</h2>
				<ol class="commentlist">
					<c:forEach items="${group.groupApplys}" var="groupApply">
						<c:if test="${groupApply.status == 1}">
							<li class="comment even thread-even depth-1" id="li-comment-204">
							<div id="comment-204">
							<div class="comment-author fleft"><img
								src='<%=path%>/style/images/nobody.png'
								class='avatar avatar-60 photo' height='60' width='60' /></div>
							<div class="comment-info fright">
							<div class="c_info"><a href='#' class='url'>${groupApply.student.realName}</a>
							(${groupApply.student.age == 0 ? '女' : '男'})</div>
							<p>${groupApply.student.classes.name}
							${groupApply.student.schoolYear}</p>
							<div class="reply fleft"><a class='comment-reply-link'
								href='<%=path%>/group/passGroup?id=${groupApply.id}'>通过</a> | <a
								class='comment-reply-link'
								href='<%=path%>/group/refuseGroup?id=${groupApply.id}'>拒绝</a></div>
							</div>
							<div class="clear"></div>
							</div>
							</li>
						</c:if>
					</c:forEach>
				</ol>
			</c:when>
			<c:otherwise>
				<h2 class="mainhead">暂时没有学生申请加入</h2>
			</c:otherwise>
		</c:choose>
	</c:when>
</c:choose></div>
<!--申请加入小组 结束--> <!--发表评论 开始-->
<div id="respond">
<h2 class="mainhead">参加过的学术活动</h2>
<c:choose>
	<c:when test="${manager != null}">
		<c:choose>
			<c:when
				test="${group.teamApplys != null && fn:length(group.teamApplys) != 0}">
				<table class="table">
					<tr>
						<th>活动名称</th>
						<th>活动结果</th>
					</tr>
					<c:forEach items="${group.teamApplys}" var="ta">
						<tr>
							<td><a
								href="<%=path%>/activity/viewActivity?id=${ta.activity.id}">${ta.activity.name}</a></td>
							<td>${ta.activityResult != null ? ta.activityResult.remark :
							ta.status == 3 ? '该学生未能通过申请' : '参加了该活动'}</td>
						</tr>
					</c:forEach>
				</table>
			</c:when>
			<c:otherwise> 该小组没有参加过学术活动 </c:otherwise>
		</c:choose>
	</c:when>
</c:choose></div>
<!--发表评论 结束--></div>
<!--内容区 结束 -->
<jsp:include page="/sidestu.jsp"></jsp:include>
<jsp:include page="/bottom.jsp"></jsp:include>
