<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<jsp:include page="/top.jsp"></jsp:include>

	<!--内容区 开始 -->
	<div id="content" class="subcontainer fleft">
		<div class="breadcrumb"> <a href="<%=path%>/index">首页</a> &raquo; <a href="#">添加助理</a> </div>
	    <!--评论列表 开始-->
    <div id="comments">
       <!--发表评论 开始-->
      <div id="respond">
        <form action="<%=path %>/assistant/addAssistant" method="post" >
			<p>
				<input type="text" title="用户名" name="asDto.username" class="text" />
			</p>
			<p>
				<input type="text" title="用户密码" name="asDto.password" class="text" />
			</p>
			<p>
				<input type="text" title="确认密码" name="asDto.rpassword" class="text" />
			</p>
			<p>
				<input type="text" title="真实姓名" name="stuDto.realName" class="text" />
			</p>
			<div class="clear"></div>
			<p>
				<input name="submit" type="submit" class="submit" tabindex="5" value="添加" />
			</p>
        <div class="clear"></div>
        </form>
      </div>
       <!--发表评论 结束-->
    </div>
    <!--评论列表 结束-->
	</div>
	<!--内容区 结束 -->
<jsp:include page="/bottom.jsp"></jsp:include>

