<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
%>
<jsp:include page="/top.jsp"></jsp:include>

<script type="text/javascript" src="<%=path%>/content/js/jquery-1.4.2.min.js"></script>
<!-- JQ验证插件 -->
<script type="text/javascript" src="<%=path%>/content/jq-validate/jquery.form.js" ></script>
<script type="text/javascript" src="<%=path%>/content/jq-validate/jquery.validate.pack.js" ></script>
<script type="text/javascript" src="<%=path%>/content/jq-validate/messages_cn.js" ></script>

<link type="text/css" rel="stylesheet" href="<%=path%>/content/jq-ui/jquery-ui-1.8.custom.css" />
<script type="text/javascript" src="<%=path%>/content/jq-ui/jquery-ui-1.8.custom.min.js"></script>

<!-- highslide -->
<link type="text/css" rel="stylesheet" href="<%=path%>/content/jq-highslide/highslide.css" />
<script type="text/javascript" src="<%=path%>/content/jq-highslide/highslide-full.min.js"></script>
<script type="text/javascript" src="<%=path%>/content/js/highslide-init.js"></script>
<script type="text/javascript" src="<%=path%>/content/js/jquery.scrollTo-min.js"></script>
<script type="text/javascript" src="<%=path%>/content/js/jquery.easydrag.js"></script>
<!--[if IE]> 
		<script type="text/javascript" src="<%=path%>/content/jq-highcharts/highcharts-ie.js"></script> 
<![endif]-->
<script type="text/JavaScript">
$(document).ready(function(){
	
	$('#inputform').validate({
		submitHandler: function() {
			post($('#inputform'));
		}
	});
	
       
	initHighslide("<%=path%>", "840", "640");
});
</script>

	<!--内容区 开始 -->
	<div id="content" class="subcontainer fleft">
		<div class="breadcrumb"> <a href="<%=path%>/index">首页</a> &raquo; <a href="<%=path %>/notice/ListNotice">所有通知</a> &raquo; <a href="#">创建热门通知</a> </div>
	    <!--评论列表 开始-->
    <div id="comments">
       <!--发表评论 开始-->
      <div id="respond">
        <h2 class="mainhead">添加热门通知</h2>
        <div class="cancel-comment-reply"> <a rel="nofollow" id="cancel-comment-reply-link" href="/wordpress/?p=552#respond" style="display:none;">Cancel</a> </div>
	       <form action="<%=path %>/noticehot/addNoticeHot" method="post">
				你确定要设《${notice.title }》为热门通知吗？
				<input type="hidden" name="id" value="${notice.id }"/>
				设置显示序号：<input type="text" name="nhDto.rank" />（1-6）<br/>
				<label>上传头像：</label>
				<a onclick="return hs.htmlExpand(this, { objectType: 'iframe' } )" href="<%=path%>/image/goUploadImage?cutWidth=60&cutHeight=40">上传图片</a>
				<!-- 上传成功后，图片将插到这里。 -->
				<div id="pic">
					<img src="#"></img>
					<input id="oriFileName" type="hidden" name="image.oriFileName" value=""/>
					<input id="bigFileName" type="hidden" name="image.bigFileName" value=""/>
					<input id="bigFileUrl" type="hidden" name="image.bigFileUrl" value=""/>
					<input id="minFileName" type="hidden" name="image.minFileName" value=""/>
					<input id="minFileUrl" type="hidden" name="image.minFileUrl" value=""/>
				</div>
				<p>
					<input name="submit" type="submit" class="submit2" value="提交设置" />
				</p>
				 <div class="clear"></div>
			</form>
			<br/>
			<br/>
			<div>
				当前热门通知<br/>
				<c:choose>
					<c:when test="${nhs != null}">
						<c:forEach items="${nhs}" var="nh">
							《${nh.notice.title }》-序号：${nh.rank}<br/>
						</c:forEach>
					</c:when>
					<c:otherwise>
						暂无热门通知！！！
					</c:otherwise>
				</c:choose>
			</div>
		</div>
       <!--发表评论 结束-->
    </div>
    <!--评论列表 结束-->
	</div>
	<!--内容区 结束 -->

<jsp:include page="/bottom.jsp"></jsp:include>

