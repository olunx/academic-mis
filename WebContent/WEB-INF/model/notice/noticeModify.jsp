<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改通知</title>
<%
	String path = request.getContextPath();
%>
<script type="text/javascript" src="<%=path %>/content/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=path %>/content/xheditor/xheditor-zh-cn.min.js?v=1.1.2"></script>
<script type="text/javascript">
$(pageInit);
function pageInit()
{
	$('#elm1').xheditor({upLinkUrl:"<%=path %>/xheditor/editorUpload.action",upLinkExt:"zip,rar,txt",upImgUrl:"<%=path %>/xheditor/editorUpload.action",upImgExt:"jpg,jpeg,gif,png",upFlashUrl:"<%=path %>/xheditor/editorUpload.action",upFlashExt:"swf",upMediaUrl:"<%=path %>/xheditor/editorUpload.action",upMediaExt:"wmv,avi,wma,mp3,mid",onUpload:insertUpload,shortcuts:{'ctrl+enter':submitForm}});
	$('#elm6').xheditor({upLinkUrl:"<%=path %>/xheditor/editorUpload.action",upLinkExt:"zip,rar,txt",upImgUrl:"<%=path %>/xheditor/editorUpload.action",upImgExt:"jpg,jpeg,gif,png",onUpload:insertUpload,shortcuts:{'ctrl+enter':submitForm}});
}
function insertUpload(arrMsg)
{
	var i,msg;
	for(i=0;i<arrMsg.length;i++)
	{
		msg=arrMsg[i];
		$("#uploadList").append('<option value="'+msg.url+'">'+msg.localname+'</option>');
	}
}
function submitForm(){$('#frmDemo').submit();}
</script>
</head>
<body>
	修改通知页面<br />
	<form action="<%=path %>/notice/modifyNotice" method="post">
		<input type="hidden" name="id" value="${notice.id }"/>
		通知标题：<input type="text" name="noticeDto.title" value="${notice.title}" /><br/>
		通知类型: 
			<select name="noticeDto.type" size="1">
					<c:forEach items="${nts}" var="type" >
						<c:choose>
							<c:when test="${notice.id == type.id}">
								<option value="${type.id}" selected="selected">${type.name}</option>
							</c:when>
							<c:otherwise>
								<option value="${type.id}">${type.name}</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
			</select>
			<a href="<%=path %>/noticetype/goAddNoticeType">新建类型</a>
		是否允许评论: 
			<c:choose>
				<c:when test="${notice.isCmsAllow == 1}">
					<input type="radio" name="noticeDto.isCmsAllow" value="1" checked="checked" />是
					<input type="radio" name="noticeDto.isCmsAllow" value="0" />否<br/>
				</c:when>
				<c:otherwise>
					<input type="radio" name="noticeDto.isCmsAllow" value="1" />是
					<input type="radio" name="noticeDto.isCmsAllow" value="0" checked="checked"/>否<br/>
				</c:otherwise>
			</c:choose>
		通知内容：<br/><textarea id="elm6" name="noticeDto.content" rows="20" cols="80" style="width: 60%">${notice.content }</textarea>
		<br />
		选择主题图片：
		<select id="uploadList" name="noticeDto.image" style="width:350px;">
			<option value="${notice.image}">${notice.image}</option>
		</select>
		<br/><br />
		<input type="submit" name="save" value="修改" />
	</form>
</body>
</html>