<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!-- 左侧导航区域 -->
<div class="layui-side layui-bg-black">
	<div class="layui-side-scroll">
		<ul class="layui-nav layui-nav-tree" lay-filter="test">
			<li class="layui-nav-item"><a href="/admin/order/list"><spring:message code="3001" /></a></li>
			<li class="layui-nav-item"><a href="/admin/pay/list"><spring:message code="3002" /></a></li>
		</ul>
	</div>
</div>