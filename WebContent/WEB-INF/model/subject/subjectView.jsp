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
<!--内容区 开始 -->
<!--内容区 开始 -->
		
<div id="content" class="subcontainer fleft">
	<div class="breadcrumb"> <a href="<%=path%>/index">首页</a> &raquo; <a href="<%=path %>/subject/viewSubject">查看科研课题招募</a> </div>
    <div class="post-552 post type-post hentry category-android tag-37"	id="post-552">
        <div class="posthead">
            <div class="maindate fleft">${subject.publisher.realName}<br />
            	<span>${subject.publisher.title == 1 ? '教授' : subject.publisher.title == 2 ? '副教授' : subject.publisher.title == 3 ? '讲师' : '助教'}</span>
            </div>
            <h1 class="maintitle fleft"><a href="#" rel="bookmark">${subject.name }</a></h1>
            <br class="clear" />
        </div>
        
    <div class="entry">课题简介: ${subject.intro }<br/></div>
    <c:if test="${my:userTypeCompare(user) == 4 && subject.publisher.id == user.id}">
    	<a href="<%=path %>/subject/goModifySubject?id=${subject.id}">修改</a>
    	<a href="<%=path %>/subject/deleteSubject?id=${subject.id}">删除</a>
    </c:if>
    <p class="postinfo clear">
	    <span class="category">招募开始时间：<a href="#" rel="category">${subject.airtime }</a></span>
	    <span class="comment">招募结束时间：<a href="#">${subject.deadtime }</a></span>
	    <span class="category">
		    <c:choose>
			 	<c:when test="${my:userTypeCompare(user) == 3}">
			 		<c:choose>
			 			<c:when test="${my:mySubjectApplyStatus(subject,user) == 1}">
					 		<a href="<%=path %>/subject/listApplySubject"><font color="Blue">你已经申请该课题的报名了,请等待审核</font></a>
					 	</c:when>
					 	<c:when test="${my:mySubjectApplyStatus(subject,user) == 2}">
					 		你已经完成该课题的报名了，<a href="<%=path%>/subject/quitSubject?id=${subject.id}">退出</a>
					 	</c:when>
					 	<c:otherwise>
					 		<c:choose>
					 			<c:when test="${my:isSubjectApplyTime(subject)}">
		                			该课题招募的报名时间为[${subject.airtime} - ${subject.deadtime}],现在不是报名时间，或者报名已经结束了。
		                		</c:when>
		                		<c:otherwise>
		                			<a href="<%=path%>/subject/applySubject?id=${subject.id}"><font color="red">申请加入</font></a>
		                		</c:otherwise>
					 		</c:choose>
					 	</c:otherwise>
				 	</c:choose>
			 	</c:when>
		    </c:choose>
	    </span>
    </p>

    <p></p>
    
    </div><!--end of post-->

<!--加入活动 开始-->
<div id="comments">
<c:choose>
	<c:when test="${my:subjectApplyDoneCount(subject) != 0}">
		<h2 class="mainhead">已经有${my:subjectApplyDoneCount(subject)}个学生成功报名该课题</h2>
		<ol class="commentlist">
			<c:forEach items="${subject.subjectApplys}" var="subjectApply" >
				<c:if test="${subjectApply.status == 2}">
					<li class="comment even thread-even depth-1" id="li-comment-204">
					<div id="comment-204">
		                <div class="comment-author fleft"><img src='<%=path%>/style/images/nobody.png' class='avatar avatar-60 photo' height='60' width='60' /></div>
		                <div class="comment-info fright">
		                    <div class="c_info">申请人：<a href="<%=path %>/student/viewStudent?id=${subjectApply.student.id}">${subjectApply.student.realName}</a></div>
		                    <p>审核状态：${subjectApply.record }</p>
		                    <div class="reply fleft">
		                        result
		                    </div>
		                </div>
		                <div class="clear"></div>
					</div>
					</li>
				</c:if>
			</c:forEach>
		</ol>
	</c:when>
	<c:otherwise>
		<h2 class="mainhead">该课题暂时没有学生报名</h2>
	</c:otherwise>
</c:choose>
		
<!-- 该课题发布人对报名进行管理 -->
<c:choose>
	<c:when test="${my:userTypeCompare(user) == 4 && subject.publisher.id == user.id}">
		<c:choose>
			<c:when test="${my:subjectApplyCount(subject) != 0}">
			<h2 class="mainhead">有${my:subjectApplyCount(subject)}个人申请报名该课题</h2>
			<ol class="commentlist">
				<c:forEach items="${subject.subjectApplys}" var="subjectApply" >
					<c:if test="${subjectApply.status == 1}">
						<li class="comment even thread-even depth-1" id="li-comment-204">
						<div id="comment-204">
							<div class="comment-author fleft"><img src='<%=path%>/style/images/nobody.png' class='avatar avatar-60 photo' height='60' width='60' /></div>
								<div class="comment-info fright">
								<div class="c_info">申请人：<a href="<%=path %>/student/viewStudent?id=${subjectApply.student.id}">${subjectApply.student.realName}</a></div>
								<p>审核状态：${subjectApply.record }</p>
									<div class="reply fleft">
										<a class='comment-reply-link' href="<%=path %>/subject/passApplySubject?id=${subjectApply.id}">通过</a> | 
										<a class='comment-reply-link' href="<%=path %>/subject/refuseApplySubject?id=${subjectApply.id}">拒绝</a>
									</div>
								</div>
							<div class="clear"></div>
						</div>
						</li>
					</c:if>
				</c:forEach>
			</ol>
		</c:when>
		
	 	<c:otherwise>该课题暂时没有学生报名</c:otherwise>
	 	
	 </c:choose>
	</c:when>
</c:choose>

</div>
<!--加入活动 结束-->

<!--发表评论 开始-->

<!--发表评论 结束-->

</div>
<!--内容区 结束 -->

<jsp:include page="/bottom.jsp"></jsp:include>
