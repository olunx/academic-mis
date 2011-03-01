<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="my" uri="http://gdpu.cn/functions"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
%>
<jsp:include page="/top.jsp"></jsp:include>
<!-- JQuery库 -->
<script type="text/javascript" src="<%=path %>/content/js/calendar/WdatePicker.js"></script> 
<script type="text/javascript" src="<%=path %>/content/xheditor/xheditor-zh-cn.min.js?v=1.1.2"></script>
<script type="text/javascript">
function submitForm(){$('#form').submit();}
</script>
    
	<!--内容区 开始 -->
	<div id="content" class="subcontainer fleft">
		<div class="breadcrumb"> <a href="<%=path%>/index">首页</a> &raquo; <a href="<%=path %>/subject/goAddSubject">创建科研课题招募</a> </div>
	    <!--评论列表 开始-->
    <div id="comments">
       <!--发表评论 开始-->
      <div id="respond">
        <h2 class="mainhead">添加科研课题招募</h2>
        <form action="<%=path %>/subject/addSubject" method="post" id="commentform">
			<p>
				<input type="text" title="课题标题" name="sjDto.name" class="text"/>
			</p>
			<p>
				<textarea name="sjDto.intro" class="xheditor-simple" id="comment" cols="100%" rows="10" ></textarea>
			</p>
			<p>
			<input type="text" class="Wdate" title="报名开始时间（点击输入）" name="sjDto.airtime" value="报名开始时间（点击输入）" onfocus="WdatePicker({startDate:'%y-%M-%d %H:%m:00',minDate:'%y-%M-%d %H:%m:00'})"/>
			</p>
			<p>
			<input type="text" class="Wdate" title="报名截止时间（点击输入）" name="sjDto.deadtime" value="报名截止时间（点击输入）" onfocus="WdatePicker({startDate:'%y-%M-{%d+1} %H:%m:00',minDate:'%y-%M-%d %H:%m:00'})"/>
			</p>
			<div class="clear"></div>
			<p>
				<input name="submit" type="submit" class="submit2" value="创建" />
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