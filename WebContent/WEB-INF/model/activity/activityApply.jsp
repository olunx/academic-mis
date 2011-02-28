<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
%>
<jsp:include page="/top.jsp"></jsp:include>
	<!-- JQuery库 -->
	<script type="text/javascript" src="<%=path%>/content/js/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" src="<%=path%>/content/js/calendar/WdatePicker.js"></script> 
	
	<link type="text/css" rel="stylesheet" href="<%=path%>/content/jq-ui/jquery-ui-1.8.custom.css" />
	<script type="text/javascript" src="<%=path%>/content/jq-ui/jquery-ui-1.8.custom.min.js"></script>
	<script type="text/javascript" src="<%=path %>/content/js/jquery.doubleSelect.min.js"></script>
	
	<script type="text/JavaScript">
		 $(document).ready(function(){
				
			var majorselect = ${applymap};
		    $('#first').doubleSelect('second', majorselect);      
		 });
	</script>
	<!--内容区 开始 -->
	<div id="content" class="subcontainer fleft">
		<div class="breadcrumb"> <a href="<%=path%>/index">首页</a> &raquo; <a href="<%=path %>/activity/viewActivity?id=${activity.id}">查看学术活动</a> &raquo; <a href="#">学术活动报名</a> </div>
	    <!--评论列表 开始-->
	    <div id="comments">
	       <!--发表评论 开始-->
	      <div id="respond">
	        <h2 class="mainhead">学术活动报名申请</h2>
	        <div class="cancel-comment-reply"> <a rel="nofollow" id="cancel-comment-reply-link" href="/wordpress/?p=552#respond" style="display:none;">Cancel</a> </div>
				<c:choose>
					<c:when test="${activity.applyCount == 1}">
						${activity.name } 该活动为参赛方式为个人参赛，你确定报名参赛？<br/>
						<a href="<%=path %>/activity/applyActivity?id=${activity.id } && applytype=1">是</a>
						-- <a href="<%=path %>/activity/listActivity">否</a>
						<br/>
					</c:when>
					<c:when test="${activity.applyCount != 1 && fn:length(student.myGroups) != 0}">
						${activity.name } 该活动的参赛方式为团队参赛，报名人数为${activity.applyCount },需要小组的创建人才能进行活动报名，请根据报名要求选择你的小组报名成员<br/>
						<form action="<%=path %>/activity/applyActivity" method="post">
							<input type="hidden" name="apDto.activity" value="${activity.id}"/>
							<div id="select">
								<label>选择小组：</label>
								<select id="first" name="apDto.group" size="1"><option value="">--</option></select><br/>
								<label>选择报名成员：</label><br/>
								<select id="second" name="apDto.applicants" multiple="multiple" ><option value="">--</option></select>
							</div>
							<input type="submit" value="报名">
						</form>
					</c:when>
					<c:otherwise>
						${activity.name } 该活动的参赛方式为团队参赛，报名人数为${activity.applyCount },需要小组的创建人才能进行活动报名，请根据报名要求选择你的小组报名成员<br/>
						你不是小组组长，不能进行活动报名，你可以<a href="<%=path %>/group/goAddGroup">创建一个小组</a>或者通知小组组长来报名!
					</c:otherwise>
				</c:choose>
			</div>
	       <!--发表评论 结束-->
	    </div>
    <!--评论列表 结束-->
	</div>
	<!--内容区 结束 -->

<jsp:include page="/bottom.jsp"></jsp:include>

