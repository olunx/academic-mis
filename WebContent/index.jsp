<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
%>
<jsp:include page="/top.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="<%=path%>/content/images/style.css" />
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
    
    <div id="news">
    	<div id="hot">
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
									<a href="<%=path%>/notice/viewNotice?id=${noticeHot.notice.id}"><img src="<%=path%>${noticeHot.image.bigFileUrl}" alt="temp"  border=0 width="375px" /></a>
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
        </div><!-- end of hot-->
        <div id="notice">
        	<h2 class="title">最新公告</h2><hr class="title"/>
            <ul class="notice">
            	<li><a href="#">公告1</a></li>
                <li><a href="#">公告2</a></li>
                <li><a href="#">公告3</a></li>
                <li><a href="#">公告4</a></li>
                <li><a href="#">公告5</a></li>
                <li><a href="#">公告6</a></li>
                <li><a href="#">公告7</a></li>
                <li><a href="#">公告8</a></li>
            </ul>
        </div><!-- end of notice-->
        <div class="activestu">
       		<h2 class="title">活跃学生</h2><hr class="title" />
            <ul class="notice">
            	<li><a href="#">标题1</a></li>
                <li><a href="#">标题2</a></li>
                <li><a href="#">标题3</a></li>
                <li><a href="#">标题4</a></li>
                <li><a href="#">标题5</a></li>
                <li><a href="#">标题6</a></li>
                <li><a href="#">标题7</a></li>
                <li><a href="#">标题8</a></li>
                <li><a href="#">标题9</a></li>
                <li><a href="#">标题10</a></li>
            </ul>
        </div>
    </div><!-- end of news-->
    
    <div id="camp">
    	<div class="third">
        	<h2 class="title">名师课题<a href="<%=path %>/subject/listSubject">[更多]</a></h2><hr class="title" />
            <ul class="notice">
            	<li><a href="#">标题1</a></li>
                <li><a href="#">标题2</a></li>
                <li><a href="#">标题3</a></li>
                <li><a href="#">标题4</a></li>
                <li><a href="#">标题5</a></li>
                <li><a href="#">标题6</a></li>
                <li><a href="#">标题7</a></li>
                <li><a href="#">标题8</a></li>
            </ul>
        </div>
        <div class="third">
        	<h2 class="title">外包课题</h2><hr class="title" />
            <ul class="notice">
            	<li><a href="#">标题1</a></li>
                <li><a href="#">标题2</a></li>
                <li><a href="#">标题3</a></li>
                <li><a href="#">标题4</a></li>
                <li><a href="#">标题5</a></li>
                <li><a href="#">标题6</a></li>
                <li><a href="#">标题7</a></li>
                <li><a href="#">标题8</a></li>
            </ul>
        </div>
        <div class="third">
       		<h2 class="title">比赛项目</h2><hr class="title" />
            <ul class="notice">
            	<li><a href="#">标题1</a></li>
                <li><a href="#">标题2</a></li>
                <li><a href="#">标题3</a></li>
                <li><a href="#">标题4</a></li>
                <li><a href="#">标题5</a></li>
                <li><a href="#">标题6</a></li>
                <li><a href="#">标题7</a></li>
                <li><a href="#">标题8</a></li>
            </ul>
        </div>
    </div><!-- end of camp-->
    
    <script type="text/javascript" src="<%=path%>/style/js/jMyCarousel.min.js"></script>
  	<script type="text/javascript">
		$(function() {
		    $(".projects").jMyCarousel({
		        visible: '7',
		        eltByElt: true,
				auto: true,
				speed: 5000,
		        evtStart: 'mousedown',
		        evtStop: 'mouseup'
		    });
		});
	</script>
	<div id="works">
    	<h2 class="title">作品展示<a href="<%=path %>/opus/listOpus">[更多]</a></h2><hr class="title"/>
        <div class="projects" >
            <ul>
                <li>
	                <a href="http://www.enova-tech.net/img/posts/lab/jmycarousel/1.jpg" title="作品1">
	                <img src="http://www.enova-tech.net/img/posts/lab/jmycarousel/1_s.jpg"></a>
                </li>
                <li>
	                <a href="http://www.enova-tech.net/img/posts/lab/jmycarousel/3.jpg" title="作品2">
	                <img src="http://www.enova-tech.net/img/posts/lab/jmycarousel/3_s.jpg"></a>
                </li>
                <li>
	                <a href="http://www.enova-tech.net/img/posts/lab/jmycarousel/4.jpg" title="作品3">
	                <img src="http://www.enova-tech.net/img/posts/lab/jmycarousel/4_s.jpg"></a>
                </li>
                <li>
					<a href="http://www.enova-tech.net/img/posts/lab/jmycarousel/4.jpg" title="作品3">
					<img src="http://www.enova-tech.net/img/posts/lab/jmycarousel/4_s.jpg"></a>
                </li>
                <li>
	                <a href="http://www.enova-tech.net/img/posts/lab/jmycarousel/4.jpg" title="作品3">
	                <img src="http://www.enova-tech.net/img/posts/lab/jmycarousel/4_s.jpg"></a>
                </li>
            </ul>
        </div><!-- end of projects-->
    </div><!-- end of works-->

  <!-- TemplateEndEditable -->
  <!--主内容区 结束-->
  <br class="clear">
</div><!-- end of #wrapper -->

<!--底部 开始-->
<div id="footer">
  <div class="container">
    <div class="ftext fleft">&copy; 2011 广东药学院 版权所有</div>
    <div class="fcred fright"> <span class="fright">3C团队 作品</span></div>
  </div>
  <div class="clear"></div>
</div>
</body>
</html>