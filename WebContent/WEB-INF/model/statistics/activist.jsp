<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<!-- JQuery库 -->
<script type="text/javascript" src="<%=path%>/content/js/jquery-1.4.2.min.js"></script>

<link type="text/css" rel="stylesheet" href="<%=path%>/content/jq-ui/jquery-ui-1.8.custom.css" />
<script type="text/javascript" src="<%=path%>/content/jq-ui/jquery-ui-1.8.custom.min.js"></script>
<script type="text/javascript" src="<%=path %>/content/js/jquery.doubleSelect.min.js"></script>

<script type="text/JavaScript">
	 $(document).ready(function(){
			
		var majorselect = ${clsmap};
	    $('#first').doubleSelect('second', majorselect);      
	 });
</script>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="17" valign="top" background="<%=path %>/content/images/admin/mail_leftbg.gif"><img src="<%=path %>/content/images/admin/left-top-right.gif" width="17" height="29" /></td>
    <td valign="top" background="<%=path %>/content/images/admin/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td height="31"><div class="titlebt">查看活动积极者</div></td>
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
        		<h1>活动积极者</h1>
        		<form action="<%=path %>/statistics/activistStatistics" method="POST" >
	        		<div>
					<label>选择班级：</label>
					<select id="first" name="insId" size="1" ><option value="">--</option></select>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;
					<select id="second" name="clsId" size="1"><option value="">--</option></select>
					&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="submit" value="查询">
					</div>
				</form>
				<br/>
				<div>
      			<c:choose>
					<c:when test="${pageBean.list == null}">
									没有数据！
							</c:when>
					<c:otherwise>
						<table class="table" >
							<tr>
								<th>用户名</th>
								<th>姓名</th>
								<th>学分</th>
								<th>排名</th>
							</tr>
							<c:forEach items="${pageBean.list}" var="student" varStatus="i">
								<tr>
									<td><a href="<%=path %>/student/viewStudent?id=${student.id}">${student.username}</a></td>
									<td>${student.realName}</td>
									<td>${student.credit}</td>
									<td>${i.count}</td>
								</tr>
							</c:forEach>
						</table>
				
						<div id="pagecount">
						<p>共 ${pageBean.allRow} 条记录 共 ${pageBean.totalPage} 页 当前第 ${pageBean.currentPage}页</p>
						<c:choose>
							<c:when test="${pageBean.currentPage == 1}">
								<a><span>首页</span></a>
								<a><span>上一页</span></a>
							</c:when>
							<c:otherwise>
								<a target="content" href="<%=path%>/statistics/activistStatistics?page=1"><span>首页</span></a>
								<a target="content" href="<%=path%>/statistics/activistStatistics?page=${pageBean.currentPage-1}"><span>上一页</span></a>
							</c:otherwise>
						</c:choose> <c:choose>
							<c:when test="${pageBean.currentPage != pageBean.totalPage}">
								<a target="content" href="<%=path%>/statistics/activistStatistics?page=${pageBean.currentPage+1}"><span>下一页</span></a>
								<a target="content" href="<%=path%>/statistics/activistStatistics?page=${pageBean.totalPage}"><span>尾页</span></a>
							</c:when>
							<c:otherwise>
								<a><span>下一页</span></a>
								<a><span>尾页</span></a>
							</c:otherwise>
						</c:choose></div>
				
					</c:otherwise>
				</c:choose>
				</div>
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

