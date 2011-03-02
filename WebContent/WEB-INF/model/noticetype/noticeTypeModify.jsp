<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
%>
<jsp:include page="/top.jsp"></jsp:include>

	<!--内容区 开始 -->
	<div id="content" class="subcontainer fleft">
		<div class="breadcrumb"> <a href="<%=path%>/index">首页</a> &raquo; <a href="#">修改通知类型</a> </div>
	<!--评论列表 开始-->
    <div id="comments">
       <!--发表评论 开始-->
      <div id="respond">
        <h2 class="mainhead">修改通知类型</h2>
        <div class="cancel-comment-reply"> <a rel="nofollow" id="cancel-comment-reply-link" href="/wordpress/?p=552#respond" style="display:none;">Cancel</a> </div>
        <form action="<%=path %>/noticetype/modifyNoticeType" method="post">
        	<input type="hidden" name="id" value="${noticeType.id} "/>
			<p>
				<input type="text" class="text"  title="类型名称" name="ntDto.name" value="${noticeType.name}" />
			</p>
			<div class="clear"></div>
			<p>
				<input name="submit" type="submit" class="submit2" value="修改" />
			</p>
        <div class="clear"></div>
        </form>
      </div>
       <!--发表评论 结束-->
    </div>
    <!--评论列表 结束-->
	</div>
	<!--内容区 结束 -->
	
<jsp:include page="/bottom.jsp"></jsp:include>