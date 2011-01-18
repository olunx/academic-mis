<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/top.jsp"></jsp:include>

	<!--内容区 开始 -->
	<div id="content" class="subcontainer fleft">
	<br />欢迎您${student.username}<br />
	</div>
	<!--内容区 结束 -->
	  
<jsp:include page="/sidestu.jsp"></jsp:include>
<jsp:include page="/bottom.jsp"></jsp:include>