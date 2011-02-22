<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
%>
<jsp:include page="/top.jsp"></jsp:include>
	<!--内容区 开始 -->
	<div id="content" class="subcontainer fleft">
		<div class="breadcrumb"> <a href="<%=path%>/index">首页</a> &raquo; <a href="#">修改教师信息</a> </div>
	    <!--评论列表 开始-->
    <div id="comments">
       <!--发表评论 开始-->
      <div id="respond">
      	<h1>基本信息修改</h1><hr>
        <form action="<%=path %>/teacher/modifyTeacher" method="post" >
        		<input type="hidden" name="teaDto.id" value="${teacher.id}" readonly="readonly">
			<p>
				<input type="text" title="用户账号" name="teaDto.username" class="text" value="${teacher.username }" readonly="readonly"/>
			</p>
			<p>
				<input type="text" title="学号" name="teaDto.tnum" class="text" value="${teacher.tnum }"/>
			</p>
			<p>
				<input type="text" title="真实姓名" name="teaDto.realName" class="text" value="${teacher.realName }"/>
			</p>
			<p>
				<input type="text" title="年龄" name="teaDto.age" class="text" value="${teacher.age }"/>
			</p>
			<p>
				<select name="teaDto.institute" class="reg" >
				<c:forEach items="${institutes}" var="institute" >
					<option value="${institute.id}" <c:if test="${institute.id == teacher.institute.id}">selected="selected"</c:if>>${institute.name}</option>
				</c:forEach>
				</select>
				<select class="reg" name="teaDto.title">
					<option value="1" <c:if test="${teacher.title == 1}">selected="selected"</c:if> > 教授</option>
					<option value="2" <c:if test="${teacher.title == 2}">selected="selected"</c:if> >副教授</option>
					<option value="3" <c:if test="${teacher.title == 3}">selected="selected"</c:if> >讲师</option>
					<option value="4" <c:if test="${teacher.title == 4}">selected="selected"</c:if> >助教</option>
					</select>
				<select class="reg" name="teaDto.sex"><option value="1" <c:if test="${teacher.sex == 1}">selected="selected"</c:if> >男教师</option><option value="0" <c:if test="${teacher.sex != 1}">selected="selected"</c:if> >女教师</option></select>
			
			</p>

			<div class="clear"></div>
			<p>
				<input name="submit" type="submit" class="submit" tabindex="5" value="提交修改" />
			</p>
        <div class="clear"></div>
        </form>
        <h1>修改密码</h1><hr>
        <form action="<%=path %>/teacher/modifyPswTeacher" method="post" >
        		<input type="hidden" name="teaDto.id" value="${teacher.id}" readonly="readonly">
			<p>
				<input type="text" title="用户账号" name="teaDto.username" class="text" value="${teacher.username }" readonly="readonly"/>
			</p>
			<p>
				<input type="text" title="旧的密码" name="teaDto.opassword" class="text" />
			</p>
			<p>
				<input type="text" title="新的密码" name="teaDto.password" class="text" />
			</p>
			<p>
				<input type="text" title="确认密码" name="teaDto.rpassword" class="text" />
			</p>

			<div class="clear"></div>
			<p>
				<input name="submit" type="submit" class="submit" tabindex="5" value="修改密码" />
			</p>
        <div class="clear"></div>
        </form>
        <h1>教师详细介绍</h1><hr>
        <form action="<%=path %>/teacher/modifyRemarkTeacher" method="post" >
        		<input type="hidden" name="teaDto.id" value="${teacher.id}" readonly="readonly">
			<p>
				<textarea name="teaDto.remark" class="xheditor-simple" id="comment" cols="100%" rows="10" >${teacher.remark != null ? teacher.remark : '这家伙很懒，什么都没留下！'}</textarea>
			</p>

			<div class="clear"></div>
			<p>
				<input name="submit" type="submit" class="submit" tabindex="5" value="完善介绍" />
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
