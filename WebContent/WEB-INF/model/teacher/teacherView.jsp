<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
%>
<jsp:include page="/top.jsp"></jsp:include>
	<!--内容区 开始 -->
	<div id="content" class="subcontainer fleft">
		<div class="breadcrumb"> <a href="<%=path%>/index">首页</a> &raquo; <a href="#">查看教师信息</a> </div>
	    <!--评论列表 开始-->
    <div id="comments">
       <!--发表评论 开始-->
      <div id="respond">
      		<h1>教师基本信息 </h1><hr/>
      		教师账号:${teacher.username } <c:if test="${user.id == teacher.id}"><a href="<%=path %>/teacher/goModifyTeacher"><font color="red">[修改用户信息]</font></a></c:if><br/>
      		教师工号:${teacher.tnum }<br/>
      		学生姓名:${teacher.realName }<br/>
      		性别:${teacher.sex == 1 ? '男' : '女'}<br/>
      		年龄:${teacher.age }<br/>
      		学院:${teacher.institute.name }-${teacher.title == 1 ? '教授' : teacher.title == 2 ? '副教授' : teacher.title == 3 ? '讲师' : '助教'}<br/>
      		<br/>
      		<h1>教师详细介绍 </h1><hr/>
      		${teacher.remark != null ? teacher.remark : '这家伙很懒，什么都没留下！'}

			<div class="clear"></div>
        <div class="clear"></div>
      </div>
       <!--发表评论 结束-->
    </div>
    <!--评论列表 结束-->
	</div>
	<!--内容区 结束 -->
<jsp:include page="/bottom.jsp"></jsp:include>
