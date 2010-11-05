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
	小组介绍: ${group.intro }<br/>
	 <c:choose>
	 	<c:when test="${my:isMyGroup(group,student)}"><a href="<%=path%>/group/quitGroup?id=${group.id}">退出</a></c:when>
	 	<c:otherwise><a href="<%=path%>/group/applyGroup?id=${group.id}">申请加入</a></c:otherwise>
	 </c:choose>
</body>
</html>