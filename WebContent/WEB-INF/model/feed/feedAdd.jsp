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
		<div class="breadcrumb"> <a href="<%=path%>/index">首页</a> &raquo; <a href="<%=path %>/myindex">个人中心</a> &raquo; <a href="#">发布系统消息</a> </div>
	    <!--评论列表 开始-->
    <div id="comments">
       <!--发表评论 开始-->
      <div id="respond">
        <h2 class="mainhead">发布系统消息</h2>
        <form action="<%=path %>/feed/addFeed" method="post" id="commentform">
			<p>
				<textarea name="feDto.news" title="消息内容..." id="comment" cols="100%" rows="10"></textarea>
			</p>
			<p>
				<select name="feDto.type" class="reg">
					<option value="1">系统消息</option>
					<option value="2">管理员消息</option>
					<option value="3">紧急通知</option>
				</select>
			</p>
			<p>
				<textarea name="feDto.recipients" title="接收人员(输入接收人的username，用“,”号隔开)" id="comment" cols="100%" rows="5"></textarea>
			</p>
			<div class="clear"></div>
			<p>
				<input name="submit" type="submit" class="submit2" value="发布消息" />
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