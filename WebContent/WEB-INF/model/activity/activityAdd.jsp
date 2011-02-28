<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
%>
<jsp:include page="/top.jsp"></jsp:include>
<!-- JQuery库 -->
<script type="text/javascript" src="<%=path %>/content/js/calendar/WdatePicker.js"></script> 
<script type="text/javascript">
	function applyTypeChange(msg)
	{
	 	if(msg.value == 1){
	 		$("#applytype input").val(1);
	 		$("#applytype").slideUp("slow"); 
		}else{
			$("#applytype input").val(2);
			$("#applytype").slideDown("slow");
		}
	}
</script>
	<!--内容区 开始 -->
	<div id="content" class="subcontainer fleft">
		<div class="breadcrumb"> <a href="<%=path%>/index">首页</a> &raquo; <a href="#">添加学术活动</a> </div>
	    <!--评论列表 开始-->
    <div id="comments">
       <!--发表评论 开始-->
      <div id="respond">
        <form action="<%=path %>/activity/addActivity" method="post" >
			<p>
				<input type="text" title="活动名称" name="acDto.name" class="text" />
			</p>
			<p>
				<input type="text" title="活动届次" name="acDto.session" class="text" />
			</p>
			<p>
				<label>活动类型：</label>
				<select name="acDto.activityType" class="reg">
					<c:forEach items="${ats}" var="atype" ><option value="${atype.id}">${atype.name}</option></c:forEach>
				</select>
				<select class="reg" onchange="applyTypeChange(this)"><option value="1" >个人参赛</option><option value="2">团队参赛</option></select>
				<select class="reg" name="acDto.opusNeed"><option value="1" >要求作品</option><option value="0">不要求作品</option></select>
			</p>
			<p id="applytype" style="display: none">
				<input type="text" title="团队限制人数" name="acDto.applyCount" value="1" class="text" />
			</p>
			<p>
				<textarea name="acDto.intro" title="活动简介..." id="comment" cols="100%" rows="10" ></textarea>
			</p>
			<p>
			<input type="text" class="Wdate" title="报名开始时间(点击输入日期)" name="acDto.airtime" value="报名开始时间(点击输入日期)" onfocus="WdatePicker({startDate:'%y-%M-%d %H:%m:00',minDate:'%y-%M-%d %H:%m:00'})"/>
			</p>
			<p>
			<input type="text" class="Wdate" title="报名截止时间(点击输入日期)" name="acDto.deadtime" value="报名截止时间(点击输入日期)" onfocus="WdatePicker({startDate:'%y-%M-%d %H:%m:00',minDate:'%y-%M-%d %H:%m:00'})"/>
			</p>
			<div class="clear"></div>
			<p>
				<input name="submit" type="submit" class="submit" tabindex="5" value="注册" />
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