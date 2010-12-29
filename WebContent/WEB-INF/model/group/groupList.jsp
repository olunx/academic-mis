<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="my" uri="http://gdpu.cn/functions"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
%>
<jsp:include page="/top.jsp"></jsp:include>
  <!-- Content Starts -->
  <div id="content" class="wrap">
  
 	<!-- 左边栏 -->
    <div class="col-left">
      <div id="featured">
      
      	<h2>我加入的群组</h2>
		<c:choose>
			<c:when test="${pageBean.list == null}">
							没有数据！
			</c:when>
			<c:otherwise>
				<table class="table">
					<tr>
						<th>小组名称</th>
						<th>小组简介</th>
						<th>小组队长</th>
						<th>小组成员</th>
					</tr>
					<c:forEach items="${pageBean.list}" var="group">
						<tr>
							<td><a onclick="ajaxload(this);return false;" href="<%=path%>/group/viewGroup?id=${group.id }">${group.name}</a></td>
							<td>${fn:substring(fn:replace(group.intro,"<","&lt;"),0,20)}...</td>
							<td>${group.captain.realName}</td>
							<td>${fn:length(group.members)}</td>
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
							<a onclick="ajaxload(this);return false;" href="<%=path%>/group/listGroup?page=1"><span>首页</span></a>
							<a onclick="ajaxload(this);return false;" href="<%=path%>/group/listGroup?page=${pageBean.currentPage-1}"><span>上一页</span></a>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${pageBean.currentPage != pageBean.totalPage}">
							<a onclick="ajaxload(this);return false;" href="<%=path%>/group/listGroup?page=${pageBean.currentPage+1}"><span>下一页</span></a>
							<a onclick="ajaxload(this);return false;" href="<%=path%>/group/listGroup?page=${pageBean.totalPage}"><span>尾页</span></a>
						</c:when>
						<c:otherwise>
							<a><span>下一页</span></a>
							<a><span>尾页</span></a>
						</c:otherwise>
					</c:choose>
				</div>
			</c:otherwise>
		</c:choose>
		
      </div><!-- featured ends -->
    </div><!-- .col-left ends -->
    
    <!-- 右边栏 -->
    <div class="col-right">
      <div id="main">
      </div><!-- main ends -->
    </div><!-- .col-right ends -->
    
  </div> <!-- Content Ends -->
<jsp:include page="/bottom.jsp"></jsp:include>