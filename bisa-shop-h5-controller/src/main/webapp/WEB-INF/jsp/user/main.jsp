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

	<div class="clear col-sm-9 pr-30 pl-0">
		<div class="clear bg-white pb-100 plr-50-10-ipad pt-40">
			<div class="clear">
				<!--   用户头像 -->
				<div class="clear col-sm-3 pl-0 pr-0">
					<div class="clear pull-left w-120">
						<img
							class="img-120 overflow-h full-radius bor bor-3px bor-col-fff box-sha-imgsha user-avator"
							src="/resources/img/default_header/userico_avatar.png" alt="">
						<p class="text-center cur-p line-h-40 f-20 col-309DE2 set-heads">
						</p>
					</div>
				</div>
				<div class="clear col-sm-9 pl-0 pr-0">
					<!-- 用户名 -->
					<p class="line-h-40 f-28 col-616161">
						<!--  <shiro:principal/> -->
					</p>
					<!-- 问候 -->
					<p class="line-h-40 f-22 col-b0b0b0"></p>
					<!-- 前往报告中心 -->
					<p class="line-h-40 f-20 col-757575"></p>
				</div>
				<div class="clear col-sm-12 mt-40 bor bor-t bor-col-e0e0e0"></div>
			</div>

			<!-- =================订单及激活服务 统计数据  快捷入口======================= -->
			<div class="clear pt-40 pl-0 pr-0">
				<div class="clear col-sm-6 pl-0 pr-0 pt-40 pb-40">
					<div class="clear col-sm-5 pl-0 pr-0 text-center">
						<img class="img-110 overflow-h full-radius"
							src="/resources/img/user/User/center-tipsv1.png" alt="">
					</div>
					<div class="clear col-sm-7 pl-0 pr-0 pt-20 pb-20">
						<p class="line-h-35 f-22 col-757575">
							<a class="col-309DE2 t-nonehove col-active unpaid-count"
								href="/user/orderCenter?flag=1">0</a>
						</p>
						<p class="line-h-35 f-18 col-309DE2 t-nonehove">
							<a class="t-nonehove col-active" href="/user/orderCenter?flag=1"><span
								class="col-active icon-chevron-right f-14 ml-10 pos-r t--1"></span></a>
						</p>
					</div>
				</div>
				<div class="clear col-sm-6 pl-0 pr-0 pt-40 pb-40">
					<div class="clear col-sm-5 pl-0 pr-0 text-center">
						<img class="img-110 overflow-h full-radius"
							src="/resources/img/user/User/center-tipsv2.png" alt="">
					</div>
					<div class="clear col-sm-7 pl-0 pr-0 pt-20 pb-20">
						<p class="line-h-35 f-22 col-757575">
							<a class="col-309DE2 t-nonehove col-active delivery-count"
								href="/user/orderCenter?flag=3">0</a>
						</p>
						<p class="line-h-35 f-18 col-309DE2 t-nonehove">
							<a class="col-757575i t-nonehove" href="/user/orderCenter?flag=3"><span
								class="col-757575i icon-chevron-right f-14 ml-10 pos-r t--1"></span></a>
						</p>
					</div>
				</div>
				<div class="clear col-sm-6 pl-0 pr-0 pt-40 pb-40">
					<div class="clear col-sm-5 pl-0 pr-0 text-center">
						<img class="img-110 overflow-h full-radius"
							src="/resources/img/user/User/center-tipsv3.png" alt="">
					</div>
					<div class="clear col-sm-7 pl-0 pr-0 pt-20 pb-20">
						<p class="line-h-35 f-22 col-757575">
							<spring:message code="name576" />
							<a class="col-309DE2 t-nonehove col-active appraise-count"
								href="/user/orderCenter?flag=4">0</a>
						</p>
						<p class="line-h-35 f-18 col-309DE2 t-nonehove">
							<a class="col-757575i t-nonehove" href="/user/orderCenter?flag=4"><spring:message
									code="name577" /><span
								class="col-757575i icon-chevron-right f-14 ml-10 pos-r t--1"></span></a>
						</p>
					</div>
				</div>
				<div class="clear col-sm-6 pl-0 pr-0 pt-40 pb-40">
					<div class="clear col-sm-5 pl-0 pr-0 text-center">
						<img class="img-110 overflow-h full-radius"
							src="/resources/img/user/User/center-tipsv4.png" alt="">
					</div>
					<div class="clear col-sm-7 pl-0 pr-0 pt-20 pb-20">
						<p class="line-h-35 f-22 col-757575">
							<spring:message code="name578" />
							<a class="col-309DE2 t-nonehove col-active active-count"
								href="/user/serviceCardPage">0</a>
						</p>
						<p class="line-h-35 f-18 col-309DE2 t-nonehove">
							<a class="col-757575i t-nonehove" href="/user/serviceCardPage"><spring:message
									code="name579" /><span
								class="col-757575i icon-chevron-right f-14 ml-10 pos-r t--1"></span></a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>