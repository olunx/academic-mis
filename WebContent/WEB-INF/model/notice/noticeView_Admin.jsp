<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="my" uri="http://gdpu.cn/functions"%>
<%
	String path = request.getContextPath();
%>
<link href="<%=path %>/content/images/admin/skin.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
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
        <td height="31"><div class="titlebt">查看通知</div></td>
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
			通知标题：${notice.title } <br/>
			<span>通知发布人：${notice.author.realName }</span><br/>
      		通知内容：<br/>
      		${notice.content }
			<br/><br/>
			<c:choose>
				<c:when test="${notice.isCmsAllow == 1}">
					<hr/>
					<div id="notice_post">
					<c:choose>
						<c:when test="${user != null}">
						<form action="<%=path %>/post/addPost" method="post">
							评论：<br/>
							<input type="hidden" name="id" value="${param.id }" />
							<textarea rows="3" cols="40" name="postDto.content"></textarea>
							<input type="submit" value="写好了，保存" />
						</form>
						</c:when>
						<c:otherwise><font color="blue">注册用户才能进行评论</font></c:otherwise>
					</c:choose>
					</div>
					
					<br/><br/>
					<c:choose>
						<c:when test="${notice.comments != null}">
							<h2 class="mainhead">用户评论</h2>
							<c:forEach items="${notice.comments}" var="post" varStatus="i">
							<div class="post">
								<div class="post_info">
								<c:if test="${user.id == post.author.id || my:userTypeCompare(user) == 1 || my:userTypeCompare(user) == 2}">
			                        <a class="btn_del float_right"  href="<%=path %>/post/deletePost?id=${notice.id }&pid=${post.id }">删除</a>
			                        <a class="btn_edit float_right" href="<%=path %>/post/goModifyPost?id=${notice.id }&pid=${post.id }">编辑</a>
		                        </c:if>
		                        ${i.count}.${post.author.realName} <fmt:formatDate value="${post.time}" pattern="yyyy-MM-dd HH:mm"/>
								</div>
								<div class="post_content">
								${post.content}
								<hr/>
								</div>
								
							</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							暂无评论
						</c:otherwise>
					</c:choose>
				</c:when>
				<c:otherwise>
					评论已关闭
				</c:otherwise>
			</c:choose>
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
