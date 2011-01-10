<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>创建通知</title>
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
		$("#uploadList").append('<option value="'+msg.url+'">'+msg.url+'</option>');
	}
}
function submitForm(){$('#frmDemo').submit();}
</script>
</head>
<body>
	创建通知页面<br />
	<form id="frmDemo" action="<%=path %>/notice/addNotice" method="post">
		通知标题：<input type="text" name="noticeDto.title" /><br/>
		通知类型: 
		<c:choose>
			<c:when test="${nts != null}">
				<select name="noticeDto.type" size="1">
						<c:forEach items="${nts}" var="type" ><option value="${type.id}">${type.name}</option></c:forEach>
				</select>
			</c:when>
			<c:otherwise>
				没有类型，
			</c:otherwise>
		</c:choose>
		<a href="<%=path %>/noticetype/goAddNoticeType">新建类型</a>
		是否允许评论: <input type="radio" name="noticeDto.isCmsAllow" value="1" checked="checked" />是
					<input type="radio" name="noticeDto.isCmsAllow" value="0" />否<br/>
		通知内容：<br/><textarea id="elm6" name="noticeDto.content" rows="20" cols="80" style="width: 60%"></textarea>
		<br />上传图片列表：<select id="uploadList" style="width:350px;"></select>
		<br/><br />
		<input type="submit" name="save" value="发表" />
		<input type="reset" name="reset" value="重置" />
	</form>
</body>
</html>