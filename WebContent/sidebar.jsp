<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
%>
	<!--侧边栏 开始 -->
	<div id="sidebar" class="sidecontainer fright">
		<div class="widgets">
		
			<c:if test="${student != null}">
				<h2 class="mainhead">参赛小组</h2>
				<ul>
					<li><a href="<%=path %>/group/goAddGroup">创建小组</a></li>
			        <li><a href="<%=path %>/group/listAllGroup">所有小组</a></li>
			        <li><a href="<%=path %>/group/listGroup">我参加的</a></li>
			        <li><a href="<%=path %>/group/listMeGroup">我创建的</a></li>
			        <li><a href="<%=path %>/group/listApplyGroup">我申请的</a></li>
				</ul>
				<br class="clear">
				
				<h2 class="mainhead">学术活动</h2>
				<ul>
			        <li><a href="<%=path %>/activity/listApplyActivity">我申请的活动</a></li>
			        <li><a href="<%=path %>/activity/listActivity">所有学术活动</a></li>
				</ul>
				<br class="clear">
			</c:if>
			
			<c:if test="${teacher != null}">
				<h2 class="mainhead">功能</h2>
				<ul>
					<li><a href="<%=path %>/subject/goAddSubject">发布课题招募</a></li>
			        <li><a href="<%=path %>/subject/listMeSubject">查看我的课题招募</a></li>
			        <li><a href="<%=path %>/subject/listSubject">查看全部课题招募</a></li>
			        <li><a href="<%=path %>/opus/listOpus">查看学生作品</a></li>
			        <li><a href="#">我点评的作品</a></li>
			        <li><a href="<%=path %>/group/listAllGroup">查看学习小组</a></li>
				</ul>
				<br class="clear">
			</c:if>
			
			<c:if test="${manager != null}">
				<h2 class="mainhead">功能</h2>
				<ul>
					<li><a href="<%=path %>/activity/goAddActivity">添加学术活动</a></li>
			        <li><a href="<%=path %>/activity/listActivity">列出学术活动</a></li>
			        <li><a href="<%=path %>/noticetype/goAddNoticeType">添加通知类型</a></li>
			        <li><a href="<%=path %>/noticetype/listNoticeType">列出通知类型</a></li>
			        <li><a href="<%=path %>/notice/goAddNotice">添加通知</a></li>
			        <li><a href="<%=path %>/notice/listNotice">列出通知</a></li>
			        <li><a href="<%=path %>/noticehot/listNoticeHot">热门通知管理</a></li>
				</ul>
				<br class="clear">
			</c:if>
			
			<h2 class="mainhead">注册</h2>
			<ul>
				<li><a href="<%=path %>/student/goAddStudent">学生注册</a></li>
		        <li><a href="<%=path %>/teacher/goAddTeacher">老师注册</a></li>
			</ul>
			<br class="clear">
			
			<!--<h2 class="mainhead">搜索</h2>-->
			<form method="get" id="ksearchform" action="#">
				<div>
					<input type="text" title="输入关键词" size="22" value="" name="s" id="s">
					<input type="submit" id="ksearchsubmit" value="搜索" class="btn">
				</div>
				<br class="clear">
			</form>
		</div>
	</div>
	<!--侧边栏 结束 -->