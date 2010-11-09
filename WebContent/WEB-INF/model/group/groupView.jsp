<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" uri="http://gdpu.cn/functions"%>
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
	小组介绍: ${group.intro }<br/><br/>
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
						<c:forEach items="${group.groupApplys}" var="groupApply">
							<tr>
								<td>${groupApply.student.realName}</td>
								<td>${groupApply.student.classes.name}${groupApply.student.schoolYear}</td>
								<td>${groupApply.student.age == 0 ? '女' : '男'}</td>
								<td><a href="<%=path %>/group/passGroup?id=${groupApply}">通过</a>|<a href="<%=path %>/group/refuseGroup?id=${groupApply}">拒绝</a></td>
							</tr>
						</c:forEach>
					</table>
			
				</c:when>
			 	<c:otherwise>暂时没有学生申请加入该小组</c:otherwise>
			 </c:choose>
			 <br/>
	 	</c:when>
	 	<c:when test="${my:isMyGroup(group,student)}"><a href="<%=path%>/group/quitGroup?id=${group.id}">退出</a></c:when>
	 	<c:otherwise><a href="<%=path%>/group/applyGroup?id=${group.id}">申请加入</a></c:otherwise>
	 </c:choose>
	 <br/>
	 
</body>
</html>