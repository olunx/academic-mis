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
<div class="breadcrumb"> <a href="<%=path%>/index">首页</a> &raquo; <a href="#">查看作品</a> </div>
<div class="post-552 post type-post hentry category-android tag-37"	id="post-552">
<div class="posthead">
<div class="maindate fleft">00<br />
<span>作品</span></div>
<h1 class="maintitle fleft"><a href="#">作品名称：${opus.name }</a></h1>
<br class="clear" />
</div>
<div class="entry">所属比赛: <a href="<%=path %>/activity/viewActivity?id=${opus.activityApply.activity.id}">${opus.activityApply.activity.name}</a><br />
作品介绍: ${opus.intro }<br />
作者:<c:choose>
	<c:when test="${activityApply.activity.applyCount == 1}">
		<a href="<%=path %>/student/viewStudent?id=${activityApply.student.id }">${activityApply.student.realName }</a>
	</c:when>
	<c:otherwise>
		<c:forEach items="${activityApply.applicants}" var="student"  >
			<a href="<%=path %>/student/viewStudent?id=${student.id }">${student.realName }</a>,
		</c:forEach>
	</c:otherwise>
</c:choose>
<br/>
<c:choose>
	<c:when test="${opus.instructor != null}">
			指导老师:<a href="<%=path%>/teacher/viewTeacher?id=${opus.instructor.id}">${opus.instructor.realName}</a>
	</c:when>
	<c:otherwise>
		<br /><font color="red">该作品还没有指导老师。</font>
	</c:otherwise>
</c:choose></div>
<p class="postinfo clear"><span class="category"><c:if test="${student != null && my:isMyOpus(opus.activityApply,student)}">
	<a href="<%=path%>/opus/goModifyOpus?id=${opus.id}">修改作品</a>
</c:if></span><br />
</p>
</div>

<div>
	<h1>教师点评</h1><hr/>
	<c:choose>
		<c:when test="${opus.comments == null}">
			暂无点评
		</c:when>
		<c:otherwise>
			<c:forEach items="${opus.comments}" var="comment">
				${comment.teacher.realName } : ${comment.remark } ${comment.time }<br/>
				教师点评打分：${comment.score }<hr/>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</div>

</div>
<!--内容区 结束 -->
<jsp:include page="/bottom.jsp"></jsp:include>