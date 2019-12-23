<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="com.bisa.health.shop.enumerate.LangEnum" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title><spring:message code='admin.domain'/></title>
    <meta name="keywords" content="<spring:message code='admin.keyword'/>">
    <meta name="description" content="<spring:message code='admin.description'/>">
    <link href="/resources/ctrl/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/ctrl/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="/resources/css/public.css" rel="stylesheet">
    <link href="/resources/css/index.css" rel="stylesheet">
    <link href="/resources/css/shop.css" rel="stylesheet">
    <script src="/resources/js/comm/jquery.min.js"></script>
    <script src="/resources/ctrl/bootstrap/js/bootstrap.js"></script>
    <script src="/resources/js/rootFont.js"></script>
</head>

<body>
    <div id="header"></div>
    <script>
        $("#header").load("header.html");
    </script>
    <div class="content">
        <div class="container-full">
            <div class="row Offer" style="margin: 0;">
                <img class="img-responsive center-block" src="/resources/img/index/offer.gif">
                <div>
                    <a href="https://shop194684580.taobao.com/?spm=a230r.7195193.1997079397.2.6815114b089AGi" >淘宝</a>
                    <a href="https://mall.jd.com/index-10103348.html">京东</a>
                </div> 
        </div>
            <div class="row" style="margin: 0;">
                <div class="col-xs-12">
                    <p class="title-p text-center">所有产品</p>
                    <div class="line">
                        <p class="line-top"></p>
                        <p class="line-btm"></p>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-xs-6 col-sm-6 mb-20 product">
                    <div class="row">
                        <div class="product_img col-xs-10 col-xs-offset-1">
                            <img class="center-block" src="/resources/img/shop/xixin.png">
                        </div>
                    </div>
                    <div class="row">
                        <div class=" col-xs-10 col-xs-offset-1" style="padding: 0;">
                            <p class="product_title">悉心动态心电仪</p>
                            <p class="product_Introduction">世界首创三导联无线携带式心电记录仪aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa </p>
                            <div class="product_price mt-15">
                                <span>￥1280</span>
                                <span>￥1800</span>
                                <a class="pull-right" href="details.html">查看详情</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-6 col-sm-6  product">
                    <div class="row">
                        <div class="product_img col-xs-10 col-xs-offset-1">
                            <img class="center-block" src="/resources/img/shop/xixin.png">
                        </div>
                    </div>
                    <div class="row">
                        <div class=" col-xs-10 col-xs-offset-1" style="padding: 0;">
                            <p class="product_title">悉心动态心电仪</p>
                            <p class="product_Introduction">世界首创三导联无线携带式心电记录仪 </p>
                            <div class="product_price">
                                <span>￥1280</span>
                                <span>￥1800</span>
                                <a class="pull-right" href="details.html">查看详情</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="footer"></div>
    <script>
        $("#footer").load("footer.html");
    </script>
</body>
</html>