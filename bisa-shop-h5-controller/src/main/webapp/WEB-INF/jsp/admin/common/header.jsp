<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- 头部导航部分 -->
<div class="layui-header">
	<div class="layui-logo pd-10 clear">
		<a href="/index.html" target="_blank">
		<img src="/resources/img/admin/logo.png" class="full-w pull-left">
		</a>
	</div>
	<ul class="layui-nav layui-layout-left">
		<li class="layui-nav-item"><a href="/admin/main" target="mainFrame"><spring:message code="1000" /></a></li>
		<!-- 仅超级管理员可见 -->
		<shiro:hasAnyRoles name="ROLE_ADMIN ,ROLE_CUSTOMER" >
			<li class="layui-nav-item"><a href="/admin/goods/list" target="mainFrame"><spring:message code="2000" /></a></li>
		</shiro:hasAnyRoles>
		<shiro:hasAnyRoles name="ROLE_ADMIN ,ROLE_CUSTOMER, ROLE_STORE" >
			<li class="layui-nav-item"><a href="/admin/order/list" target="mainFrame"><spring:message code="3000" /></a></li>
		</shiro:hasAnyRoles>
		
		<shiro:hasAnyRoles name="ROLE_ADMIN">
			<li class="layui-nav-item"><a href="/admin/coupon/list" target="mainFrame"><spring:message code="4000" /></a></li>
		</shiro:hasAnyRoles>

		<!-- 仅超级管理员和客服可见 -->
		<shiro:hasAnyRoles name="ROLE_ADMIN, ROLE_CUSTOMER" >
			<li class="layui-nav-item"><a href="/admin/news/list" target="mainFrame"><spring:message code="5000" /></a></li>
			<li class="layui-nav-item"><a href="/admin/book/list" target="mainFrame"><spring:message code="6000" /></a></li>
		</shiro:hasAnyRoles>
		
	</ul>
	<ul class="layui-nav layui-layout-right">
		<li class="layui-nav-item">
		<a href="javascript:;"> <img src="/resources/img/admin/header.png" class="layui-nav-img">
		<shiro:principal/>
		</a>
		    <dl class="layui-nav-child">
				<dd>
					<a href="javascript:void(location.href='/admin/index?lang=zh_CN');"><spring:message code='language.cn' /></a>
				</dd>
				<dd>
					<a href="javascript:void(location.href='/admin/index?lang=zh_HK');"><spring:message code='language.hk' /></a>
				</dd>
				<dd>
					<a href="javascript:void(location.href='/admin/index?lang=en_US');"><spring:message code='language.us' /></a>
				</dd>
			</dl>
			</li>
		<li class="layui-nav-item"><a href="/logout"><spring:message code="logout" /></a></li>
	</ul>
</div>