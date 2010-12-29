<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/top.jsp"></jsp:include>
  <!-- Content Starts -->
  <div id="content" class="wrap">
  
 	<!-- 左边栏 -->
    <div class="col-left">
      <div id="featured">
      	欢迎您${student.realName}<br />
      </div><!-- featured ends -->
    </div><!-- .col-left ends -->
    
    <!-- 右边栏 -->
    <div class="col-right">
      <div id="main">
      </div><!-- main ends -->
    </div><!-- .col-right ends -->
  </div> <!-- Content Ends -->
  
<jsp:include page="/bottom.jsp"></jsp:include>