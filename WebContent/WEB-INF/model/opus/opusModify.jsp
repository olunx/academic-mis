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
		<div class="breadcrumb"> <a href="<%=path%>/index">首页</a> &raquo; <a href="#">修改作品</a> </div>
	    <!--评论列表 开始-->
    <div id="comments">
       <!--发表评论 开始-->
      <div id="respond">
        <h2 class="mainhead">修改作品</h2>
        <div class="cancel-comment-reply"> <a rel="nofollow" id="cancel-comment-reply-link" href="/wordpress/?p=552#respond" style="display:none;">Cancel</a> </div>
        <form action="<%=path %>/opus/modifyOpus" method="post" id="commentform">
        	<input type="hidden" name="id" value="${id}"/>
			<p>
				<input type="text" title="作品名称" id="author" name="opusDto.name" value="${opus.name}" size="22" tabindex="1" />
			</p>
            <p>
				<input type="text" title="请填入指导老师号码" id="url" name="opusDto.instructor" value="${opus.instructor.tnum}" size="22" tabindex="1"/>
			</p>
			<p>
				<textarea title="作品简介..." id="comment" name="opusDto.intro" cols="100%" rows="10" tabindex="4" >${opus.intro}</textarea>
			</p>
			<div class="clear"></div>
			<p>
				<input name="submit" type="submit" id="submit2" tabindex="5" value="修改" />
			</p>
        <div class="clear"></div>
        </form>
      </div>
       <!--发表评论 结束-->
    </div>
    <!--评论列表 结束-->
	</div>
	<!--内容区 结束 -->
<jsp:include page="/sidestu.jsp"></jsp:include>
<jsp:include page="/bottom.jsp"></jsp:include>