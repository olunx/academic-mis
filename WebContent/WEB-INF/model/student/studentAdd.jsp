<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<div class="breadcrumb"> <a href="<%=path%>/index">首页</a> &raquo; <a href="#">学生用户注册</a> </div>
	    <!--评论列表 开始-->
    <div id="comments">
       <!--发表评论 开始-->
      <div id="respond">
        <div class="cancel-comment-reply"></div>
        <form action="<%=path %>/student/addStudent" method="post" >
			<p>
				<input type="text" title="用户账号" name="stuDto.username" id="input" value="" size="22" tabindex="1" />
			</p>
			<p>
				<input type="text" title="用户密码" name="stuDto.password" id="input" value="" size="22" tabindex="2" />
			</p>
			<p>
				<input type="text" title="确认密码" name="stuDto.rpassword" id="input" value="" size="22" tabindex="3" />
			</p>
			<p>
				<input type="text" title="学号" name="stuDto.stuNo" id="input" value="" size="22" tabindex="4"/>
			</p>
			<p>
				<input type="text" title="真实姓名" name="stuDto.realName" id="input" value="" size="22" tabindex="5"/>
			</p>
			<p>
				<input type="text" title="年龄" name="stuDto.age" id="input" value="" size="22" tabindex="6"/>
			</p>
			<p>
				<input type="radio" name="stuDto.sex" id="sex" value="1" checked="checked">男
				<input type="radio" name="stuDto.sex" id="sex" value="0">女<br/>
			</p>
			<p>
				<select id="first" size="1"><option value="">--</option></select>
				<select id="second" name="stuDto.classes" size="1"><option value="">--</option></select>
			</p>
			<p>
				<input type="text" title="入学年份" name="stuDto.schoolYear" id="input" value="" size="22" tabindex="7" />
			</p>
			<div class="clear"></div>
			<p>
				<input name="submit" type="submit" id="submit2" tabindex="5" value="注册" />
			</p>
        <div class="clear"></div>
        </form>
      </div>
       <!--发表评论 结束-->
    </div>
    <!--评论列表 结束-->
	</div>
	<!--内容区 结束 -->
<jsp:include page="/sideidx.jsp"></jsp:include>
<jsp:include page="/bottom.jsp"></jsp:include>
