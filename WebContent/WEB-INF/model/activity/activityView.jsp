<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" uri="http://gdpu.cn/functions"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学术活动页面</title>
</head>
<body>
	学术活动显示页面<br/>
	活动名称：${activity.name }<br/>
	活动届次：${activity.session }<br/>
	活动类型：${activity.activityType.name}<br/>
	报名方式：${activity.applyCount == 1 ? '个人报名参赛' : '团队报名参赛'}<br/>
	活动简介: ${activity.intro }<br/><br/>
	 <c:choose>
	 	<c:when test="${manager != null }">
	 		<c:choose>
	 			<c:when test="${my:activityApplyCount(activity) != 0 && activity.applyCount == 1}">
			 		<font color="red">有${my:activityApplyCount(activity)}个人申请报名该活动</font><br/>
			 		<table class="table">
						<tr>
							<th>申请人</th>
							<th>审核</th>
						</tr>
						<c:forEach items="${activity.activityApplys}" var="activityApply" >
							<c:if test="${activityApply.status == 1}">
								<tr>
									<td><a href="<%=path %>/student/viewStudent?id=${activityApply.student.id}">${activityApply.student.realName}</a></td>
									<td><a href="<%=path %>/activity/passApplyActivity?id=${activityApply.id}">通过</a>|<a href="<%=path %>/activity/refuseApplyActivity?id=${activityApply.id}">拒绝</a></td>
								</tr>
							</c:if>
						</c:forEach>
					</table>
			
				</c:when>
			 	<c:when test="${my:activityApplyCount(activity) != 0 && activity.applyCount != 1}">
			 		<font color="red">有${my:activityApplyCount(activity)}个小组申请报名该活动</font><br/>
			 		<table class="table">
						<tr>
							<th>小组名称</th>
							<th>报名人数</th>
							<th>报名成员</th>
							<th>审核</th>
						</tr>
						<c:forEach items="${activity.activityApplys}" var="activityApply" >
							<c:if test="${activityApply.status == 1}">
								<tr>
									<td><a href="<%=path %>/group/viewGroup?id=${activityApply.group.id}">${activityApply.group.name}</a></td>
									<td>${fn:length(activityApply.applicants)}</td>
									<td>
										<c:forEach items="${activityApply.applicants}" var="student" >
											<a href="<%=path %>/student/viewStudent?id=${student.id}">${student.realName}</a>|
										</c:forEach>
									</td>
									<td><a href="<%=path %>/activity/passApplyActivity?id=${activityApply.id}">通过</a>|<a href="<%=path %>/activity/refuseApplyActivity?id=${activityApply.id}">拒绝</a></td>
								</tr>
							</c:if>
						</c:forEach>
					</table>
			
				</c:when>
			 	<c:otherwise>该活动暂时没有报名</c:otherwise>
			 </c:choose>
			 <br/>
	 	</c:when>
	 	<c:when test="${student != null}">
	 		<c:choose>
	 			<c:when test="${activity.applyCount == 1 && my:isMyActivity(activity,student) == 1}">
			 		你已经完成该活动的报名了，<a href="<%=path%>/activity/quitActivity?id=${activity.id}">退出</a>
			 	</c:when>
			 	<c:when test="${activity.applyCount == 1 && my:isSingleApplyDone(activity,student)}"><a href="<%=path %>/activity/listApplyActivity"><font color="Blue">你已经申请该活动的报名了,请等待审核</font></a></c:when>
		 		<c:when test="${activity.applyCount != 1 && my:isMyActivity(activity,student) == 2}">你创建的小组已经完成该活动的报名了，<a href="<%=path%>/activity/quitActivity?id=${activity.id}">退出</a></c:when>
			 	<c:when test="${activity.applyCount != 1 && my:isMyActivity(activity,student) == 3}">你所在的小组已经完成该活动的报名了</c:when>
			 	<c:when test="${activity.applyCount != 1 && my:isTeamApplyDone(activity,student) != null}"><a href="<%=path %>/activity/listApplyActivity"><font color="Blue">你所在的小组${my:isTeamApplyDone(activity,student).name}已经申请该活动的报名了,请等待审核</font></a></c:when>
			 	<c:when test="${my:isActivityApplyTime(activity)}">该活动的报名时间为[${activity.airtime} - ${activity.deadtime}],现在不是报名时间！或者报名已经结束了</c:when>
			 	<c:otherwise>
			 		<a href="<%=path%>/activity/goApplyActivity?id=${activity.id}">申请加入</a>
			 	</c:otherwise>
		 	</c:choose>
	 	</c:when>
	 	
	 </c:choose>
	 <br/>
	 
</body>
</html>