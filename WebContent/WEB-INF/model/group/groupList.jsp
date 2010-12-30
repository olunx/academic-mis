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
      	
<div id="comments">
<!-- You can start editing here. -->
<div id="comments_wrap">
	<h2>我加入的小组</h2>
	<ol class="commentlist">
		<li class="comment wrap">
		    <div class="comment wrap">
		        <div class="col-left">
		            <img alt="" src="<%=path %>/style/js/images/pic.jpeg" class="avatar avatar-80 photo" height="80" width="80">
		            <p>小组名称<br></p>
		            <p>创建时间日期<br></p>
		        </div>
		        <div class="col-right">
		            <p>小组简介</p>
		        </div>
		     	<div class="reply"><a rel="nofollow" class="comment-reply-link" href="#" >查看详情</a></div>        
		    </div>
			<div class="fix"></div>
		</li>
	</ol>    
	<div class="navigation">
		<div class="alignleft"></div>
		<div class="alignright"></div>
		<div class="fix"></div>
	</div>
	<br>
</div> <!-- end #comments_wrap -->
</div><!-- end #comments -->

<div id="comments">
<!-- You can start editing here. -->
<div id="comments_wrap">
	<h3>我加入的小组</h3>
	<ol class="commentlist">
		<li class="comment wrap">
		    <div class="comment wrap">
		        <div class="col-left">
		            <img alt="" src="<%=path %>/style/js/images/pic.jpeg" class="avatar avatar-80 photo" height="80" width="80">
		            <p>小组名称<br></p>
		            <p>创建时间日期<br></p>
		        </div>
		        <div class="col-right">
		            <p>小组简介</p>
		        </div>
		     	<div class="reply"><a rel="nofollow" class="comment-reply-link" href="#" >查看详情</a></div>        
		    </div>
			<div class="fix"></div>
		</li>
	</ol>    
	<div class="navigation">
		<div class="alignleft"></div>
		<div class="alignright"></div>
		<div class="fix"></div>
	</div>
	<br>
</div> <!-- end #comments_wrap -->
</div><!-- end #comments -->

      </div><!-- featured ends -->
    </div><!-- .col-left ends -->
    
    <!-- 右边栏 -->
    <div class="col-right">
      <div id="main">
      
<div id="comments">
<!-- You can start editing here. -->
<div id="comments_wrap">
	<h2>所有的小组</h2>
	<ol class="commentlist">
		<li class="comment wrap">
		    <div class="comment wrap">
		        <div class="col-left">
		            <img alt="" src="<%=path %>/style/js/images/pic.jpeg" class="avatar avatar-80 photo" height="80" width="80">
		            <p>小组名称<br></p>
		            <p>创建时间日期<br></p>
		        </div>
		        <div class="col-right">
		            <p>小组简介</p>
		        </div>
		     	<div class="reply"><a rel="nofollow" class="comment-reply-link" href="#" >查看详情</a></div>        
		    </div>
			<div class="fix"></div>
		</li>
	</ol>    
	<div class="navigation">
		<div class="alignleft"></div>
		<div class="alignright"></div>
		<div class="fix"></div>
	</div>
	<br>
</div> <!-- end #comments_wrap -->
</div><!-- end #comments -->

      </div><!-- main ends -->
    </div><!-- .col-right ends -->
    
  </div> <!-- Content Ends -->
<jsp:include page="/bottom.jsp"></jsp:include>