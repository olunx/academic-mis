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
		<div class="breadcrumb"> <a href="<%=path%>/index">首页</a> &raquo; <a href="#">修改活动结果</a> </div>
	    <!--评论列表 开始-->
    <div id="comments">
       <!--发表评论 开始-->
      <div id="respond">
      	<h2 class="mainhead">查看活动成绩和修改</h2>
        <form action="<%=path %>/activityresult/modifyActivityResult" method="post" >
        	<input type="hidden" name="id" value="${activityResult.id}"/><br/>
			<p>
				<input type="text" title="获奖等级" name="arDto.prize" value="${activityResult.prize }" class="text" />
			</p>
			<p>
				<input type="text" title="获奖名称" name="arDto.name" value="${activityResult.name }" class="text" />
			</p>
			<p>
				<input type="text" title="可得学分" name="arDto.credit" value="${activityResult.credit }" class="text" />
			</p>
			<p>
				<textarea name="arDto.remark" title="获奖说明" id="comment" cols="100%" rows="10" >${activityResult.remark }</textarea>
			</p>
			<div class="clear"></div>
			<p>
				<input name="submit" type="submit" class="submit" tabindex="5" value="修改" />
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