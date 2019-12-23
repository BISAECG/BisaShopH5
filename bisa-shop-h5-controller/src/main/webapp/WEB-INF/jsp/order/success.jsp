<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="com.bisa.health.shop.entity.SysStatusCode" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
   <meta name="keywords" content="${html_description}">
    <meta name="description" content="${html_keyWord}">
    <title>${html_title}</title>
    <link href="/resources/ctrl/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/css/public.css" rel="stylesheet">
    <link href="/resources/ctrl/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="/resources/css/success.css" rel="stylesheet">
    <script src="/resources/js/comm/jquery.min.js"></script>
    <script src="/resources/js/rootFont.js"></script>
</head>

<body>
        <div id="header"></div>
    <script>
        $("#header").load("header.html");
    </script>
    <div class="container-full">
            <div class="row">
                    <div class="col-xs-12" style="height:0.2rem;background:rgba(241,241,241,1);">
                    </div>
                </div>
        <div class="row successInfo">
            <div class="col-xs-12 text-center">
                <img class="img-responsive center-block" src="/resources/img/shop/success.png">
                <p>购买成功</p>
            </div>
        </div>
        <div class="row" style="height:0.2rem;background:rgba(241,241,241,1);margin: 0;">
        </div>
        <div class="row" style="margin: 0.25rem 0;">
            <div class="col-xs-12 text-center service ">
                <p>我们会尽快安排发货</p>
                <p><span> 如有疑问请联系</span><span>(852) 2423 0600</span></p>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12 success">
                <a href="shop.html">查看所有产品</a>
                <a href="details.html">继续购买</a>
            </div>
        </div>
    </div>
</body>

</html>