<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="Images/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="Images/favicon.ico" type="image/x-icon" />
<link rel="bookmark" href="Images/favicon.ico" type="image/x-icon" />
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="initial-scale=0.35,user-scalable=yes">
<!-- necessary -->
    <title><spring:message code="admin.domain"/></title>
    <meta name="keywords" content="<spring:message code="admin.domain"/>">
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
<script src="/resources/js/comm/base.js"></script>
<script src="/resources/js/comm/menu.js"></script>

</head>

<body>
	<div id="header"></div>
	<script>
		$("#header").load("header.html");
	</script>
	<div class="wrap clear">
		<div class="container pl-0 pr-0">
			<div class="clear">
				<p class="pt-10 pb-10 pl-15 pr-15 line-h-20 cur-d ">
					<a class="col-666 t-nonehove hovecol-309DE2" href="/index"></a> > <span
						class="col-252525 t-nonehove"></span>
				</p>
			</div>
		</div>

		<div class="clear full-ws">
			<img class="full-w"
				src="/resources/img/user/User/userCenter-banner.jpg" alt="">
			<p class="full-w-p">用户中心</p>
			<p class="full-w-p-1"></p>
			<p class="full-w-p-2"></p>
		</div>
		<div class="container pl-0 pr-0 mt-30 clear bg-f5f5f5 pt-30 pb-70 mb-60">
			<!-- 左边导航条 -->
			<div class="col-sm-3 pl-30 pr-20">
				<div class="clear bg-white pd-40-10-ipad">
					<p class="mt-10 mb-10 col-212121 f-30 line-h-40 cur-d">
						<spring:message code="name28" />
					</p>
					<p
						class="col-757575 f-20-16-ipad line-h-25 mt-40 mb-20 cur-p hovecol-309DE2 user-munu user-order"
						onclick="window.location.href='/html/${language}/user_order';">
						<spring:message code="name29" />
					</p>
			
					<p class="mt-30 mb-30 col-212121 f-30 line-h-40 cur-d">
						<spring:message code="name30" />
					</p>
					<p
						class="col-757575 f-20-16-ipad line-h-25 mt-20 mb-20 cur-p hovecol-309DE2 user-munu user-center"
						onclick="window.location.href='/html/${language}/user_center';">
						<spring:message code="name31" />
					</p>
					<p
						class="col-757575 f-20-16-ipad line-h-25 mt-20 mb-20 cur-p hovecol-309DE2 user-munu user-active"
						onclick="window.location.href='/html/${language}/user_card';">
						<spring:message code="name32" />
					</p>
					<p
						class="col-757575 f-20-16-ipad line-h-25 mt-20 mb-20 cur-p hovecol-309DE2 user-munu user-address"
						onclick="window.location.href='/html/${language}/user_address';">
						<spring:message code="name33" />
					</p>
					<p
						class="col-757575 f-20-16-ipad line-h-25 mt-20 mb-20 cur-p hovecol-309DE2 user-munu user-password"
						onclick="window.location.href='/html/${language}/user_security';">
						<spring:message code="name34" />
					</p>
					<%--  <p class="col-757575 f-20-16-ipad line-h-25 mt-20 mb-20 cur-p hovecol-309DE2 user-munu user-saleApply">
					售后服务
                </p> --%>
				</div>
			</div>
			<!-- 左边导航条 END -->
			<div class="clear col-sm-9 pr-30 pl-0">
				<iframe id="mainFrame" name="mainFrame" width='100%' height='800px'onload="iframeLoad()" src="/html/${language}/user_main" frameborder='0'scrolling="no"></iframe>
			</div>
		</div>
	</div>
	<div id="footer"></div>
	<script>
		$("#footer").load("footer.html");
	</script>

	<!-- =================选择头像弹出层======================= -->
	<div
		class="clear show-selhead affix t-0 l-0 z-999 full-wh rgba-60 dis-n">
		<div class="pos-a t-150 l-0 full-w">
			<div
				class="w-900 mg-0-auto clear pos-r bg-white selhead-content radius-5 t--300 modal-content">
				<div
					class="pt-10 pb-10 line-h-25 pos-r f-20 pl-20 pr-20 col-333 full-w radius-5 cur-d">
					<spring:message code="name580" />
					<img class="pos-a t-10 r-20 img-20 close-mod cur-p" id="img_close"
						src="/resources/img/user/User/close.png" alt="">
				</div>
				<div class="clear bor bor-t bor-col-f2 pd-20">
					<div
						class="clear col-sm-9 h-364 bg-fcfcfc box-sha-inset-big pos-r pl-0 pr-0 overflow-h">
						<div class="clear " style="width: 643px; height: 364px;">
							<img id="show-main-img" class="max-w-100p"
								src="/resources/img/user/User/user-head-portrait.jpg">
						</div>
					</div>
					<div class="clear col-sm-3">
						<div class="clear">
							<img id="show-little-imgv1" class="img-184 img-thumbnail" src=""
								alt="">
						</div>
						<div class="clear mt-15">
							<img id="show-little-imgv2"
								class="img-184 img-thumbnail full-radius" src="" alt="">
						</div>
					</div>
					<div class="clear col-sm-12 pl-0 pr-0 mt-30 mb-10">
						<div class="clear col-sm-9 btn-toolbar" role="toolbar">
							<div class="btn-group pull-left col-sm-2" role="group">
								<span class="btn btn-success pos-r cur-p"> <input
									type="file" id="sel-file"
									class="opacity-0 pos-a t-0 l-0 full-wh cur-p">
								<spring:message code="name581" />
								</span>
							</div>
							<div class="btn-group pull-left col-sm-3" role="group">
								<button type="button" class="btn btn-success cro-btn-reset">
									<spring:message code="name582" />
								</button>
							</div>
							<div class="btn-group pull-left pull-right" role="group">
								<button type="button" class="btn btn-success cro-btn-big">
									<spring:message code="name583" />
								</button>
								<button type="button" class="btn btn-success cro-btn-small">
									<spring:message code="name584" />
								</button>
								<button type="button" class="btn btn-success cro-btn-left">
									<spring:message code="name585" />
								</button>
								<button type="button" class="btn btn-success cro-btn-right">
									<spring:message code="name586" />
								</button>
							</div>
						</div>
						<div class="clear col-sm-3">
							<button class="btn full-w btn-success cro-btn-submit">
								<spring:message code="name587" />
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>