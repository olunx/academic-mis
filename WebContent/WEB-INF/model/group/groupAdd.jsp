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
		<div class="breadcrumb"> <a href="<%=path%>/index">首页</a> &raquo; <a href="<%=path %>/group/goAddGroup">创建小组</a> </div>
	    <!--评论列表 开始-->
    <div id="comments">
       <!--发表评论 开始-->
      <div id="respond">
        <h2 class="mainhead">添加小组</h2>
        <form action="<%=path %>/group/addGroup" method="post" id="commentform">
			<p>
				<input type="text" title="小组名称" name="group.name" id="input" value="" size="22" tabindex="1" aria-required='true' />
			</p>
			<p>
				<textarea name="group.intro" title="小组简介..." id="comment" cols="100%" rows="10" tabindex="4"></textarea>
			</p>
			<div class="clear"></div>
			<p>
				<input name="submit" type="submit" id="submit2" tabindex="5" value="创建" />
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