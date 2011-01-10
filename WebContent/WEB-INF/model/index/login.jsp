<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>学术活动系统</title>
<link href="<%=path %>/content/images/login.css"  rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path %>/content/js/jquery-1.4.2.min.js" ></script>
<script type="text/javaScript">
	$(document).ready(function() {		
		$(".ipt-t").bind({
		  mouseover: function() {
			$(this).addClass('ipt-t-mouse');	
		  },
		  mouseout: function() {
			$(this).removeClass('ipt-t-mouse');	
		  },
		  focus: function() {
			$(this).addClass('ipt-t-focus');	
		  },
		  blur: function() {
			$(this).removeClass('ipt-t-focus');	
		  }
		});
		$('.btn .btn-login').bind({
		  mouseover: function() {
			$(this).addClass('btn-login-hover');
		  },
		  mouseout: function() {
			$(this).removeClass('btn-login-hover');
		  },
		  mousedown: function() {
			$(this).addClass('btn-login-active');
		  },
		  mouseup: function() {
			$(this).removeClass('btn-login-active');
		  }		  
		});
		
	});
</script>
</head>
<body>
	<div class="page">
		<div class="header">
	    	<div class="logo">
	        <h1><a href="<%=path %>/index" title="学术活动系统"><img src="content/images/logo.gif" alt="广东药学院" /></a></h1>
	        </div>
	        <div class="nav">
	       		<a href="<%=path %>/index" title="首页">首页</a> ·
	            <a href="<%=path %>/student/goAddStudent" title="学生注册">学生注册</a> ·
	            <a href="<%=path %>/teacher/goAddTeacher" title="教师注册">教师注册</a>
	        </div>
	    </div>    
	    <div class="content">
			<!--主要内容-->
			<div class="main" id="divTheme">
	            <!--介绍-->
				<div class="intro intro-noico">
	            	<dl>
						<dt><a href="<%=path %>/index" >欢迎使用学术活动管理系统</a></dt>
						<dd>亲爱的童鞋们，在这里您可以参加各种各样的学术活动，创建属于你们的学习团队，挑战自己、超越自我、成就梦想。</dd>
						<dd>敬爱的老师，在这里您可以发布学术课题，点评和评论学生的优秀作品，帮助他们一起翱翔。</dd>
					</dl>
	         	</div>         
				<!--登录框-->
				<div class="login" id="divLogin">
	            	<div class="tabs"><span>登陆学术活动系统</span></div>
	            	<div class="panel" id="panel">
	                	<form id="login" method="post" name="login" action="<%=path %>/login">
	                    	<div id="uName" class="fi">
	                        	<label class="lb">用户名</label>
	                          <input id="idInput" tabindex="1" class="ipt-t" type="text" name="loginDto.username" maxlength="50"/>
	                        </div>
	                        <div class="fi">
								<label class="lb">密　码</label>
								<input id="pwdInput" tabindex="2" class="ipt-t" type="password" name="loginDto.password" maxlength="50"/>
	                        </div>
	                        <div class="fi">
								<label class="lb">类　型</label>
								<select tabindex="3" name="loginDto.loginType" id="selType">
									<option value="0" selected="selected">　　　　学 　　生</option>
									<option value="1">　　　　教 　　师</option>
									<option value="2">　　　　助 　　理</option>
								</select>
							</div>
	                        <div class="fi fi-nolb">
								<button class="btn btn-login" type="submit" >登 录</button>
	                        </div>
	                    </form>
	              </div>
	              <div class="ext">
	               		<ul>
							<li>
	                			请选择正确的身份进行登陆
	                        </li>
	                 		 <li id="reg">
	                			没有账号？&gt;&gt;
	                            <a href="<%=path %>/student/goAddStudent" title="学生注册">学生注册</a> ·
	                            <a href="<%=path %>/teacher/goAddTeacher" title="教师注册">教师注册</a>
	                        </li>
	                        <li>
	                        	<a href="<%=path %>/index" title="返回首页">返回首页</a>
	                        </li>
	                    </ul>
	              </div>
	            </div>
	        </div>
    	</div>
	    <div class="footer">
	    	 <div class="container">
	            <div class="ftext fleft">&copy; 2011 广东药学院 版权所有</div>
	            <div class="fcred fright"> <span class="fleft">3C团队 作品</span></div>
	          </div>
	    </div>
    </div>
</body>
</html>