<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<title>网站管理员登陆</title>
<!-- JQuery库 -->
<script type="text/javascript" src="<%=path%>/content/js/jquery-1.4.2.min.js"></script>
<script language="JavaScript">
	$(document).ready(function(){
	    var arVersion = navigator.appVersion.split("MSIE");
	    var version = parseFloat(arVersion[1]);
	    if ((version >= 5.5) && (document.body.filters)) 
	    {
	       for(var j=0; j<document.images.length; j++)
	       {
	          var img = document.images[j];
	          var imgName = img.src.toUpperCase();
	          if (imgName.substring(imgName.length-3, imgName.length) == "PNG")
	          {
	             var imgID = (img.id) ? "id='" + img.id + "' " : "";
	             var imgClass = (img.className) ? "class='" + img.className + "' " : "";
	             var imgTitle = (img.title) ? "title='" + img.title + "' " : "title='" + img.alt + "' ";
	             var imgStyle = "display:inline-block;" + img.style.cssText ;
	             if (img.align == "left") imgStyle = "float:left;" + imgStyle;
	             if (img.align == "right") imgStyle = "float:right;" + imgStyle;
	             if (img.parentElement.href) imgStyle = "cursor:hand;" + imgStyle;
	             var strNewHTML = "<span " + imgID + imgClass + imgTitle
	             + " style=\"" + "width:" + img.width + "px; height:" + img.height + "px;" + imgStyle + ";"
	             + "filter:progid:DXImageTransform.Microsoft.AlphaImageLoader"
	             + "(src=\'" + img.src + "\', sizingMethod='scale');\"></span>" ;
	             img.outerHTML = strNewHTML;
	             j = j-1;
	          }
	       }
  		}
	});
	function refresh(obj){
		$(obj).hide().attr('src','<%=path %>/kaptcha.jpg?' + Math.floor(Math.random() * 100)).fadeIn();
	}
</script>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #1D3647;
}
-->
</style>
<link href="<%=path %>/content/images/admin/skin.css" rel="stylesheet" type="text/css">
<body>
<table width="100%" height="166" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="42" valign="top"><table width="100%" height="42" border="0" cellpadding="0" cellspacing="0" class="login_top_bg">
      <tr>
        <td width="1%" height="21">&nbsp;</td>
        <td height="42">&nbsp;</td>
        <td width="17%">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td valign="top"><table width="100%" height="532" border="0" cellpadding="0" cellspacing="0" class="login_bg">
      <tr>
        <td width="49%" align="right"><table width="91%" height="532" border="0" cellpadding="0" cellspacing="0" class="login_bg2">
            <tr>
              <td height="138" valign="top"><table width="89%" height="427" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td height="130">&nbsp;</td>
                </tr>
                <tr>
                  <td height="80" align="right" valign="top"><img id="logo" src="<%=path %>/content/images/admin/logo.gif" width="320" height="68"></td>
                </tr>
                <tr>
                  <td height="198" align="right" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="35%">&nbsp;</td>
                      <td height="25" colspan="2" class="left_txt"><p class="main">广东药学院-课外学术科研活动管理系统后台</p></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td height="25" colspan="2" class="left_txt"><p> * 一站通式的整合方式，方便用户使用...</p></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td height="25" colspan="2" class="left_txt"><p> * 强大的后台系统，管理内容易如反掌...</p></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td width="30%" height="40"><img src="<%=path %>/content/images/admin/icon-demo.gif" width="16" height="16"><a href="#" class="left_txt3"> 使用说明</a> </td>
                      <td width="35%"><img src="<%=path %>/content/images/admin/icon-login-seaver.gif" width="16" height="16"><a href="#" class="left_txt3"> 在线客服</a></td>
                    </tr>
                  </table></td>
                </tr>
              </table></td>
            </tr>
            
        </table></td>
        <td width="1%" >&nbsp;</td>
        <td width="50%" valign="bottom"><table width="100%" height="59" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="4%">&nbsp;</td>
              <td width="96%" height="38"><span class="login_txt_bt">登陆学术活动系统后台管理</span></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td height="21"><table cellSpacing="0" cellPadding="0" width="100%" border="0" id="table211" height="328">
                  <tr>
                    <td height="164" colspan="2" align="center"><form name="myform" action="<%=path %>/admin/loginAdmin" method="post">
                        <table cellSpacing="0" cellPadding="0" width="100%" border="0" height="143" id="table212">
                          <tr>
                            <td width="13%" height="38" class="top_hui_text"><span class="login_txt">管理员：&nbsp;&nbsp; </span></td>
                            <td height="38" colspan="2" class="top_hui_text"><input name="username" class="editbox4" value="admin" size="20">                            </td>
                          </tr>
                          <tr>
                            <td width="13%" height="35" class="top_hui_text"><span class="login_txt"> 密 码： &nbsp;&nbsp; </span></td>
                            <td height="35" colspan="2" class="top_hui_text"><input class="editbox4" type="password" size="20" name="password" value="admin">
                              <img src="<%=path %>/content/images/admin/luck.gif" width="19" height="18"> </td>
                          </tr>
                          <tr>
                            <td width="13%" height="35" ><span class="login_txt">验证码：</span></td>
                            <td height="35" colspan="2" class="top_hui_text"><input class=wenbenkuang name="kaptcha" type=text value="" maxLength=4 size=10>
                           		<img src="<%=path %>/kaptcha.jpg" height="25" width="80" id="kaptchaImage" onclick="refresh(this)" /><small><font color="#333333">点击图片刷新</font></small>
							</td>
                          </tr>
                          <tr>
                            <td height="35" >&nbsp;</td>
                            <td width="20%" height="35" ><input name="Submit" type="submit" class="button" id="Submit" value="登 陆"> </td>
                            <td width="67%" class="top_hui_text"><input name="cs" type="button" class="button" id="cs" value="取 消"></td>
                          </tr>
                        </table>
                        <br>
                    </form></td>
                  </tr>
                  <tr>
                    <td width="433" height="164" align="right" valign="bottom"><img src="<%=path %>/content/images/admin/login-wel.gif" width="242" height="138"></td>
                    <td width="57" align="right" valign="bottom">&nbsp;</td>
                  </tr>
              </table></td>
            </tr>
          </table>
          </td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="20"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="login-buttom-bg">
      <tr>
        <td align="center"><span class="login-buttom-txt">Copyright &copy; 2009-2010 3C.GDPU</span></td>
      </tr>
    </table></td>
  </tr>
</table>
