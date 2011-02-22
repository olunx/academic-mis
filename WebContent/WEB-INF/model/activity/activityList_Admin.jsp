<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="my" uri="http://gdpu.cn/functions"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
        <td height="31"><div class="titlebt">查看活动</div></td>
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
      			<c:choose>
					<c:when test="${pageBean.list == null}">
									没有数据！
					</c:when>
					<c:otherwise>
						<table class="table">
							<tr>
								<th>活动名称</th>
								<th>届次</th>
								<th>所属类型</th>
								<th>报名方式</th>
								<th>发布人</th>
								<th>创建时间</th>
								<c:if test="${my:userTypeCompare(user) == 1 || my:userTypeCompare(user) == 2}">
								<th>要求作品</th>
								<th>报名情况</th>
								</c:if>
							</tr>
							<c:forEach items="${pageBean.list}" var="activity">
								<tr>
									<td><a onclick="ajaxload(this);return false;" href="<%=path%>/activity/viewActivity?id=${activity.id }">${activity.name}</a></td>
									<td>第${activity.session}届</td>
									<td>${activity.activityType.name}</td>
									<td>${activity.applyCount == 1 ? '单人报名' : '团队报名'},限${activity.applyCount }人</td>
									<td>${my:userTypeCompare(activity.publisher) == 1? '系统管理员' : '管理员助理'}:${activity.publisher.realName}</td>
									<td>${activity.time}</td>
									<th>${activity.opusNeed == 1  ? '要求作品' : '无需作品'}</th>
									<c:if test="${my:userTypeCompare(user) == 1 || my:userTypeCompare(user) == 2}">
									<th>
										<c:choose>
											<c:when test="${my:activityApplyCount(activity) != 0}">
												<font color="red" >当前有${my:activityApplyCount(activity)}个报名</font>
											</c:when>
											<c:otherwise>暂时没有报名</c:otherwise>
										</c:choose>
									</c:if>
								</tr>
							</c:forEach>
						</table>
				
						<div id="pagecount">
							<p>共  ${pageBean.allRow} 条记录 共 ${pageBean.totalPage} 页 当前第 ${pageBean.currentPage}页</p>
							<c:choose>
								<c:when test="${pageBean.currentPage == 1}">
									<a><span>首页</span></a>
									<a><span>上一页</span></a>
								</c:when>
								<c:otherwise>
									<a onclick="ajaxload(this);return false;" href="<%=path%>/activity/listActivity?page=1"><span>首页</span></a>
									<a onclick="ajaxload(this);return false;" href="<%=path%>/activity/listActivity?page=${pageBean.currentPage-1}"><span>上一页</span></a>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${pageBean.currentPage != pageBean.totalPage}">
									<a onclick="ajaxload(this);return false;" href="<%=path%>/activity/listActivity?page=${pageBean.currentPage+1}"><span>下一页</span></a>
									<a onclick="ajaxload(this);return false;" href="<%=path%>/activity/listActivity?page=${pageBean.totalPage}"><span>尾页</span></a>
								</c:when>
								<c:otherwise>
									<a><span>下一页</span></a>
									<a><span>尾页</span></a>
								</c:otherwise>
							</c:choose>
							</div>
					
				
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

