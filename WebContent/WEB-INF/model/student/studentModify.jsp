<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
%>
<jsp:include page="/top.jsp"></jsp:include>
<!-- JQuery库 -->
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

<script type="text/javascript" src="<%=path %>/content/js/jquery.doubleSelect.min.js"></script>
<script type="text/JavaScript">
	 $(document).ready(function(){
		var majorselect = ${clsmap};
	    $('#first').doubleSelect('second', majorselect);      
	 });
</script>
	<!--内容区 开始 -->
	<div id="content" class="subcontainer fleft">
		<div class="breadcrumb"> <a href="<%=path%>/index">首页</a> &raquo; <a href="#">修改学生信息</a> </div>
	    <!--评论列表 开始-->
    <div id="comments">
       <!--发表评论 开始-->
      <div id="respond">
      	<h1>基本信息修改</h1><hr>
        <form action="<%=path %>/student/modifyStudent" method="post" >
        		<input type="hidden" name="stuDto.id" value="${student.id}" readonly="readonly">
			<p>
				<input type="text" title="用户账号" name="stuDto.username" class="text" value="${student.username }" readonly="readonly"/>
			</p>
			<p>
				<input type="text" title="学号" name="stuDto.stuNo" class="text" value="${student.stuNo }"/>
			</p>
			<p>
				<input type="text" title="真实姓名" name="stuDto.realName" class="text" value="${student.realName }"/>
			</p>
			<p>
				<input type="text" title="年龄" name="stuDto.age" class="text" value="${student.age }"/>
			</p>
			<p>
				<select id="first" class="reg"><option value="">--</option></select>
				<select id="second" name="stuDto.classes" class="reg"><option value="">--</option></select>
				<select name="stuDto.schoolYear" class="reg">
					<option value="2007" <c:if test="${student.schoolYear == 2007}">selected="selected"</c:if> >2007级</option>
					<option value="2008" <c:if test="${student.schoolYear == 2008}">selected="selected"</c:if> >2008级</option>
					<option value="2009" <c:if test="${student.schoolYear == 2009}">selected="selected"</c:if> >2009级</option>
					<option value="2010" <c:if test="${student.schoolYear == 2010}">selected="selected"</c:if> >2010级</option>
					<option value="2011" <c:if test="${student.schoolYear == 2011}">selected="selected"</c:if> >2011级</option>
				</select>
				<select class="reg" name="stuDto.sex"><option value="1" <c:if test="${student.sex == 1}">selected="selected"</c:if> >男生</option><option value="0" <c:if test="${student.sex != 1}">selected="selected"</c:if> >女生</option></select>
			</p>

			<div class="clear"></div>
			<p>
				<input name="submit" type="submit" class="submit" tabindex="5" value="提交修改" />
			</p>
        <div class="clear"></div>
        </form>
        <h1>修改密码</h1><hr>
        <form action="<%=path %>/student/modifyPswStudent" method="post" >
        		<input type="hidden" name="stuDto.id" value="${student.id}" readonly="readonly">
			<p>
				<input type="text" title="用户账号" name="stuDto.username" class="text" value="${student.username }" readonly="readonly"/>
			</p>
			<p>
				<input type="text" title="旧的密码" name="stuDto.opassword" class="text" />
			</p>
			<p>
				<input type="text" title="新的密码" name="stuDto.password" class="text" />
			</p>
			<p>
				<input type="text" title="确认密码" name="stuDto.rpassword" class="text" />
			</p>

			<div class="clear"></div>
			<p>
				<input name="submit" type="submit" class="submit" tabindex="5" value="修改密码" />
			</p>
        <div class="clear"></div>
        </form>
        <h1>学生详细介绍</h1><hr>
        <form action="<%=path %>/student/modifyRemarkStudent" method="post" >
        		<input type="hidden" name="stuDto.id" value="${student.id}" readonly="readonly">
			<p>
				<textarea name="stuDto.remark" class="xheditor-simple" id="comment" cols="100%" rows="10" >${student.remark != null ? student.remark : '这家伙很懒，什么都没留下！'}</textarea>
			</p>

			<div class="clear"></div>
			<p>
				<input name="submit" type="submit" class="submit" tabindex="5" value="完善介绍" />
			</p>
        <div class="clear"></div>
        </form>
        <h1>上传学生头像</h1><hr>
        <form action="<%=path %>/student/addAvatarStudent" method="post" >
        		<input type="hidden" name="stuDto.id" value="${student.id}" readonly="readonly">
       		<c:if test="${student.avatar != null}">
       			当前头像：<br/>
       			<img src="<%=path%>${student.avatar.minFileUrl}"></img>
       			<br/>
       		</c:if>
				上传头像：<br/>
				<a onclick="return hs.htmlExpand(this, { objectType: 'iframe' } )" href="<%=path%>/image/goUploadImage?cutWidth=60&cutHeight=60">上传图片</a>
				<!-- 上传成功后，图片将插到这里。 -->
				<div id="pic">
					<img src="#"></img>
					<input id="oriFileName" type="hidden" name="image.oriFileName" value=""/>
					<input id="bigFileName" type="hidden" name="image.bigFileName" value=""/>
					<input id="bigFileUrl" type="hidden" name="image.bigFileUrl" value=""/>
					<input id="minFileName" type="hidden" name="image.minFileName" value=""/>
					<input id="minFileUrl" type="hidden" name="image.minFileUrl" value=""/>
				</div>
			<div class="clear"></div>
			<p>
				<input name="submit" type="submit" class="submit" tabindex="5" value="确认提交" />
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
