<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
	<!--侧边栏 开始 -->
	<div id="sidebar" class="sidecontainer fright">
		<div class="widgets">
			<h2 class="mainhead">登录</h2>
			<ul>
				<li><a href="<%=path %>/goLogin">登录</a></li>
			</ul>
			<br class="clear">
			
			<h2 class="mainhead">注册</h2>
			<ul>
				<li><a href="<%=path %>/student/goAddStudent">注册学生</a></li>
		        <li><a href="<%=path %>/teacher/goAddTeacher">注册教师</a></li>
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