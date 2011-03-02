<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<html>
<head>
<title>管理页面</title>
<script language=JavaScript>
	function logout(){
		if (confirm("您确定要退出后台系统吗？")){
			var req; //定义变量，用来创建xmlhttprequest对象
		 	var url="<%=path %>/admin/logoutAdmin"; //要请求的服务端地址
	        if(window.XMLHttpRequest) //非IE浏览器及IE7(7.0及以上版本)，用xmlhttprequest对象创建
	        {
	            req=new XMLHttpRequest();
	        }
	        else if(window.ActiveXObject) //IE(6.0及以下版本)浏览器用activexobject对象创建,如果用户浏览器禁用了ActiveX,可能会失败.
	        {
	            req=new ActiveXObject("Microsoft.XMLHttp");
	        }
	        
	        if(req) //成功创建xmlhttprequest
	        {
	            req.open("POST",url,true); //与服务端建立连接(请求方式post或get，地址,true表示异步)
	            req.onreadystatechange = callback; //指定回调函数
	            req.send(url); //发送请求
	        }
	        function callback() //回调函数，对服务端的响应处理，监视response状态
	        {
	            if(req.readyState == 4) //请求状态为4表示成功
	            {
	                if(req.status == 200) //http状态200表示OK
	                {
	               	 top.location = "index";
	                }
	                else
	                {
	                    alert("退出系统失败！！！服务端返回状态" + req.statusText);
	                }
	            }
	        }
		}
		return false;
	}
</script>
<script language=JavaScript1.2>
function showsubmenu(sid) {
	var whichEl = eval("submenu" + sid);
	var menuTitle = eval("menuTitle" + sid);
	if (whichEl.style.display == "none"){
		eval("submenu" + sid + ".style.display=\"\";");
	}else{
		eval("submenu" + sid + ".style.display=\"none\";");
	}
}
</script>
<meta http-equiv=Content-Type content=text/html;charset=gb2312>
<meta http-equiv="refresh" content="60">
<script language=JavaScript1.2>
function showsubmenu(sid) {
	var whichEl = eval("submenu" + sid);
	var menuTitle = eval("menuTitle" + sid);
	if (whichEl.style.display == "none"){
		eval("submenu" + sid + ".style.display=\"\";");
	}else{
		eval("submenu" + sid + ".style.display=\"none\";");
	}
}
</script>
<base target="main">
<link href="<%=path %>/content/images/admin/skin.css" rel="stylesheet" type="text/css">
</head>
<body leftmargin="0" topmargin="0">
<table width="100%" height="64" border="0" cellpadding="0" cellspacing="0" class="admin_topbg">
  <tr>
    <td width="61%" height="64"><img src="<%=path %>/content/images/admin/logoindex.gif" width="286" height="50"></td>
    <td width="39%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="74%" height="38" class="admin_txt">管理员：<b><font color="#EE0000">${user.realName}</font></b> 您好,感谢登陆使用！</td>
        <td width="22%" height="38" align="right"><a href="#" target="_self" onClick="logout();"><img src="<%=path %>/content/images/admin/out.gif" alt="安全退出" width="46" height="20" border="0"></a></td>
        <td width="4%">&nbsp;</td>
      </tr>
      <tr>
        <td height="19" colspan="3">&nbsp;</td>
        </tr>
    </table></td>
  </tr>
</table>
</body>
</html>

