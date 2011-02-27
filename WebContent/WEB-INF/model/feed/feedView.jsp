<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" uri="http://gdpu.cn/functions"%>
<%
	String path = request.getContextPath();
%>
<jsp:include page="/top.jsp"></jsp:include>
	<!--内容区 开始 -->
	<div id="content" class="subcontainer fleft">
		<div class="breadcrumb"> <a href="<%=path%>/index">首页</a> &raquo; <a href="<%=path %>/myindex">个人中心</a> &raquo; <a href="#">查看消息</a> </div>
	<div class="post">
		<h2 class="mainhead">消息内容</h2>
		<h1>
			<span>${my:checkFeedType(feed)}</span>
		</h1>
		<div class="content">
			${feed.news }
			<br/><br/>
			${feed.time }
		</div>
	</div>
	</div>
	<!--内容区 结束 -->
	
<jsp:include page="/bottom.jsp"></jsp:include>
