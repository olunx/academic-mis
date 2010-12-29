<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head profile="http://gmpg.org/xfn/11">
<title>index</title>
<link rel="stylesheet" type="text/css" href="<%=path %>/style/js/style.css" media="screen" />
<!-- IE7 emulation on IE8 for footer widgets to work properly -->
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<!--[if IE 6]>
    <script type="text/javascript" src="<%=path %>/style/js/pngfix.js"></script>
    <script type="text/javascript" src="<%=path %>/style/js/menu.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=path %>/style/js/ie6.css" media="screen" />
<![endif]-->
<script type="text/javascript" src="<%=path %>/style/js/cufon-yui.js"></script>
<script type="text/javascript" src="<%=path %>/style/js/Delicious.font.js"></script>
<script type="text/javascript">
    	Cufon.replace('h2');
    	Cufon.replace('h3');
</script>
<script type='text/javascript' src='<%=path %>/style/js/jquery.js'></script>
<script type='text/javascript' src='<%=path %>/style/js/jquery.easing.min.js'></script>
<script type='text/javascript' src='<%=path %>/style/js/loopedSlider.js'></script>

<link href="<%=path %>/style/theme/colors.css" rel="stylesheet" type="text/css" />

</head>
<body>
<div id="wrap">
  <div id="top">
    <!-- PAGE NAVIGATION -->
    <ul id="pagenav">
      <li class="current_page_item"><a href="#" title="主页"><span class="left"></span>主页<span class="right"></span></a></li>
      <li class="page_item"><a href="#/about-3/" title="关于"><span class="left"></span>关于<span class="right"></span></a></li>
      <li class="page_item"><a href="#/contact/" title="登录"><span class="left"></span>登录<span class="right"></span></a></li>
    </ul>
    <!-- Page Nav Ends -->
    <!-- HEADER -->
    <div id="header"> <a href="#" title="logo"><img class="title" src="<%=path %>/style/js/images/logo.png" alt="logo" /></a>
      <h1><a href="#">首页</a></h1>
    </div>
    <!-- end #header -->
    <!-- MAIN MENU -->
    <div id="menu">
      <ul id="catnav" class="menu">
        <li class="menu-item menu-item-type-taxonomy"><a href="#">我的小组</a>
          <ul class="sub-menu">
            <li class="menu-item menu-item-type-taxonomy"><a href="<%=path %>/group/listGroup">我已加入的</a></li>
            <li class="menu-item menu-item-type-taxonomy"><a href="<%=path %>/group/listMeGroup">我创建的</a></li>
            <li class="menu-item menu-item-type-taxonom、"><a href="<%=path %>/group/listApplyGroup">我申请的</a></li>
          </ul>
        </li>
        <li class="menu-item menu-item-type-taxonomy"><a href="<%=path %>/group/listAllGroup">所有小组</a></li>
        <li class="menu-item menu-item-type-taxonomy"><a href="#">学术活动</a>
          <ul class="sub-menu">
            <li class="menu-item menu-item-type-taxonomy"><a href="<%=path %>/activity/listApplyActivity">我申请的活动</a></li>
            <li class="menu-item menu-item-type-taxonomy"><a href="<%=path %>/activity/listActivity">所有学术活动</a></li>
          </ul>
        </li>`
      </ul>
      <!-- SEARCH -->
      <form method="get" id="searchform" action="#/">
        <div id="search">
          <input type="text" value="search" onfocus="if (this.value == 'search') {this.value = '';}" onblur="if (this.value == '') {this.value = 'search';}" name="s" id="s" />
          <input name="" type="hidden" value="Go" class="btn"  />
        </div>
      </form>
      <!-- end search -->
    </div><!-- end #menu -->
  </div><!-- end #top -->