<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN">
<head>
<link rel="icon" href="/favicon/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="/favicon/favicon.ico" type="image/x-icon" />
<link rel="bookmark" href="/favicon/favicon.ico" type="image/x-icon" />

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=0.3, maximum-scale=1">
<!-- necessary -->
<title><spring:message code="admin.domain" /></title>
<meta name="keywords" content="<spring:message code="admin.keyword" />">
<meta name="description" content="<spring:message code="admin.description" />">
<!-- description -->
<meta name="renderer" content="webkit">
<!-- base -->
<link href="/resources/ctrl/layui/css/layui.css" rel="stylesheet">
<link href="/resources/css/comm/base.css" rel="stylesheet">
<link href="/resources/css/admin/style.css" rel="stylesheet">
	<style type="text/css">
		.frame-body {
		    position: absolute;
		    left: 0;
		    right: 0;
		    top: 60px;
		    bottom: 0;
		    width: auto;
		    overflow: hidden;
		    overflow-y: auto;
		    box-sizing: border-box;
		}
	</style>
<!--[if lt IE 9]>
	<style type="text/css">
		.div-full{
			height:1000px;
		}
	</style>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<script src="/resources/js/comm/jquery.min.js"></script>
<script src="/resources/ctrl/layui/layui.js"></script>
<script type="text/javascript" language="javascript">
	//自动调整iframe高度	
	var iframeCount = 0;
	var interval = null;
	var maxCount = 5;
	function reinitIframe() {
		iframeCount++;
		var wHeight=window.screen.height;
		var iframe = document.getElementById("mainFrame");
		try {
		
			var bHeight = iframe.contentWindow.document.body.scrollHeight;
			var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
			var height = Math.max(bHeight, dHeight);
			if(height<wHeight){
				iframe.height = wHeight;
			}else{
				iframe.height = height;
			}
		
		} catch (ex) {
		}

		if (iframeCount > maxCount && interval != null) {
			if(height<wHeight){
				iframe.height = wHeight;
			}else{
				iframe.height = height;
			}
			clearInterval(interval);
		}
	}
	function iframeLoad() {
		if (interval != null) {
			clearInterval(interval);
		}
		iframeCount = 0;
		interval = window.setInterval("reinitIframe()", 500);

	}

	layui.use('element', function() {

	});
</script>
</head>

<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">

		<!-- 头部导航部分 -->
		<%@ include file="common/header.jsp"%>
		<!-- 主体文件 -->
			<div class="frame-body">
				<iframe id="mainFrame" name="mainFrame" width='100%' height='100%' onload="iframeLoad()"  src="/admin/main" frameborder='0' scrolling="no"></iframe>
			</div>
		<!-- 底部固定区域 -->
		<%@ include file="common/fooder.jsp"%>

	</div>

</body>
</html>