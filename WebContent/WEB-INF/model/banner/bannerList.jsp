<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
%>
<jsp:include page="/top.jsp"></jsp:include>

	<!--内容区 开始 -->
	<div id="content" class="subcontainer fleft">
		<div class="breadcrumb"> <a href="<%=path%>/index">首页</a> &raquo; <a href="<%=path %>/myindex">个人中心</a> &raquo; <a href="#">管理横幅主题</a> </div>
	    <!--评论列表 开始-->
	    <div id="comments">
	       <!--发表评论 开始-->
	      <div id="respond">
	        <h2 class="mainhead">管理横幅主题</h2>
	        <div class="cancel-comment-reply"> <a rel="nofollow" id="cancel-comment-reply-link" href="/wordpress/?p=552#respond" style="display:none;">Cancel</a> </div>
				<c:choose>
					<c:when test="${pageBean.list == null}">
									没有数据！
					</c:when>
					<c:otherwise>
						<ul id="excerpt">
						<c:forEach items="${pageBean.list}" var="banner">
					        <li>
							<div class="p_coleft fleft">
								<p class="date_s">横幅主题：${banner.name }</p>
								<span class="comment_s">简介:${fn:substring(fn:replace(banner.intro,"<","&lt;"),0,20)}</span>
							</div>
							<div class="p_coright fright">
								<img alt="${banner.name }" src="<%=path %>${banner.image.bigFileUrl }" width="400px"><br/>
								<c:choose>
									<c:when test="${banner.selected == 1}"><font color="green">当前横幅主题</font>[<a href="<%=path %>/banner/unselectBanner?id=${banner.id}"><font color="blue">取消</font></a>]</c:when>
									<c:otherwise><a href="<%=path %>/banner/selectBanner?id=${banner.id}"><font color="blue">设为横幅主题</font></a></c:otherwise>
								</c:choose>
								<a href="<%=path %>/banner/deleteBanner?id=${banner.id}"><font color="red">删除</font></a>
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
									<a class="page">首页</a>
									<a class="page">上一页</a>
								</c:when>
								<c:otherwise>
									<a class="page" href="<%=path%>/banner/listBanner?page=1">首页</a>
									<a class="page" href="<%=path%>/banner/listBanner?page=${pageBean.currentPage-1}">上一页</a>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${pageBean.currentPage != pageBean.totalPage}">
									<a class="page" href="<%=path%>/banner/listBanner?page=${pageBean.currentPage+1}">下一页</a>
									<a class="last" href="<%=path%>/banner/listBanner?page=${pageBean.totalPage}">尾页</a>
								</c:when>
								<c:otherwise>
									<a class="page">下一页</a>
									<a class="last">尾页</a>
								</c:otherwise>
							</c:choose>
						</div>
						</c:otherwise>
				</c:choose>
			</div>
	       <!--发表评论 结束-->
	    </div>
    <!--评论列表 结束-->
	</div>
	<!--内容区 结束 -->

<jsp:include page="/bottom.jsp"></jsp:include>
