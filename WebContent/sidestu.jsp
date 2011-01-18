<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
	<!--侧边栏 开始 -->
	<div id="sidebar" class="sidecontainer fright">
		<div class="widgets">
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
			
			<!--<h2 class="mainhead">搜索</h2>-->
			<form method="get" id="ksearchform" action="#">
				<div>
					<input type="text" size="18" value="" name="s" id="s">
					<input type="submit" id="ksearchsubmit" value="Search" class="btn">
				</div>
				<br class="clear">
			</form>
		</div>
	</div>
	<!--侧边栏 结束 -->