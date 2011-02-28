<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" uri="http://gdpu.cn/functions"%>
<%
	String path = request.getContextPath();
%>
<jsp:include page="/top.jsp"></jsp:include>

	<!--内容区 开始 -->
	<div id="content" class="subcontainer fleft">
		<div class="breadcrumb"> <a href="<%=path%>/index">首页</a> &raquo; <a href="<%=path %>/myindex">个人中心</a> </div>
		<div class="post">
			<hr class="title" />
			<h2>欢迎您${user.username} ,进入学生管理中心</h2><br/>
			<h2>系统通知<a href="<%=path %>/subject/listSubject">[更多]</a></h2><hr class="title" />
			<ul class="notice">	
			<c:forEach items="${notices}" var="notice">
		  		<li><a href="<%=path %>/notice/viewNotice?id=${notice.id }">[${notice.type.name}]${notice.title }</a></li>
		  	</c:forEach>
		  	</ul>
		  	<br/>
			<h2>系统消息<a href="<%=path %>/feed/listMeFeed">[更多]</a></h2><hr class="title" />
			<ul class="notice">	
			<c:forEach items="${feedBoxs}" var="feedBox">
		  		<div>
		  			<a href="<%=path %>/feed/viewFeed?id=${feedBox.id}">[${feedBox.hasRead == 0 ? '<font color="red">新消息</font>' : '已读'}][<font color="blue">${my:checkFeedType(feedBox.feed)}</font>]${feedBox.feed.news } </a><br/>
		  			${feedBox.feed.time }<a href="<%=path %>/feed/readFeed?id=${feedBox.id}">知道了</a> | <a href="<%=path %>/feed/deleteFeed?id=${feedBox.id}">删除</a>
		  		</div>
		  	</c:forEach>
		  	</ul>
		</div>
	</div>
	<!--内容区 结束 -->
	  
<jsp:include page="/bottom.jsp"></jsp:include>