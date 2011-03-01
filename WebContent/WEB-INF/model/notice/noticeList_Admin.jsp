<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
        <td height="31"><div class="titlebt">通知列表</div></td>
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
					<ul id="excerpt">
					<c:forEach items="${pageBean.list}" var="notice">
				        <li>
						<div class="p_coleft fleft">
							<p class="date_s"><fmt:formatDate value="${notice.time}" pattern="yyyy-MM-dd"/></p>
							<span class="comment_s">
		                        <c:choose>
		                            <c:when test="${notice.isCmsAllow == 1}">
		                                <c:choose>
		                                    <c:when test="${fn:length(notice.comments) == 0}">
												 暂无评论
		                                    </c:when>
		                                    <c:otherwise>
												有<a href="<%=path%>/notice/viewNotice?id=${notice.id }">${fn:length(notice.comments)}</a>条评论
		                                    </c:otherwise>
		                                </c:choose>
		                            </c:when>
		                            <c:otherwise>
										禁止评论
		                            </c:otherwise>
		                        </c:choose>
		                    </span>
						</div>
						<div class="p_coright fright">
							<h1 class="prevtitle">(${notice.type.name})<a href="<%=path%>/notice/viewNotice?id=${notice.id }">${notice.title}</a></h1>
								发表人：${notice.author.realName }<br />
								<c:if test="${my:userTypeCompare(user) == 1 || my:userTypeCompare(user) == 2}">
			                        <c:choose>
			                            <c:when test="${notice.noticeHot == null}">
											<a href="<%=path%>/noticehot/goAddNoticeHot?id=${notice.id }">设为热门</a>
			                            </c:when>
			                            <c:otherwise>
											Hot-<a href="<%=path%>/noticehot/deleteNoticeHot?id=${notice.id }">取消</a>
			                            </c:otherwise>
			                        </c:choose>
			                        &nbsp;&nbsp;&nbsp;<a href="<%=path%>/notice/goModifyNotice?id=${notice.id }">编辑</a>
			                        &nbsp;&nbsp;&nbsp;<a href="<%=path%>/notice/deleteNotice?id=${notice.id }">删除</a>
		                        </c:if>
						</div>
						<br class="clear" />
				        </li>
			        </c:forEach>
			        </ul>
					
					<br class="clear">
					<div class="wp-pagenavi">
						<span class="pages">共 ${pageBean.allRow} 条记录  页码 ${pageBean.currentPage}/${pageBean.totalPage}</span>
						<c:choose>
							<c:when test="${pageBean.currentPage == 1}">
								<a class="page">首页</a>
								<a class="page">上一页</a>
							</c:when>
							<c:otherwise>
								<a class="page" href="<%=path%>/notice/listNotice?page=1">首页</a>
								<a class="page" href="<%=path%>/notice/listNotice?page=${pageBean.currentPage-1}">上一页</a>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${pageBean.currentPage != pageBean.totalPage}">
								<a class="page" href="<%=path%>/notice/listNotice?page=${pageBean.currentPage+1}">下一页</a>
								<a class="last" href="<%=path%>/notice/listNotice?page=${pageBean.totalPage}">尾页</a>
							</c:when>
							<c:otherwise>
								<a class="page">下一页</a>
								<a class="last">尾页</a>
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
