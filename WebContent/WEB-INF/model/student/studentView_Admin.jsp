<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
        <td height="31"><div class="titlebt">查看助理</div></td>
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
        		<div>
        		当前位置：<a href="<%=path %>/student/listStudent">学生主页</a>-&gt;学生信息
        		</div>
				查看 ${student.realName} 同学的信息<br />
				
				${fn:length(student.singleApplys)}|${fn:length(student.teamApplys)}<br/>
				<c:choose>
					<c:when test="${student.singleApplys != null && fn:length(student.singleApplys) != 0}">
						该同学参加过的学术活动-个人报名<br/>
						<table class="table">
							<tr>
								<th>活动名称</th>
								<th>活动结果</th>
							</tr>
						<c:forEach items="${student.singleApplys}" var="sa">
							<tr>
								<td><a href="<%=path %>/activity/viewActivity?id=${sa.activity.id}">${sa.activity.name }</a></td>
								<td>${sa.activityResult != null ? sa.activityResult.record : sa.status == 3 ? '该学生未能通过申请' : '参加了该活动'}</td>
							</tr>
						</c:forEach>
						</table>
					</c:when>
					
					<c:otherwise>
						该同学还没参加过学术活动-个人报名
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${student.teamApplys != null && fn:length(student.teamApplys) != 0}">
						该同学参加过的学术活动-团队报名<br/>
						<table class="table">
							<tr>
								<th>活动名称</th>
								<th>活动结果</th>
							</tr>
						<c:forEach items="${student.teamApplys}" var="ta">
							<tr>
								<td><a href="<%=path %>/activity/viewActivity?id=${ta.activity.id}">${ta.activity.name }</a></td>
								<td>${ta.activityResult != null ? ta.activityResult.record : ta.status == 3 ? '该学生未能通过申请' : '参加了该活动'}</td>
							</tr>
						</c:forEach>
						</table>
					</c:when>
					
					<c:otherwise>
						该同学还没参加过学术活动-团队报名
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${student.groups != null && fn:length(student.groups) != 0}">
						该同学加入的学习小组<br/>
						<table class="table">
							<tr>
								<th>小组名称</th>
								<th>小组简介</th>
							</tr>
						<c:forEach items="${student.groups}" var="group">
							<tr>
								<td><a href="<%=path %>/group/viewGroup?id=${group.id}">${group.name }</a></td>
								<td>${group.intro}</td>
							</tr>
						</c:forEach>
						</table>
					</c:when>
					
					<c:otherwise>
						该同学还没加入过学习小组
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

