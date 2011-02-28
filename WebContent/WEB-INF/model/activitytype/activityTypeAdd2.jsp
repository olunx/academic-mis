<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
%>
<jsp:include page="/top.jsp"></jsp:include>
<!-- JQuery库 -->
<script type="text/javascript" src="<%=path %>/content/js/calendar/WdatePicker.js"></script> 
	<!--内容区 开始 -->
	<div id="content" class="subcontainer fleft">
		<div class="breadcrumb"> <a href="<%=path%>/index">首页</a> &raquo; <a href="#">添加活动类型</a> </div>
	    <!--评论列表 开始-->
    <div id="comments">
       <!--发表评论 开始-->
      <div id="respond">
        <form action="<%=path %>/activitytype/addActivityType" method="post" >
        	<input type="hidden" name="id" value="${id}"/><br />
			<p>
				<input type="text" title="活动名称" name="atDto.name" class="text" />
			</p>
			<p>
				<label>活动级别：</label>
				<select class="reg" name="atDto.level">
					<option value="1" selected="selected">院级</option>
					<option value="2">校级</option>
					<option value="3">省级</option>
					<option value="4">国家级</option>
					<option value="5">国际级</option>
				</select>
			</p>
			<p>
				<textarea name="atDto.intro" title="活动简介" id="comment" cols="100%" rows="10" ></textarea>
			</p>
			<div class="clear"></div>
			<p>
				<input name="submit" type="submit" class="submit" tabindex="5" value="添加" />
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