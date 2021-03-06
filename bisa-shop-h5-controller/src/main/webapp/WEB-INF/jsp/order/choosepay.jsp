<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="com.bisa.health.shop.enumerate.PayTypeEnum" %>
<!DOCTYPE html>
<html lang="ZH-CN">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title><spring:message code="admin.domain" /></title>
    <meta name="keywords" content="<spring:message code="admin.keyword" />">
    <meta name="description" content="<spring:message code="admin.description" />">
    <link href="/resources/ctrl/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/ctrl/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="/resources/css/public.css" rel="stylesheet">
    <link href="/resources/css/order.css" rel="stylesheet">
    <script src="/resources/js/comm/jquery.min.js"></script>
    <script src="/resources/js/rootFont.js"></script>
</head>

<body>
    <div id="header"></div>
    <script>
        $("#header").load("header.html");
    </script>
    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-12" style="height:0.2rem;background:rgba(241,241,241,1);">
                </div>
            </div>
            <div class="row" style="margin:  0;">
                <div class="col-xs-12 payImg text-center">
                    <img class="img-responsive center-block" src="/resources/img/shop/success.png">
                </div>
                <div class="col-xs-12 text-center payInfo">
                    <p>订单提交成功！去付款咯～</p>
                    <p>请在<span class="time">0小时8分</span>内完成支付, 超时后将取消订单</p>
                    <p><span>收货信息：</span><span class="username">仇亚辉</span><span class="phone">151****5151</span></p>
                    <p class="address">山东 莱芜市 钢城区 里辛镇 2111号</p>
                </div>
            </div>
            <div class="row" style="height:10px;background:rgba(241,241,241,1);">
            </div>
        </div>
        <div class="container">
            <div class="row  payMethod">
                <div class="col-xs-12">
                    <p>请选择在线支付方式</p>
                </div>
                <!--支付跳转，暂时用的静态跳转-->
                <div class="col-xs-6" onclick="window.open('success.html','_self')">
                    <img class="img-responsive center-block wx" src="/resources/img/shop/wx.jpg">
                </div>
                <div class="col-xs-6">
                    <img class="img-responsive center-block" src="/resources/img/shop/zfb.png">
                </div>
                <div class="col-xs-6">
                    <img class="img-responsive center-block" src="/resources/img/shop/visa.jpg">
                </div>
                <div class="col-xs-6">
                    <img class="img-responsive center-block" src="/resources/img/shop/master.png">
                </div>
            </div>
        </div>
    </div>
</body>

</html>