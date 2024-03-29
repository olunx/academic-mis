<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="my" uri="http://gdpu.cn/functions"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="zh-CN">
<head profile="http://gmpg.org/xfn/11">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- TemplateBeginEditable name="doctitle" -->
<title>学术活动管理系统</title>
<!-- TemplateEndEditable -->
<link rel="stylesheet" href="<%=path %>/style/css/layout.css" type="text/css" media="screen">
<script type="text/javascript" src="<%=path %>/style/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" >
	$(document).ready(function(){  
		var url = "<%=path%>/banner/getAjaxBanner";  
	    $.getJSON(url,function callback(data){  
	        // convert to json object  
	        if(data == null){
	        	
		    }
	        else{
		        var banner = eval("("+data+")");//  
		        $("#header").css({"background-color":banner.color, "background-image": "url(" + '<%=path%>' + banner.background +")", "background-repeat" : "repeat", "background-position" : "top"});  
		        $("#nav").css({"border-color":banner.color});  
	            $("#bannerName").text(banner.name);  
	            $("#bannerIntro").text(banner.intro); 
        	}
	    });
	});
	$(document).ready(function(){  
		$("#navcat .cat-item").hover(
			function() {  
			 $(this).children("ul").css("left","auto");  
			},function(){  
			 $(this).children("ul").css("left","-999em");  
			}
		);
	});

</script>
<style type="text/css">
.recentcomments a {
	display:inline !important;
	padding:0 !important;
	margin:0 !important;
}
</style>
</head>
<body class="home blog logged-in">
<!--导航栏 开始-->
<div id="nav">
  <div class="container">
    <div class="subcontainer">
    <c:if test="${my:userTypeCompare(user) != 2 && my:userTypeCompare(user) != 3 && my:userTypeCompare(user) != 4}">
    <form action="<%=path%>/login"  method="post">
    账号：<input type="text" name="loginDto.username"/>
    密码：<input type="password" name="loginDto.password"/>
    身份：<select name="loginDto.loginType" ><option selected="selected" value="0">学生</option><option value="1" >教师</option><option value="2" >助理</option></select>
    <input id="submit" type="submit" value="登录" />
    </form>
    </c:if>
	<c:if test="${my:userTypeCompare(user) == 3}">
		<a>欢迎你：${user.realName}</a>|<a>用户名：${user.username}</a>|<a href="<%=path %>/myindex">个人中心</a>|<a href="<%=path %>/student/viewStudent?id=${user.id}">个人资料</a>|<a href="<%=path%>/logout">注销</a>
	</c:if>
	<c:if test="${my:userTypeCompare(user) == 4}">
		<a>欢迎您：${user.realName}</a>|<a>用户名：${user.username}</a>|<a href="<%=path %>/myindex">个人中心</a>|<a href="<%=path %>/teacher/viewTeacher?id=${user.id}">个人资料</a>|<a href="<%=path%>/logout">注销</a>
	</c:if>
	<c:if test="${my:userTypeCompare(user) == 2}">
		<a>欢迎你：${user.realName}</a>|<a>用户名：${user.username}</a>|<a href="<%=path %>/myindex">个人中心</a>|<a href="<%=path %>/assistant/viewAssistant?id=${user.id}">个人资料</a>|<a href="<%=path%>/logout">注销</a>
	</c:if>
    </div>
    <div class="sidecontainer">
    <a href="<%=path%>/index">首页</a>&#9679;<a href="<%=path%>/student/goAddStudent">学生注册</a>&#9679;<a href="<%=path%>/teacher/goAddTeacher">老师注册</a>&#9679;<a href="#">校园互动社区</a>
    </div>
  </div>
</div>
<!--导航栏 结束-->
<!--横幅 开始-->
<div id="header" class="clear">
  <div class="container cheader">
    <h1 id="blogtitle"><a href="<%=path %>/index" id="bannerName">学术活动</a></h1>
    <p class="blogdesc" id="bannerIntro">创建一个关于我们的学术交流平台</p>
  </div>
</div>
<!--横幅 结束-->
<div id="navcat">
  <div class="container">
    <!--菜单栏 开始-->
    <ul>
	<li class="cat-item"><a href="<%=path %>/index">本站首页</a></li>
	
	<c:if test="${my:userTypeCompare(user) == 3}">
	<li class="cat-item"><a href="#">我的菜单</a>
		<ul class="children">
			<li class="cat-item"><a href="<%=path %>/group/goAddGroup">创建小组</a></li>
	        <li class="cat-item"><a href="<%=path %>/group/listAllGroup">所有小组</a></li>
	        <li class="cat-item"><a href="<%=path %>/group/listGroup">我参加的</a></li>
	        <li class="cat-item"><a href="<%=path %>/group/listMeGroup">我创建的</a></li>
	        <li class="cat-item"><a href="<%=path %>/group/listApplyGroup">我申请的</a></li>
	        <li class="cat-item"><a href="<%=path %>/activity/listApplyActivity">我申请的活动</a></li>
	        <li class="cat-item"><a href="<%=path %>/activity/listActivity">所有学术活动</a></li>
		</ul>
	</li>
	</c:if>
	
	<c:if test="${my:userTypeCompare(user) == 4}">
	<li class="cat-item"><a href="#">我的菜单</a>
		<ul class="children">
			<li class="cat-item"><a href="#">发布课题</a></li>
	        <li class="cat-item"><a href="#">查看课题</a></li>
	        <li class="cat-item"><a href="#">查看作品</a></li>
	        <li class="cat-item"><a href="#">我点评的作品</a></li>
	        <li class="cat-item"><a href="<%=path %>/group/listAllGroup">查看学习小组</a></li>
		</ul>
	</li>
	</c:if>
	
	<c:if test="${my:userTypeCompare(user) == 5}">
	<li class="cat-item"><a href="#">我的菜单</a>
		<ul class="children">
			<li class="cat-item"><a href="<%=path %>/activity/goAddActivity">添加学术活动</a></li>
	        <li class="cat-item"><a href="<%=path %>/activity/listActivity">列出学术活动</a></li>
	        <li class="cat-item"><a href="<%=path %>/noticetype/goAddNoticeType">添加通知类型</a></li>
	        <li class="cat-item"><a href="<%=path %>/noticetype/listNoticeType">列出通知类型</a></li>
	        <li class="cat-item"><a href="<%=path %>/notice/goAddNotice">添加通知</a></li>
	        <li class="cat-item"><a href="<%=path %>/notice/listNotice">列出通知</a></li>
	        <li class="cat-item"><a href="<%=path %>/noticehot/listNoticeHot">热门通知管理</a></li>
		</ul>
	</li>
	</c:if>
	
      <li class="cat-item"><a href="#">院校导航</a>
        <ul class="children">
          <li class="cat-item"><a href="http://www.gdpu.edu.cn">广东药学院官网</a></li>
          <li class="cat-item"><a href="http://branch.gdpu.edu.cn/kxyj/">科学研究</a></li>
          <li class="cat-item"><a href="http://www.lib.gdpu.edu.cn/">图书馆</a></li>
          <li class="cat-item"><a href="#">管理系统</a></li>
        </ul>
      </li>
      <li class="cat-item"><a href="<%=path %>/activitytype/listActivityType">学术简介</a></li>
      <li class="cat-item"><a href="<%=path %>/opus/listOpus">作品展示</a></li>
      <li class="cat-item"><a href="<%=path %>/teacher/listTeacher">名师风采</a></li>
      <li class="cat-item"><a href="<%=path %>/student/listStudent">优秀学生</a></li>
    </ul>
    <!--菜单栏 结束-->
  </div>
</div>
<div class="clear"></div>

<div id="wrapper" class="container">