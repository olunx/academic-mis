<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
%>
<jsp:include page="/top.jsp"></jsp:include>

	<script type="text/javascript" src="<%=path %>/content/xheditor/xheditor-zh-cn.min.js?v=1.1.2"></script>
    <script type="text/javascript">
    $(pageInit);
    function pageInit()
    {
        $('#comment').xheditor({tools:'mfull',upLinkUrl:"<%=path %>/xheditor/editorUpload.action",upLinkExt:"zip,rar,txt",upImgUrl:"<%=path %>/xheditor/editorUpload.action",upImgExt:"jpg,jpeg,gif,png",onUpload:insertUpload,shortcuts:{'ctrl+enter':submitForm}});
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
    function submitForm(){$('#form').submit();}
    </script>

	<!--内容区 开始 -->
	<div id="content" class="subcontainer fleft">
		<div class="breadcrumb"> <a href="<%=path%>/index">首页</a> &raquo; <a href="#">修改通知</a> </div>
	    <!--评论列表 开始-->
    <div id="comments">
       <!--发表评论 开始-->
      <div id="respond">
        <h2 class="mainhead">修改通知内容</h2>
        <div class="cancel-comment-reply"> <a rel="nofollow" id="cancel-comment-reply-link" href="/wordpress/?p=552#respond" style="display:none;">Cancel</a> </div>
        <form id="form" action="<%=path %>/notice/modifyNotice" method="post" id="commentform">
        		<input type="hidden" name="id" value="${notice.id }"/>
			<p>
				<input type="text" title="通知标题" name="noticeDto.title" value="${notice.title }" class="text" />
			</p>
            <p>
            <c:choose>
                <c:when test="${nts != null}">
                    <select name="noticeDto.type" class="reg">
                            <c:forEach items="${nts}" var="type" ><option value="${type.id}" <c:if test="${type.id == notice.type.id }">selected="selected"</c:if> >${type.name}</option></c:forEach>
                    </select>
                </c:when>
                <c:otherwise>
                    没有类型，<a href="<%=path %>/noticetype/goAddNoticeType">新建类型</a>
                </c:otherwise>
            </c:choose>
            <select name="noticeDto.isCmsAllow" class="reg">
				<option value="1" <c:if test="${notice.isCmsAllow == 1 }">selected="selected"</c:if>>允许评论</option>
                <option value="0" <c:if test="${notice.isCmsAllow != 1 }">selected="selected"</c:if>>不允许评论</option>
            </select>
			</p>
			<p>
				<textarea name="noticeDto.content" id="comment" cols="100%" rows="10" >${notice.content}</textarea>
			</p>
			<p>
				已上传的图片列表：<select id="uploadList" class="reg"></select>
			</p>
			<div class="clear"></div>
			<p>
				<input name="submit" type="submit" class="submit2" value="提交修改" />
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

