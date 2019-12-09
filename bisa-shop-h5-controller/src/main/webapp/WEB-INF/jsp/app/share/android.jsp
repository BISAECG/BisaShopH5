<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
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
	<style type="text/css">
		a {
		    vertical-align: top;
		    margin: 0 5px 10px 0;
		    height: 36px;
		    line-height: 36px;
		    border-radius: 3px;
		    padding: 0 30px;
		    background-color: #e3e3e3;
		    color: #fff;
		    border: none;
		    text-decoration: none;
		    color: #0099cc;
			text-align: center;
			display: inline-block;
		}
		
		.package{
			text-align: center;
			width:100%;
			position:fixed;
			bottom:50px;
		}
	
	</style>
<script type="text/javascript">
	$(document).ready(function(){
		
		var ua = navigator.userAgent.toLowerCase();
		// æ¯å¦å¨ webview
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
		var isIphone = ua.match(/(iPhone|iPod|iPad);?/i);
		console.log(isWeixin);
		if (isAndroid){
			$("#PhoneType").show();
		}
	});
</script>
</head>
<body class="normal-app">
	<div id="content">
		<div id="PhoneType">
			<div  style="width:100%;height:100%;background: url(<%=request.getContextPath() %>/resources/img/app/run_main.png) no-repeat top left; background-size: 100% 100%;">
				<div class="package"><a class="downa" href="${app.appUrl}" target="_blank">Android客户端下载</a></div>
			</div>
		</div>
	</div>
	</body>

</html>