<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
%>
<jsp:include page="/top.jsp"></jsp:include>
<!-- JQuery库 -->
<script type="text/javascript" src="<%=path %>/content/js/jquery.doubleSelect.min.js"></script>
<script type="text/JavaScript">
	 $(document).ready(function(){
		var majorselect = ${clsmap};
	    $('#first').doubleSelect('second', majorselect);      
	 });
</script>
	<!--内容区 开始 -->
	<div id="content" class="subcontainer fleft">
		<div class="breadcrumb"> <a href="<%=path%>/index">首页</a> &raquo; <a href="#">修改学生信息</a> </div>
	    <!--评论列表 开始-->
    <div id="comments">
       <!--发表评论 开始-->
      <div id="respond">
      	<h1>基本信息修改</h1><hr>
        <form action="<%=path %>/student/modifyStudent" method="post" >
        		<input type="hidden" name="stuDto.id" value="${student.id}" readonly="readonly">
			<p>
				<input type="text" title="用户账号" name="stuDto.username" class="text" value="${student.username }" readonly="readonly"/>
			</p>
			<p>
				<input type="text" title="学号" name="stuDto.stuNo" class="text" value="${student.stuNo }"/>
			</p>
			<p>
				<input type="text" title="真实姓名" name="stuDto.realName" class="text" value="${student.realName }"/>
			</p>
			<p>
				<input type="text" title="年龄" name="stuDto.age" class="text" value="${student.age }"/>
			</p>
			<p>
				<select id="first" class="reg"><option value="">--</option></select>
				<select id="second" name="stuDto.classes" class="reg"><option value="">--</option></select>
				<select name="stuDto.schoolYear" class="reg">
					<option value="2007" <c:if test="${student.schoolYear == 2007}">selected="selected"</c:if> >2007级</option>
					<option value="2008" <c:if test="${student.schoolYear == 2008}">selected="selected"</c:if> >2008级</option>
					<option value="2009" <c:if test="${student.schoolYear == 2009}">selected="selected"</c:if> >2009级</option>
					<option value="2010" <c:if test="${student.schoolYear == 2010}">selected="selected"</c:if> >2010级</option>
					<option value="2011" <c:if test="${student.schoolYear == 2011}">selected="selected"</c:if> >2011级</option>
				</select>
				<select class="reg" name="stuDto.sex"><option value="1" <c:if test="${student.sex == 1}">selected="selected"</c:if> >男生</option><option value="0" <c:if test="${student.sex != 1}">selected="selected"</c:if> >女生</option></select>
			</p>

			<div class="clear"></div>
			<p>
				<input name="submit" type="submit" class="submit" tabindex="5" value="提交修改" />
			</p>
        <div class="clear"></div>
        </form>
        <h1>修改密码</h1><hr>
        <form action="<%=path %>/student/modifyPswStudent" method="post" >
        		<input type="hidden" name="stuDto.id" value="${student.id}" readonly="readonly">
			<p>
				<input type="text" title="用户账号" name="stuDto.username" class="text" value="${student.username }" readonly="readonly"/>
			</p>
			<p>
				<input type="text" title="旧的密码" name="stuDto.opassword" class="text" />
			</p>
			<p>
				<input type="text" title="新的密码" name="stuDto.password" class="text" />
			</p>
			<p>
				<input type="text" title="确认密码" name="stuDto.rpassword" class="text" />
			</p>

			<div class="clear"></div>
			<p>
				<input name="submit" type="submit" class="submit" tabindex="5" value="修改密码" />
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
