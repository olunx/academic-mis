<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<jsp:include page="/top.jsp"></jsp:include>
	<!--内容区 开始 -->
	<div id="content" class="subcontainer fleft">
		<div class="breadcrumb"> <a href="<%=path%>/index">首页</a> &raquo; <a href="#">教师用户注册</a> </div>
	    <!--评论列表 开始-->
    <div id="comments">
       <!--发表评论 开始-->
      <div id="respond">
        <div class="cancel-comment-reply"> </div>
	<form action="<%=path %>/teacher/addTeacher" method="post">
			<p>
				<input type="text" title="用户账号" name="teaDto.username" class="text"/>
			</p>
			<p>
				<input type="text" title="用户密码" name="teaDto.password" class="text" />
			</p>
			<p>
				<input type="text" title="确认密码" name="teaDto.rpassword" class="text"/>
			</p>
			<p>
				<input type="text" title="教师号" name="teaDto.tnum" class="text"/>
			</p>
			<p>
				<input type="text" title="真实姓名" name="teaDto.realName" class="text"/>
			</p>
			<p>
				<input type="text" title="年龄" name="teaDto.age" class="text" />
			</p>
			<p>
				<select name="teaDto.institute" class="reg" >
				<c:forEach items="${institutes}" var="institute" >
					<option value="${institute.id}">${institute.name}</option>
				</c:forEach>
				</select>
				<select class="reg" name="teaDto.sex"><option value="1" >男教师</option><option value="0">女教师</option></select>
			</p>
			<div class="clear"></div>
			<p>
				<input name="submit" type="submit" class="submit" value="注册" />
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
