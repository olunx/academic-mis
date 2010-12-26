<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="<%=path%>/content/images/style.css" />

<script type="text/javascript" src="<%=path%>/content/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/content/js/jquery-easing-1.3.pack.js"></script>
<script type="text/javascript" src="<%=path%>/content/js/jquery-easing-compatibility.1.2.pack.js"></script>
<script type="text/javascript" src="<%=path%>/content/js/coda-slider.1.1.1.pack.js"></script>

<script type="text/javascript">

	var theInt = null;
	var $crosslink, $navthumb;
	var curclicked = 0;
	
	theInterval = function(cur){
		clearInterval(theInt);
		
		if( typeof cur != 'undefined' )
			curclicked = cur;
		
		$crosslink.removeClass("active-thumb");
		$navthumb.eq(curclicked).parent().addClass("active-thumb");
			$(".stripNav ul li a").eq(curclicked).trigger('click');
		
		theInt = setInterval(function(){
			$crosslink.removeClass("active-thumb");
			$navthumb.eq(curclicked).parent().addClass("active-thumb");
			$(".stripNav ul li a").eq(curclicked).trigger('click');
			curclicked++;
			if( 6 == curclicked )
				curclicked = 0;
			
		}, 3000);
	};
	
	$(function(){
		
		$("#main-photo-slider").codaSlider();
		
		$navthumb = $(".nav-thumb");
		$crosslink = $(".cross-link");
		
		$navthumb
		.click(function() {
			var $this = $(this);
			theInterval($this.parent().attr('href').slice(1) - 1);
			return false;
		});
		
		theInterval();
	});
</script>

</head>
<body>
	<form action="login" method="POST">
		账号<input type="text" name="loginDto.username">
		密码<input type="password" name="loginDto.password">
		<select name="loginDto.loginType" size="1">
			<option value="0" selected="selected">学生</option>
			<option value="1">教师</option>
			<option value="2">助理</option>
		</select>
		<input type="submit" value="登陆"> <a href="student/goAddStudent">学生注册</a>|<a href="teacher/goAddTeacher">老师注册</a>
	</form>
	
	
	<div id="page-wrap">
	<div class="slider-wrap">
		<c:choose>
		<c:when test="${nhs == null}">
		<div id="main-photo-slider" class="csw">
			<div class="panelContainer">
				<div class="panel" title="Panel 1">
					<div class="wrapper">
						<a href="http://www.baidu.com"><img src="<%=path%>/content/images/slider/tempphoto-1.jpg" alt="temp"  border=0 /></a>
						<div class="photo-meta-data">
							<span>"Free Tibet" Protest at the Olympic Torch Rally</span><br />
							Photo Credit: <a href="http://flickr.com/photos/astrolondon/2396265240/">Kaustav Bhattacharya</a>
						</div>
					</div>
				</div>
				<div class="panel" title="Panel 2">
					<div class="wrapper">
						<a href="www.baidu.com"><img src="<%=path%>/content/images/slider/tempphoto-2.jpg" alt="temp" /></a>
						<div class="photo-meta-data">
							<span>Fifth field goal, overtime win for the Seahawks</span><br />
							Chicago Bears at Seattle Seahawks
						</div>
					</div>
				</div>		
				
			</div>
		</div>

		<a href="#1" class="cross-link active-thumb"><img src="<%=path%>/content/images/slider/tempphoto-1thumb.jpg" class="nav-thumb" alt="temp-thumb" /></a>
		<div id="movers-row">
			<div><a href="#2" class="cross-link"><img src="<%=path%>/content/images/slider/tempphoto-2thumb.jpg" class="nav-thumb" alt="temp-thumb" /></a></div>
		</div>
		</c:when>
		<c:otherwise>
		<div id="main-photo-slider" class="csw">
			<div class="panelContainer">
				<c:forEach items="${nhs}" var="noticeHot" varStatus="i">
					<div class="panel">
						<div class="wrapper">
							<a href="<%=path%>/notice/viewNotice?id=${noticeHot.notice.id}"><img src="<%=path%>${noticeHot.image.bigFileUrl}" alt="temp"  border=0 width="419" /></a>
							<div class="photo-meta-data">
								 <a href="<%=path%>/notice/viewNotice?id=${noticeHot.notice.id}"><span>${noticeHot.notice.title }</span></a><br/>
								${noticeHot.notice.author.realName } : ${noticeHot.notice.time }
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
			<a href="#1" class="cross-link active-thumb"><img src="<%=path%>${nhs[0].image.minFileUrl}" class="nav-thumb" alt="temp-thumb" /></a>
			<div id="movers-row">
			<c:forEach items="${nhs}" var="noticeHot" varStatus="i">
			<c:choose>
				<c:when test="${i.count == 1}">
				</c:when>
				<c:otherwise>
					
						<div><a href="#${i.count }" class="cross-link"><img src="<%=path%>${noticeHot.image.minFileUrl}" class="nav-thumb" alt="temp-thumb" /></a></div>
				</c:otherwise>
			</c:choose>
			</c:forEach>
			</div>
		</c:otherwise>
		</c:choose>
	</div>
	</div>
</body>
</html>