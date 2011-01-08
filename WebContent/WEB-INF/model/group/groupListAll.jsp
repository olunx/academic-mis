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
		<div class="breadcrumb"> <a href="#">首页</a> &raquo; <a href="#">我参加的小组</a> </div>
	<div class="post">
		<h2 class="mainhead">我参加的小组</h2>
		<c:choose>
		<c:when test="${pageBean.list == null}">
						没有数据！
		</c:when>
		<c:otherwise>
			<ul id="excerpt">
			<c:forEach items="${pageBean.list}" var="group">
		        <li>
				<div class="p_coleft fleft">
					<p class="date_s">队长：${group.captain.realName}</p>
					<span class="comment_s"><a href="#">共${fn:length(group.members)}名成员 </a></span>
				</div>
				<div class="p_coright fright">
					<h1 class="prevtitle">组名： <a href="<%=path%>/group/viewGroup?id=${group.id }">${group.name}</a></h1>	小组简介:${group.intro}
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
						<a class="page" href="#">首页</a>
						<a class="page" href="#">上一页</a>
					</c:when>
					<c:otherwise>
						<a class="page" href="<%=path%>/group/listAllGroup?page=1">首页</a>
						<a class="page" href="<%=path%>/group/listAllGroup?page=${pageBean.currentPage-1}">上一页</a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${pageBean.currentPage != pageBean.totalPage}">
						<a class="page" href="<%=path%>/group/listAllGroup?page=${pageBean.currentPage+1}">下一页</a>
						<a class="last" href="<%=path%>/group/listAllGroup?page=${pageBean.totalPage}">尾页</a>
					</c:when>
					<c:otherwise>
						<a class="page" href="#">下一页</a>
						<a class="last" href="#">尾页</a>
					</c:otherwise>
				</c:choose>
			</div>
			</c:otherwise>
	</c:choose>
	</div>
	</div>
	<!--内容区 结束 -->
	
	<!--侧边栏 开始 -->
	<div id="sidebar" class="sidecontainer fright">
		<div class="widgets">
			<h2 class="mainhead">RSS Feed</h2>
			<p class="feed"><a href="http://localhost/wordpress/?feed=rss2">Subscribe
			to feed <br>
			<span>get the latest updates!</span></a></p>
			<form method="get" id="ksearchform"
				action="../olunx — 又一个 WordPress 站点_files/olunx — 又一个 WordPress 站点.htm">
			<div><input type="text" size="18" value="" name="s" id="s">
			<input type="submit" id="ksearchsubmit" value="Search" class="btn">
			</div>
			<br class="clear">
			</form>
		</div>
		<ul>
		</ul>
	</div>
	<!--侧边栏 结束 -->
	
<jsp:include page="/bottom.jsp"></jsp:include>