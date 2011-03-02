<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
%>
<link href="<%=path %>/content/images/admin/skin.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<script type="text/javascript" src="<%=path%>/content/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=path %>/content/xheditor/xheditor-zh-cn.min.js?v=1.1.2"></script>
<script type="text/javascript">
    $(pageInit);
    function pageInit()
    {
        $('#comment').xheditor({tools:'mfull',upLinkUrl:"<%=path %>/xheditor/editorUpload.action",upLinkExt:"zip,rar,txt",upImgUrl:"<%=path %>/xheditor/editorUpload.action",upImgExt:"jpg,jpeg,gif,png",onUpload:insertUpload,shortcuts:{'ctrl+enter':submitForm}});
    }
    function insertUpload(arrMsg)
    {
        var i,msg;
        for(i=0;i<arrMsg.length;i++)
        {
            msg=arrMsg[i];
            $("#uploadList").append('<option value="'+msg.url+'">'+msg.url+'</option>');
        }
    }
    function submitForm(){$('#form').submit();}
</script>
<style type="text/css">
	body {
		margin:0px;
		width: 100%;
		background-color: #EEF2FB;
	}
</style>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="17" valign="top" background="<%=path %>/content/images/admin/mail_leftbg.gif"><img src="<%=path %>/content/images/admin/left-top-right.gif" width="17" height="29" /></td>
    <td valign="top" background="<%=path %>/content/images/admin/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td height="31"><div class="titlebt">发表通知</div></td>
      </tr>
    </table></td>
    <td width="16" valign="top" background="<%=path %>/content/images/admin/mail_rightbg.gif"><img src="<%=path %>/content/images/admin/nav-right-bg.gif" width="16" height="29" /></td>
  </tr>
  <tr>
    <td valign="middle" background="<%=path %>/content/images/admin/mail_leftbg.gif">&nbsp;</td>
    <td valign="top" bgcolor="#F7F8F9"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td colspan="2" valign="top">&nbsp;</td>
        <td>&nbsp;</td>
        <td valign="top">&nbsp;</td>
      </tr>
      <tr>
        <td width="7%">&nbsp;</td>
        <td width="100%" valign="top">
        	<div class="context">
      		<form id="form" action="<%=path %>/notice/addNotice" method="post" >
				通知标题:<input type="text" title="通知标题" name="noticeDto.title" /><br/>
            	通知类型:
	            <c:choose>
	                <c:when test="${nts != null}">
	                    <select name="noticeDto.type" >
                            <c:forEach items="${nts}" var="type" >
                            <option value="${type.id}">${type.name}</option>
                            </c:forEach>
	                    </select>
	                </c:when>
	                <c:otherwise>
	                    	没有类型，<a href="<%=path %>/noticetype/goAddNoticeType">新建类型</a>
	                </c:otherwise>
	            </c:choose>
	            <br/>
	          	 通知评论:
	            <select name="noticeDto.isCmsAllow">
					<option value="1">允许评论</option>
	                <option value="0">不允许评论</option>
	            </select>
	            <br/>
	           	 通知内容：<br/>
				<textarea id="comment" name="noticeDto.content" cols="100%" rows="10" ></textarea><br/>
				已上传的图片列表：<select id="uploadList"></select>
				<br/>
				<input name="submit" type="submit" value="添加" />
	        </form>
      		</div>
        </td>
      </tr>
      <tr>
        <td height="40" colspan="4">
        <table width="100%" height="1" border="0" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
          <tr>
            <td></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td width="2%">&nbsp;</td>
        <td width="51%" class="left_txt"><img src="<%=path %>/content/images/admin/icon-mail2.gif" width="16" height="11"> 客户服务邮箱：76212057@qq.com<br>
              <img src="<%=path %>/content/images/admin/icon-phone.gif" width="17" height="14"> 官方网站：http://www.fuchal.com</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
    <td background="<%=path %>/content/images/admin/mail_rightbg.gif">&nbsp;</td>
  </tr>
  <tr>
    <td valign="bottom" background="<%=path %>/content/images/admin/mail_leftbg.gif"><img src="<%=path %>/content/images/admin/buttom_left2.gif" width="17" height="17" /></td>
    <td background="<%=path %>/content/images/admin/buttom_bgs.gif"><img src="<%=path %>/content/images/admin/buttom_bgs.gif" width="17" height="17"></td>
    <td valign="bottom" background="<%=path %>/content/images/admin/mail_rightbg.gif"><img src="<%=path %>/content/images/admin/buttom_right2.gif" width="16" height="17" /></td>
  </tr>
</table>
</body>
