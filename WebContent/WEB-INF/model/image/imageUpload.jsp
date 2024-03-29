<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
%>
<script type="text/javascript" src="<%=path%>/content/js/jquery-1.4.2.min.js"></script>

<!-- JQuery 图片选择 插件 -->
<link type="text/css" rel="stylesheet" href="<%=path%>/content/jq-imgareaselect/css/imgareaselect-animated.css" />
<script type="text/javascript" src="<%=path%>/content/jq-imgareaselect/jquery.imgareaselect.min.js"></script>

<!-- JQuery 上传插件 -->
<link type="text/css" rel="stylesheet" href="<%=path%>/content/jq-ajaxupload/ajaxupload.css" />
<script type="text/javascript" src="<%=path%>/content/jq-ajaxupload/ajaxupload.js"></script>

<!-- 验证插件 -->
<link type="text/css" rel="stylesheet" href="<%=path%>/content/jq-validate/jquery.validationEngine.css" />
<script type="text/javascript" src="<%=path%>/content/jq-validate/jquery.validationEngine-cn.js"></script>
<script type="text/javascript" src="<%=path%>/content/jq-validate/jquery.validationEngine.js"></script>

<!--[if IE]> 
		<script type="text/javascript" src="<%=path%>/content/jq-highcharts/highcharts-ie.js"></script> 
<![endif]-->

<script type="text/javascript">

//验证事件
function validate() {
	$("form[rel='validate']").validationEngine();
}

$(document).ready(function() {
	var button = $('#button'), interval;
	new AjaxUpload(button,{
		action: '<%=path%>/image/imageUpload', 
		data:{
            'cutWidth':${cutWidth},
            'cutHeight':${cutHeight}
        },
		name: 'files',
		onSubmit : function(file, ext){
			
            if (! (ext && /^(jpg|png|jpeg|gif)$/i.test(ext))){
                alert('不允许的文件格式！');
                return false;
       		}
      		 
			button.text('正在上传');
			
			this.disable();
			
			// Uploding -> Uploading. -> Uploading...
			interval = window.setInterval(function(){
				var text = button.text();
				if (text.length < 13){
					button.text(text + '.');
				} else {
					button.text('正在上传');	
				}
			}, 200);
		},
		onComplete: function(file, response){
			$('#dialogbox').html(response);
			validate();
		}
	});

});
</script>
<div id="dialogbox">
	<h2 class="caption">上传图片：</h2>
	<div id="button" class="button">上传</div> 
</div>
