<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="provider" content="ESBuilder Platform;">
<title><spring:message code="admin.domain" /></title>
<meta name="keywords" content="<spring:message code="admin.keyword" />">
<meta name="description" content="<spring:message code="admin.description" />">
<meta name="revisit-after" content="1 days">
<meta name="twcClient" content="false" id="twcClient">

<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/ctrl/layer/mobile/need/layer.css" media="all">
<script src="<%=request.getContextPath() %>/resources/js/comm/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/ctrl/layer/mobile/layer.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		var ua = navigator.userAgent.toLowerCase();
		// 是否在 webview
		var inWebview = '';
		if (inWebview) {
			canIntent = false;
		}
		var noIntentTest = /aliapp|360 aphone|weibo|windvane|ucbrowser|baidubrowser/.test(ua);
		var hasIntentTest = /chrome|samsung/.test(ua);
		var specialTest = /samsung|xiaomi|oppo/.test(ua);
		var isAndroid = /android|adr/.test(ua) && !(/windows phone/.test(ua));
		var canIntent = !noIntentTest && hasIntentTest && isAndroid;
		var openInIfr = /weibo|m353/.test(ua);
		var inWeibo = ua.indexOf('weibo') > -1;
		var isWeixin = ua.match(/MicroMessenger/i) == "micromessenger";
		var isIphone = ua.match(/(Iphone|iPod|iPad);?/i);
		
		// 微信扫描二维码
		if (isWeixin){
			if (isIphone){
				var iphonehtml = '<div style="width:100%;height:100%;background: url(<%=request.getContextPath() %>/resources/img/app/apple_.png) no-repeat top left; background-size: 100% 100%;"></div>';
				$("#PhoneType").html(iphonehtml);
			}
			if (isAndroid){
				var Androidhtml = '<div style="width:100%;height:100%;background: url(<%=request.getContextPath() %>/resources/img/app/android_.png) no-repeat top left; background-size: 100% 100%;"></div>';
				$("#PhoneType").html(Androidhtml);
			}
		 }else{
			
			if(isIphone||isAndroid){
	           window.location.href = "https://shop194684580.taobao.com/?spm=a230r.7195193.1997079397.2.6815114b089AGi";	        
			}
			
		} 
	});
</script>
</head>
<body class="normal-app">
	<div id="content">
		<div id="PhoneType">
			 
			
		</div>
		
	</div>
	</body>

</html>