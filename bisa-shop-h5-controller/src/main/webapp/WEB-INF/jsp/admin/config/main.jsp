<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN">

<head>
<link rel="icon" href="/favicon/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="/favicon/favicon.ico" type="image/x-icon" />
<link rel="bookmark" href="/favicon/favicon.ico" type="image/x-icon" />
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
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

<script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
 <style type="text/css">
    	.layui-form-label{
    		width:200px !important;
    	}
    </style>
</head>

<body class="layui-layout-body">
	<div class="layui-layout">
		<!-- 左侧导航区域 -->
		<%@ include file="nav.jsp"%>
		<!-- 内容主体区域 -->
		<div class="layui-body">
			<div style="padding: 30px 50px;">
				<p class="f-18 pt-15 pb-15 col-8d969d"><spring:message code='1023' /></p>
				<form class="layui-form" lay-filter="body" >
					<input type="hidden" name="uniqueid" value="1">
					<div class="clear pd-15 bg-fafafa bor bor-col-e8ebf2">
						<div class="layui-form-item">
							<label class="layui-form-label"><spring:message code='1024' /></label>
							<div class="layui-input-inline">
								<input type="text" name="company_address_CN"
									lay-verify="required" autocomplete="off" placeholder="<spring:message code='input' />"
									class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label"><spring:message code='1025' /></label>
							<div class="layui-input-inline">
								<input type="text" name="company_address_HK"
									lay-verify="required" autocomplete="off" placeholder="<spring:message code='input' />请输入公司地址"
									class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label"><spring:message code='1026' /></label>
							<div class="layui-input-inline">
								<input type="text" name="company_address_US"
									lay-verify="required" autocomplete="off" placeholder="<spring:message code='input' />"
									class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label"><spring:message code='1027' /></label>
							<div class="layui-input-inline">
								<input type="text" name="company_domain" lay-verify="required"
									placeholder="<spring:message code='input' />" autocomplete="off" class="layui-input">
							</div>
						</div>
		
						<div class="layui-form-item">
							<label class="layui-form-label"><spring:message code='1028' /></label>
							<div class="layui-input-inline">
								<input type="text" name="company_phone" lay-verify="required"
									placeholder="<spring:message code='input' />" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label"><spring:message code='1029' /></label>
							<div class="layui-input-inline">
								<input type="text" name="company_name_CN" lay-verify="required"
									placeholder="<spring:message code='input' />" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label"><spring:message code='1030' /></label>
							<div class="layui-input-inline">
								<input type="text" name="company_name_HK" lay-verify="required"
									placeholder="<spring:message code='input' />" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label"><spring:message code='1031' /></label>
							<div class="layui-input-inline">
								<input type="text" name="company_name_US" lay-verify="required"
									placeholder="<spring:message code='input' />" autocomplete="off" class="layui-input">
							</div>
						</div>
					
					</div>
					  <div class="layui-form-item pt-20">
	                    <div class="pl-20">
	                        <button class="layui-btn" lay-submit lay-filter="create" ><spring:message code='submit' /></button>
	                        <button type="reset" class="layui-btn layui-btn-primary"><spring:message code='reset' /></button>
	                    </div>
	                 </div>
				</form>
			
			</div>
		</div>

		<script src="/resources/ctrl/layui/layui.js"></script>
</body>
<script>
	layui.use(['form','layer'], function() {
		var $=layui.jquery,form = layui.form,layer=layui.layer;

		$.ajax({
			url : '/admin/ajax/company',
			type : "GET",
			success : function(data) {
				form.val("body",data);
			}
		});
		
		 
       	form.on('submit(create)', function(data){
       		$.ajax({
				url : '/admin/ajax/company',
				type : "POST",
				dataType: "json",
				data : data.field,
				success : function(data) {
					form.val("body",data);
				}
			});
	
       		return false;
       	});


	});
</script>
</html>