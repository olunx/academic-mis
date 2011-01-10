<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- JQuery库 -->
<script type="text/javascript" src="<%=path%>/content/js/jquery-1.4.2.min.js"></script>
<link type="text/css" rel="stylesheet" href="<%=path%>/content/jq-ui/jquery-ui-1.8.custom.css" />
<script type="text/javascript" src="<%=path%>/content/jq-ui/jquery-ui-1.8.custom.min.js"></script>
<script type="text/javascript" src="<%=path %>/content/js/jquery.doubleSelect.min.js"></script>

<script type="text/JavaScript">

	 $(document).ready(function(){
			
		var majorselect = ${clsmap};
	    $('#first').doubleSelect('second', majorselect);      
	 });
</script>
</head>
<body>
	<jsp:include page="/top.jsp"></jsp:include>
	<!--内容区 开始 -->
	<div id="content" class="subcontainer fleft">
		<div class="breadcrumb"> <a href="<%=path%>/index">首页</a> &raquo; <a href="#">学生用户注册</a> </div>
	    <!--评论列表 开始-->
    <div id="comments">
       <!--发表评论 开始-->
      <div id="respond">
        <div class="cancel-comment-reply"> <a rel="nofollow" id="cancel-comment-reply-link" href="/wordpress/?p=552#respond" style="display:none;">Cancel</a> </div>
        <form action="<%=path %>/student/addStudent" method="post" >
			<p>
				<label for="username">用户账号</label>
				<input type="text" title="用户账号" name="stuDto.username" id="username" value="" size="22" tabindex="1" />
			</p>
			<p>
				<label for="password">用户密码</label>
				<input type="password" title="用户密码" name="stuDto.password" id="password" value="" size="22" tabindex="2" />
			</p>
			<p>
				<label for="rpassword">确认密码</label>
				<input type="password" title="确认密码" name="stuDto.rpassword" id="rpassword" value="" size="22" tabindex="3" />
			</p>
			<p>
				<label for="stuNo">学           号</label>
				<input type="text" title="学号" name="stuDto.stuNo" id="stuNo" value="" size="22" tabindex="4"/>
			</p>
			<p>
				<label for="realName">真实姓名</label>
				<input type="text" title="真实姓名" name="stuDto.stuNo" id="realName" value="" size="22" tabindex="5"/>
			</p>
			<p>
				<label for="sex">性别</label>
				<input type="radio" name="stuDto.sex" id="sex" value="1" checked="checked">男
				<input type="radio" name="stuDto.sex" id="sex" value="0">女<br/>
			</p>
			<p>
				<label for="age">年龄</label>
				<input type="text" title="年龄" name="stuDto.age" id="age" value="" size="22" tabindex="6"/>
			</p>
			<p>
				<label>选择班级：</label>
				<select id="first" size="1"><option value="">--</option></select>
				<select id="second" name="stuDto.classes" size="1"><option value="">--</option></select>
			</p>
			<p>
				<label for="schoolYear">入学年份</label>
				<input type="text" title="入学年份" name="stuDto.schoolYear" id="schoolYear" value="" size="22" tabindex="7" />
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
	<!--侧边栏 开始 -->
	<div id="sidebar" class="sidecontainer fright">
		<div class="widgets">
			<h2 class="mainhead">学生用户注册</h2>
			<ul>
				<li>创建小组</li>
		        <li>所有小组</li>
		        <li>我参加的</li>
			</ul>
			<br class="clear">
			
		</div>
	</div>
	<!--侧边栏 结束 -->
<jsp:include page="/bottom.jsp"></jsp:include>
</body>
</html>