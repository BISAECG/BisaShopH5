<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="provider" content="ESBuilder Platform;">
<meta name="description" content="悉心康健">
<meta name="keywords" content="碧沙康健,悉心康健,PECG ">
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
			
			if(isIphone){
				var loadDateTime = new Date();  
				  window.setTimeout(function() {  
				   var timeOutDateTime = new Date();  
				   if (timeOutDateTime - loadDateTime < 5000) {  
				    window.location = "https://itunes.apple.com/cn/app/id1309450042?mt=8";  
				   } else {  
				    window.close();  
				   }  
				  },  
				  25);  
				  window.location = "smarthealthcare://www.bisahealth.com/camera?deviceSn=${deviceid}";  
			}else if(isAndroid){
				
				window.location.href = "xixin://www.bisahealth.com/camera?deviceSn=${deviceid}";
		          setTimeout(function(){
		                    window.location.href = "<%=request.getContextPath() %>/app/android";
		          },2000)
			
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