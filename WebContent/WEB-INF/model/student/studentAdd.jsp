<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        <form action="<%=path %>/student/addStudent" method="post" >
			<p>
				<input type="text" title="用户账号" name="stuDto.username" class="text" />
			</p>
			<p>
				<input type="text" title="用户密码" name="stuDto.password" class="text" />
			</p>
			<p>
				<input type="text" title="确认密码" name="stuDto.rpassword" class="text" />
			</p>
			<p>
				<input type="text" title="学号" name="stuDto.stuNo" class="text" />
			</p>
			<p>
				<input type="text" title="真实姓名" name="stuDto.realName" class="text" />
			</p>
			<p>
				<input type="text" title="年龄" name="stuDto.age" class="text" />
			</p>
			<p>
				<select id="first" class="reg"><option value="">--</option></select>
				<select id="second" name="stuDto.classes" class="reg"><option value="">--</option></select>
				<select name="stuDto.schoolYear" class="reg">
					<option value="2007">2007级</option>
					<option value="2008">2008级</option>
					<option value="2009">2009级</option>
					<option value="2010">2010级</option>
					<option value="2011">2011级</option>
				</select>
				<select class="reg" name="stuDto.sex"><option value="1" >男生</option><option value="0">女生</option></select>
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
<jsp:include page="/sideidx.jsp"></jsp:include>
<jsp:include page="/bottom.jsp"></jsp:include>
