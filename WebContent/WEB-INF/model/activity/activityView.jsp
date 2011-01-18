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

<div id="content" class="subcontainer fleft">
    <div class="post-552 post type-post hentry category-android tag-37"	id="post-552">
        <div class="posthead">
            <div class="maindate fleft">${activity.session }<br /><span>届次</span></div>
            <h1 class="maintitle fleft"><a href="#" rel="bookmark">${activity.name }</a></h1>
            <br class="clear" />
        </div>
        
    <div class="entry">活动简介: ${activity.intro }<br/></div>
    
    <p class="postinfo clear">
	    <span class="category">活动类型：<a href="#" rel="category">${activity.activityType.name}</a></span>
	    <span class="comment">报名方式：<a href="#">${activity.applyCount == 1 ? '个人报名参赛' : '团队报名参赛'}</a></span>
	    <span class="category">
		    <c:choose>
			 	<c:when test="${student != null}">
			 		<c:choose>
			 			<c:when test="${activity.applyCount == 1 && my:isMyActivity(activity,student) == 1}">
					 		你已经完成该活动的报名了，<a href="<%=path%>/activity/quitActivity?id=${activity.id}">退出</a>
					 	</c:when>
					 	<c:when test="${activity.applyCount == 1 && my:isSingleApplyDone(activity,student)}">
		                	<a href="<%=path %>/activity/listApplyActivity"><font color="Blue">你已经申请该活动的报名了,请等待审核</font></a>
		                </c:when>
				 		<c:when test="${activity.applyCount != 1 && my:isMyActivity(activity,student) == 2}">
		                	你创建的小组已经完成该活动的报名了，<a href="<%=path%>/activity/quitActivity?id=${activity.id}">退出</a>
		                </c:when>
					 	<c:when test="${activity.applyCount != 1 && my:isMyActivity(activity,student) == 3}">
		                	你所在的小组已经完成该活动的报名了。
		                </c:when>
					 	<c:when test="${activity.applyCount != 1 && my:isTeamApplyDone(activity,student) != null}">
		                	<a href="<%=path %>/activity/listApplyActivity"><font color="Blue">你所在的小组${my:isTeamApplyDone(activity,student).name}已经申请该活动的报名了,请等待审核</font></a>
		                </c:when>
					 	<c:when test="${my:isActivityApplyTime(activity)}">
		                	该活动的报名时间为[${activity.airtime} - ${activity.deadtime}],现在不是报名时间，或者报名已经结束了。
		                </c:when>
					 	<c:otherwise>
					 		<a href="<%=path%>/activity/goApplyActivity?id=${activity.id}">申请加入</a>
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
	<c:when test="${my:activityApplyDoneCount(activity) != 0 && activity.applyCount == 1}">
		<ol class="commentlist">
			<c:forEach items="${activity.activityApplys}" var="activityApply" >
				<c:if test="${activityApply.status == 2}">
					<li class="comment even thread-even depth-1" id="li-comment-204">
					<div id="comment-204">
		                <div class="comment-author fleft"><img src='<%=path%>/style/images/nobody.png' class='avatar avatar-60 photo' height='60' width='60' /></div>
		                <div class="comment-info fright">
		                    <div class="c_info">申请人：<a href="<%=path %>/student/viewStudent?id=${activityApply.student.id}">${activityApply.student.realName}</a></div>
		                    <p>审核状态：${activityApply.record }</p>
		                    <div class="reply fleft">
		                        <c:if test="${manager != null }">
		                        <c:choose>
		                            <c:when test="${activityApply.activityResult == null}">
		                                <a class='comment-reply-link' href="<%=path %>/activityResult/goAddActivityResult?id=${activityApply.id}">添加结果</a>
		                                </c:when>	
		                                <c:otherwise>
		                                <a class='comment-reply-link' href="<%=path %>/activityResult/goModifyActivityResult?id=${activityApply.activityResult.id}">查看结果</a>
		                            </c:otherwise>
		                        </c:choose>
		                        </c:if>
		                    </div>
		                </div>
		                <div class="clear"></div>
					</div>
					</li>
				</c:if>
			</c:forEach>
		</ol>
	</c:when>
</c:choose>

<c:choose>
	<c:when test="${my:activityApplyDoneCount(activity) != 0 && activity.applyCount != 1}">
		<h2 class="mainhead">已经有${my:activityApplyDoneCount(activity)}小组成功报名参加该活动</h2>
		<ol class="commentlist">
			<c:forEach items="${activity.activityApplys}" var="activityApply" >
				<c:if test="${activityApply.status == 2}">
					<li class="comment even thread-even depth-1" id="li-comment-204">
					<div id="comment-204">
						<div class="comment-author fleft"><img src='<%=path%>/style/images/nobody.png' class='avatar avatar-60 photo' height='60' width='60' /></div>
						<div class="comment-info fright">
							<div class="c_info"><a href="<%=path %>/group/viewGroup?id=${activityApply.group.id}">${activityApply.group.name}</a></div>
							<p>
								报名人数：${fn:length(activityApply.applicants)}，成员：
								<c:forEach items="${activityApply.applicants}" var="student" >
									<a href="<%=path %>/student/viewStudent?id=${student.id}">${student.realName}</a>|
								</c:forEach>
								<br/>审核状态：${activityApply.record }
							</p>
							<c:if test="${manager != null }">
								<c:choose>
								<c:when test="${activityApply.activityResult == null}">
									<div class="reply fleft">
									<a class='comment-reply-link' href="<%=path %>/activityResult/goAddActivityResult?id=${activityApply.id}">添加结果</a>
									</div>
								</c:when>	
								<c:otherwise>
									<div class="reply fleft">
									<a class='comment-reply-link' href="<%=path %>/activityResult/goModifyActivityResult?id=${activityApply.activityResult.id}">查看结果</a>
									</div>
								</c:otherwise>
								</c:choose>
							</c:if>
						</div>
						<div class="clear"></div>
					</div>
					</li>
				</c:if>
			</c:forEach>
		</ol>
	</c:when>
	<c:otherwise>
		<h2 class="mainhead">该活动暂时没有报名</h2>
	</c:otherwise>
</c:choose>
		
<!-- 管理员可见 -->
<c:choose>
	<c:when test="${manager != null }">
		<c:choose>
			<c:when test="${my:activityApplyCount(activity) != 0 && activity.applyCount == 1}">
			<h2 class="mainhead">有${my:activityApplyCount(activity)}个人申请报名该活动</h2>
			<ol class="commentlist">
				<c:forEach items="${activity.activityApplys}" var="activityApply" >
					<c:if test="${activityApply.status == 1}">
						<li class="comment even thread-even depth-1" id="li-comment-204">
						<div id="comment-204">
							<div class="comment-author fleft"><img src='<%=path%>/style/images/nobody.png' class='avatar avatar-60 photo' height='60' width='60' /></div>
								<div class="comment-info fright">
								<div class="c_info">申请人：<a href="<%=path %>/student/viewStudent?id=${activityApply.student.id}">${activityApply.student.realName}</a></div>
								<p>审核状态：${activityApply.record }</p>
									<div class="reply fleft">
										<a class='comment-reply-link' href="<%=path %>/activity/passApplyActivity?id=${activityApply.id}">通过</a> | 
										<a class='comment-reply-link' href="<%=path %>/activity/refuseApplyActivity?id=${activityApply.id}">拒绝</a>
									</div>
								</div>
							<div class="clear"></div>
						</div>
						</li>
					</c:if>
				</c:forEach>
			</ol>
		</c:when>
		
		<c:when test="${my:activityApplyCount(activity) != 0 && activity.applyCount != 1}">
		<h2 class="mainhead">有${my:activityApplyCount(activity)}个小组申请报名该活动</h2>
			<ol class="commentlist">
				<c:forEach items="${activity.activityApplys}" var="activityApply" >
					<c:if test="${activityApply.status == 1}">
						<li class="comment even thread-even depth-1" id="li-comment-204">
						<div id="comment-204">
                               <div class="comment-author fleft"><img src='<%=path%>/style/images/nobody.png' class='avatar avatar-60 photo' height='60' width='60' /></div>
                               <div class="comment-info fright">
                                   <div class="c_info">小组名称：<a href="<%=path %>/group/viewGroup?id=${activityApply.group.id}">${activityApply.group.name}</a></div>
                                   <p>
									报名人数：${fn:length(activityApply.applicants)}，成员：
		                            <c:forEach items="${activityApply.applicants}" var="student" >
										<a href="<%=path %>/student/viewStudent?id=${student.id}">${student.realName}</a>|
									</c:forEach>
									<br/>审核状态：${activityApply.record }
                                   </p>
                                   <div class="reply fleft">
										<a class='comment-reply-link' href="<%=path %>/activity/passApplyActivity?id=${activityApply.id}">通过</a> | 
										<a class='comment-reply-link' href="<%=path %>/activity/refuseApplyActivity?id=${activityApply.id}">拒绝</a>
                                   </div>
                               </div>
                               <div class="clear"></div>
						</div>
						</li>
					</c:if>
				</c:forEach>
			</ol>
		</c:when>
	 	<c:otherwise>该活动暂时没有报名</c:otherwise>
	 	
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
