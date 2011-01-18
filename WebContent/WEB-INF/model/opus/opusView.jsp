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
<div class="entry">所属比赛: ${opus.activityApply.activity.name}<br />
作品介绍: ${opus.intro }<br />
<c:choose>
	<c:when test="${opus.instructor != null}">
			指导老师:<a href="<%=path%>/teacher/viewTeacher?id=${opus.instructor.id}">${opus.instructor.realName}</a>
	</c:when>
	<c:otherwise>
		<br /><font color="red">你的作品还没有指导老师。</font>
	</c:otherwise>
</c:choose></div>
<p class="postinfo clear"><span class="category"><c:if
	test="${my:isMyOpus(activityApply,student)}">
	<a href="<%=path%>/opus/goModifyOpus?id=${opus.id}">修改作品</a>
</c:if></span><br />
</p>
</div>

</div>
<!--内容区 结束 -->
<jsp:include page="/sidestu.jsp"></jsp:include>
<jsp:include page="/bottom.jsp"></jsp:include>