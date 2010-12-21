<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<html>
<head>
<title>管理中心</title>
<meta http-equiv=Content-Type content=text/html;charset=UTF-8>
</head>
<frameset rows="64,*"  frameborder="NO" border="0" framespacing="0">
	<frame src="admin_top.jsp" noresize="noresize" frameborder="0" name="topFrame" scrolling="no" marginwidth="0" marginheight="0">
  <frameset cols="200,*"  rows="560,*" id="frame">
	<frame src="left.jsp" name="leftFrame" noresize="noresize" marginwidth="0" marginheight="0" frameborder="0" scrolling="no" />
	<frame src="right.jsp" name="main" noresize="noresize" marginwidth="0" marginheight="0" frameborder="0" scrolling="auto"/>
  </frameset>
</frameset>
<noframes>
  <body></body>
    </noframes>
</html>
