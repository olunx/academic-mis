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
    <h1 id="blogtitle"><a href="#">学术活动</a></h1>
    <p class="blogdesc">创建一个关于我们的学术交流平台</p>
  </div>
</div>
<!--横幅 结束-->
<div id="navcat">
  <div class="container">
    <!--菜单栏 开始-->
    <ul>
      <li class="cat-item"><a href="#">院校导航</a>
        <ul class="children">
          <li class="cat-item"><a href="http://branch.gdpu.edu.cn/kxyj/">科学研究</a></li>
          <li class="cat-item"><a href="#">管理系统</a></li>
        </ul>
      </li>
      <li class="cat-item"><a href="http://www.lib.gdpu.edu.cn/">图书馆</a></li>
    </ul>
    <!--菜单栏 结束-->
  </div>
</div>
<div class="clear"></div>
<div id="wrapper" class="container">