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
<title>管理小组页面</title>
</head>
<body>
	小组显示页面<br/>
	小组名称：${group.name }<br/>
	小组介绍: ${group.intro }<br/>
	小组组长： ${group.captain.realName }<br/>
	小组成员: <c:forEach items="${group.members}" var="member" varStatus="status">
				<a href="<%=path %>/student/viewStudent?id=${member.id}">${member.realName}</a>
				<c:if test="${!status.last}">-</c:if>
			</c:forEach>
	<br/><br/>
	 <c:choose>
	 	<c:when test="${group.captain.id == student.id}">
	 		<c:choose>
			 	<c:when test="${my:groupApplyCount(group) != 0}">
			 		<font color="red">有${my:groupApplyCount(group)}个学生申请加入该小组</font><br/>
			 		<table class="table">
						<tr>
							<th>学生名称</th>
							<th>学生专业</th>
							<th>性别</th>
							<th>审核</th>
						</tr>
						<c:forEach items="${group.groupApplys}" var="groupApply" >
							<c:if test="${groupApply.status == 1}">
								<tr>
									<td>${groupApply.student.realName}</td>
									<td>${groupApply.student.classes.name}${groupApply.student.schoolYear}</td>
									<td>${groupApply.student.age == 0 ? '女' : '男'}</td>
									<td><a href="<%=path %>/group/passGroup?id=${groupApply.id}">通过</a>|<a href="<%=path %>/group/refuseGroup?id=${groupApply.id}">拒绝</a></td>
								</tr>
							</c:if>
						</c:forEach>
					</table>
			
				</c:when>
			 	<c:otherwise>暂时没有学生申请加入该小组</c:otherwise>
			 </c:choose>
			 <br/>
	 	</c:when>
	 	<c:when test="${my:isMyGroup(group,student)}"><a href="<%=path%>/group/quitGroup?id=${group.id}">退出</a></c:when>
	 	<c:when test="${my:isMyApplyGroup(group,student)}"><a href="<%=path %>/group/listApplyGroup"><font color="Blue">你已经申请加入该小组了,请等待审核</font></a></c:when>
	 	<c:when test="${manager != null}">
	 		小组参加学术活动情况<br/>
	 		<c:choose>
	 			<c:when test="${group.teamApplys != null && fn:length(group.teamApplys) != 0}">
	 				<table class="table">
						<tr>
							<th>活动名称</th>
							<th>活动结果</th>
						</tr>
					<c:forEach items="${group.teamApplys}" var="ta">
						<tr>
							<td><a href="<%=path %>/activity/viewActivity?id=${ta.activity.id}">${ta.activity.name }</a></td>
							<td>${ta.activityResult != null ? ta.activityResult.remark : ta.status == 3 ? '该学生未能通过申请' : '参加了该活动'}</td>
						</tr>
					</c:forEach>
					</table>
	 			</c:when>
	 			<c:otherwise>
	 				该小组没有参加过学术活动
	 			</c:otherwise>
	 		</c:choose>
	 		
	 	</c:when>
	 	<c:otherwise><a href="<%=path%>/group/applyGroup?id=${group.id}">申请加入</a></c:otherwise>
	 </c:choose>
	 <br/>
	 
</body>
</html>