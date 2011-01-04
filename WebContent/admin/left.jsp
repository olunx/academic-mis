<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>管理页面</title>

<script src="<%=path %>/content/js/prototype.lite.js" type="text/javascript"></script>
<script src="<%=path %>/content/js/moo.fx.js" type="text/javascript"></script>
<script src="<%=path %>/content/js/moo.fx.pack.js" type="text/javascript"></script>
<link href="<%=path %>/content/images/admin/left.css" rel="stylesheet" type="text/css" />
</head>

<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#EEF2FB">
  <tr>
    <td width="182" valign="top"><div id="container">
      <h1 class="type"><a href="javascript:void(0)">网站常规管理</a></h1>
      <div class="content">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="<%=path %>/content/images/admin/menu_topline.gif" width="182" height="5" /></td>
          </tr>
        </table>
        <ul class="MM">
          <li><a href="right.jsp" target="main">后台首页</a></li>
        </ul>
      </div>
      <h1 class="type"><a href="javascript:void(0)">通知信息管理</a></h1>
      <div class="content">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="<%=path %>/content/images/admin/menu_topline.gif" width="182" height="5" /></td>
          </tr>
        </table>
        <ul class="MM">
          <li><a href="<%=path %>/notice/listNotice" target="main">通知管理</a></li>
          <li><a href="<%=path %>/notice/goAddNotice" target="main">添加通知</a></li>
          <li><a href="<%=path %>/noticetype/listNoticeType" target="main">通知类型管理</a></li>
          <li><a href="<%=path %>/noticetype/goAddNoticeType" target="main">添加通知类型</a></li>
          <li><a href="<%=path %>/noticehot/listNoticeHot" target="main">热门通知管理</a></li>
        </ul>
      </div>
       <h1 class="type"><a href="javascript:void(0)">注册用户管理</a></h1>
      <div class="content">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="<%=path %>/content/images/admin/menu_topline.gif" width="182" height="5" /></td>
          </tr>
        </table>
        <ul class="MM">
          <li><a href="<%=path %>/student/listStudent" target="main">学生管理</a></li>
          <li><a href="<%=path %>/teacher/listTeacher" target="main">教师管理</a></li>
        </ul>
      </div>
       <h1 class="type"><a href="javascript:void(0)">学习小组管理</a></h1>
      <div class="content">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="<%=path %>/content/images/admin/menu_topline.gif" width="182" height="5" /></td>
          </tr>
        </table>
        <ul class="MM">
          <li><a href="<%=path %>/group/listAllGroup" target="main">小组管理</a></li>
        </ul>
      </div>
    </div>
      <h1 class="type"><a href="javascript:void(0)">学术活动管理</a></h1>
      <div class="content">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="<%=path %>/content/images/admin/menu_topline.gif" width="182" height="5" /></td>
          </tr>
        </table>
        <ul class="MM">
          <li><a href="<%=path %>/activitytype/listActivityType" target="main">查看学术活动类型</a></li>
          <li><a href="<%=path %>/activitytype/goAddActivityType" target="main">添加学术活动类型</a></li>
        </ul>
      </div>
      <h1 class="type"><a href="javascript:void(0)">管理员管理</a></h1>
      <div class="content">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="<%=path %>/content/images/admin/menu_topline.gif" width="182" height="5" /></td>
          </tr>
        </table>
        <ul class="MM">
		  <li><a href="<%=path %>/admin/goAddAdmin" target="main">添加管理员</a></li>
          <li><a href="<%=path %>/admin/listAdmin" target="main">查看管理员</a></li>
          <li><a href="<%=path %>/assistant/goAddAssistant" target="main">添加助理</a></li>
          <li><a href="<%=path %>/assistant/listAssistant" target="main">查看助理</a></li>
        </ul>
      </div>
      <h1 class="type"><a href="javascript:void(0)">查询统计分析</a></h1>
      <div class="content">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="<%=path %>/content/images/admin/menu_topline.gif" width="182" height="5" /></td>
          </tr>
        </table>
        <ul class="MM">
		  <li><a href="<%=path %>/statistics/activistStatistics" target="main">学术活动积极分子</a></li>
        </ul>
      </div>
        <h1 class="type"><a href="javascript:void(0)">其它参数管理</a></h1>
      <div class="content">
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><img src="<%=path %>/content/images/admin/menu_topline.gif" width="182" height="5" /></td>
            </tr>
          </table>
        <ul class="MM">
            <li><a href="right.jsp" target="main">管理设置</a></li>
          <li><a href="right.jsp" target="main">主机状态</a></li>
          <li><a href="right.jsp" target="main">攻击状态</a></li>
          <li><a href="right.jsp" target="main">登陆记录</a></li>
          <li><a href="right.jsp" target="main">运行状态</a></li>
        </ul>
      </div>
      <script type="text/javascript">
		var contents = document.getElementsByClassName('content');
		var toggles = document.getElementsByClassName('type');
	
		var myAccordion = new fx.Accordion(
			toggles, contents, {opacity: true, duration: 400}
		);
		myAccordion.showThisHideOpen(contents[0]);
	  </script>
  	 </td>
  </tr>
</table>
</body>
</html>


