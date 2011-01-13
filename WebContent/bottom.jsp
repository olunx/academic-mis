<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
  <!-- TemplateEndEditable -->
  <!--主内容区 结束-->
  <br class="clear">
</div><!-- end of #wrapper -->

<!--底部 开始-->
<div id="footer">
  <div class="container">
    <div class="ftext fleft">&copy; 2011 广东药学院 版权所有</div>
    <div class="fcred fright"> <span class="fleft">3C团队 作品</span></div>
  </div>
  <div class="clear"></div>
</div>
<!--底部 结束-->
<script language="javascript" type="text/javascript" src="<%=path %>/style/js/tab.js"></script>
<script language="javascript" type="text/javascript" src="<%=path %>/style/js/jquery.fieldtag.min.js"></script>
<script type="text/javascript"> 
	jQuery(function($){
	    //snip
		$("input,#comment,#s").fieldtag();
	    //snap
	});
</script>
</body>
</html>