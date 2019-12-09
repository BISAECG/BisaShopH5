<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!-- 左侧导航区域 -->
<div class="layui-side layui-bg-black">
	<div class="layui-side-scroll">
		<ul class="layui-nav layui-nav-tree" lay-filter="test">
			<li class="layui-nav-item"><a href="/admin/goods/list"><spring:message code="2001" /></a></li>
			<li class="layui-nav-item"><a href="/admin/goods/category"><spring:message code="2003" /></a></li>
		</ul>
	</div>
</div>