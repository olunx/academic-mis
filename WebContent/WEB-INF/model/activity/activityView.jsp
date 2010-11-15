<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" uri="http://gdpu.cn/functions"%>
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
	活动简介: ${activity.intro }<br/><br/>
	 <c:choose>
	 	<c:when test="${manager != null}">
	 		<c:choose>
			 	<c:when test="${my:activityApplyCount(activity) != 0}">
			 		<font color="red">有${my:activityApplyCount(activity)}个学生申请加入该小组</font><br/>
			 		<table class="table">
						<tr>
							<th>学生名称</th>
							<th>学生专业</th>
							<th>性别</th>
							<th>审核</th>
						</tr>
						<c:forEach items="${activity.activityApplys}" var="activityApply" >
							<c:if test="${activityApply.status == 1}">
								<tr>
									<td>${activityApply.student.realName}</td>
									<td>${activityApply.student.classes.name}${activityApply.student.schoolYear}</td>
									<td>${activityApply.student.age == 0 ? '女' : '男'}</td>
									<td><a href="<%=path %>/activity/passGroup?id=${activityApply.id}">通过</a>|<a href="<%=path %>/activity/refuseGroup?id=${activityApply.id}">拒绝</a></td>
								</tr>
							</c:if>
						</c:forEach>
					</table>
			
				</c:when>
			 	<c:otherwise>暂时没有学生申请加入该小组</c:otherwise>
			 </c:choose>
			 <br/>
	 	</c:when>
	 	<c:when test="${my:isMyGroup(activity,student)}"><a href="<%=path%>/activity/quitGroup?id=${activity.id}">退出</a></c:when>
	 	<c:when test="${my:isMyApplyGroup(activity,student)}"><a href="<%=path %>/activity/listApplyGroup"><font color="Blue">你已经申请加入该小组了,请等待审核</font></a></c:when>
	 	<c:otherwise><a href="<%=path%>/activity/applyGroup?id=${activity.id}">申请加入</a></c:otherwise>
	 </c:choose>
	 <br/>
	 
</body>
</html>