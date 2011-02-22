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
		<div class="breadcrumb"> <a href="<%=path%>/index">首页</a> &raquo; <a href="#">查看学生信息</a> </div>
	    <!--评论列表 开始-->
    <div id="comments">
       <!--发表评论 开始-->
      <div id="respond">
      		<h1>学生基本信息 </h1><hr/>
      		学生账号:${student.username } <c:if test="${user.id == student.id}"><a href="<%=path %>/student/goModifyStudent"><font color="red">[修改用户信息]</font></a></c:if><br/>
      		学生学号:${student.stuNo }<br/>
      		学生姓名:${student.realName }<br/>
      		性别:${student.sex == 1 ? '男' : '女'}<br/>
      		年龄:${student.age }<br/>
      		班级:${student.classes.institute.name }-${student.classes.name }-${student.schoolYear }届<br/>
      		<h1>学生详细介绍 </h1><hr/>
      		${student.remark != null ? student.remark : '这家伙很懒，什么都没留下！'}
      		

			<div class="clear"></div>
        <div class="clear"></div>
      </div>
       <!--发表评论 结束-->
    </div>
    <!--评论列表 结束-->
	</div>
	<!--内容区 结束 -->
<jsp:include page="/bottom.jsp"></jsp:include>
