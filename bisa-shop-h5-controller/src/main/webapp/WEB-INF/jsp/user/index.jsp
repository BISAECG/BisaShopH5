<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="/favicon/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="/favicon/favicon.ico" type="image/x-icon" />
<link rel="bookmark" href="/favicon/favicon.ico" type="image/x-icon" />
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="initial-scale=0.35,user-scalable=yes">
<!-- necessary -->
    <title><spring:message code="admin.domain"/></title>
    <meta name="keywords" content="<spring:message code="admin.keyword"/>">
    <meta name="description" content="<spring:message code="admin.description"/>">
<!-- description -->
<meta name="renderer" content="webkit">
<!-- base -->
<link rel="stylesheet" href="/resources/ctrl/layui/css/layui.css">
<link href="/resources/ctrl/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/comm/base.css" rel="stylesheet">
<link href="/resources/css/user/user_center.css" rel="stylesheet">
<!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<script src="/resources/js/comm/jquery.min.js"></script>
<script src="/resources/ctrl/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="/resources/ctrl/layer/layer.js"></script>

</head>

<body>
	<div id="header"></div>
	<script>
		$("#header").load("header.html");
	</script>
	<div class="wrap clear">

		<div class="clear full-ws">
			<img class="full-w"
				src="/resources/img/user/User/userCenter-banner.jpg" alt="">
			<p class="full-w-p"><spring:message code='7004' /></p>
			<p class="full-w-p-1"></p>
			<p class="full-w-p-2"></p>
		</div>
		<div class="container pl-0 pr-0 mt-30 clear bg-f5f5f5 pt-30 pb-70 mb-60">
			<!-- 左边导航条 -->
			<div class="col-sm-3 pl-30 pr-20">
				<div class="clear bg-white pd-40-10-ipad">
					<p class="mt-10 mb-10 col-212121 f-30 line-h-40 cur-d">
						<spring:message code='7004' />
					</p>
					<a class="col-757575 f-20-16-ipad line-h-25 mt-40 mb-20 cur-p hovecol-309DE2 user-munu user-order" href="/html/${language}/user_order" target="mainFrame">
						<spring:message code='7005' />
					</a>
			<%-- 		<p
						class="col-757575 f-20-16-ipad line-h-25 mt-20 mb-20 cur-p hovecol-309DE2 user-munu user-active"
						onclick="window.location.href='/html/${language}/user_card';">
						我的地址
					</p> --%>
					<p class="mt-10 mb-10 col-212121 f-30 line-h-40 cur-d">
						<spring:message code='7006' />
					</p>
				<%-- 	<p
						class="col-757575 f-20-16-ipad line-h-25 mt-20 mb-20 cur-p hovecol-309DE2 user-munu user-center"
						onclick="window.location.href='/html/${language}/user_center';">
						我的服务
					</p> --%>
					
					<a
						class="col-757575 f-20-16-ipad line-h-25 mt-20 mb-20 cur-p hovecol-309DE2 user-munu user-address" href="/html/${language}/user_card" target="mainFrame">
						<spring:message code='7007' />
					</a>
				
					<%--  <p class="col-757575 f-20-16-ipad line-h-25 mt-20 mb-20 cur-p hovecol-309DE2 user-munu user-saleApply">
					售后服务
                </p> --%>
				</div>
			</div>
			<!-- 左边导航条 END -->
			<div class="clear col-sm-9 pr-30 pl-0">
				<iframe id="mainFrame" name="mainFrame" width='100%' height='800px' src="/html/${language}/user_order" frameborder='0'scrolling="no"></iframe>
			</div>
		</div>
	</div>
	<div id="footer"></div>
	<script>
		$("#footer").load("footer.html");
	</script>


</body>
</html>