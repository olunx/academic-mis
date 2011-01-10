<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
	<!--侧边栏 开始 -->
	<div id="sidebar" class="sidecontainer fright">
		<div class="widgets">
			<h2 class="mainhead">功能</h2>
			<ul>
				<li><a href="#">发布课题</a></li>
		        <li><a href="#">查看课题</a></li>
		        <li><a href="#">查看作品</a></li>
		        <li><a href="#">我点评的作品</a></li>
		        <li><a href="<%=path %>/group/listAllGroup">查看学习小组</a></li>
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