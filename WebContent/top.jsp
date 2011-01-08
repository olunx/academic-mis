<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<script type="text/javascript" src="<%=path %>/style/js/jquery.min.js"></script>
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
    <ul>
      <li class="current_page_item page_item"><a href="#" title=""><span>首页</span></a></li>
      <li class="page_item"><a href="#" title="iRemember"><span>iRemember</span></a></li>
      <li class="page_item"><a href="#" title="iRss"><span>iRss</span></a></li>
      <li class="page_item"><a href="#" title="关于"><span>关于</span></a></li>
      <li class="page_item"><a href="#" title="读书"><span>读书</span></a></li>
      <li class="page_item"><a href="#" title="日程"><span>日程</span></a></li>
    </ul>
  </div>
</div>
<!--导航栏 结束-->
<!--横幅 开始-->
<div id="header" class="clear">
  <div class="container cheader">
    <h1 id="blogtitle"><a href="#">Academic System</a></h1>
    <p class="blogdesc">学术活动管理系统</p>
  </div>
</div>
<!--横幅 结束-->
<div id="navcat">
  <div class="container">
    <!--菜单栏 开始-->
    <ul>
      <li class="cat-item"><a href="#">比赛小组</a>
        <ul class="children">
          <li class="cat-item"><a href="<%=path %>/group/listAllGroup">所有小组</a></li>
          <li class="cat-item"><a href="<%=path %>/group/listGroup">我参加的</a></li>
          <li class="cat-item"><a href="<%=path %>/group/listMeGroup">我创建的</a></li>
          <li class="cat-item"><a href="<%=path %>/group/listApplyGroup">我申请的</a></li>
        </ul>
      </li>
      <li class="cat-item"><a href="#">学术活动</a>
        <ul class="children">
          <li class="cat-item"><a href="<%=path %>/activity/listApplyActivity">我申请的活动</a> </li>
          <li class="cat-item"><a href="<%=path %>/activity/listActivity">所有学术活动</a> </li>
        </ul>
      </li>
    </ul>
    <!--菜单栏 结束-->
  </div>
</div>
<div class="clear"></div>
<div id="wrapper" class="container">