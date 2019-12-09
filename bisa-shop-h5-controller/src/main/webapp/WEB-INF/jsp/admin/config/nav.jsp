<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    <!-- 左侧导航区域 -->
    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item"><a href="/admin/main"><spring:message code='1001' /></a></li>
                <li class="layui-nav-item"><a href="/admin/client"><spring:message code='1002' /></a></li>
                <li class="layui-nav-item"><a href="/admin/page/main"><spring:message code='1003' /></a></li>
            </ul>
        </div>
    </div>