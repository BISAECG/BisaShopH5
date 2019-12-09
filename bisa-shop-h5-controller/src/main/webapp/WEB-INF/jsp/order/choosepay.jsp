<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="com.bisa.health.shop.enumerate.PayTypeEnum" %>

<!DOCTYPE html>
<html>
<head>
    <link rel="icon" href="Images/favicon.ico" type="image/x-icon"/>
    <link rel="shortcut icon" href="Images/favicon.ico" type="image/x-icon"/>
    <link rel="bookmark" href="Images/favicon.ico" type="image/x-icon"/>
    <meta http-equiv="Content-Type" content="text/html;"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no"/>
    <!-- necessary -->
    <title><spring:message code="admin.domain" /></title>
    <meta name="keywords" content="<spring:message code="admin.keyword" />">
    <meta name="description" content="<spring:message code="admin.description" />">
    <!-- description -->
    <!-- description -->
    <meta name="renderer" content="webkit">
    <!-- base -->
    <link href="/resources/ctrl/layui/css/layui.css" rel="stylesheet">
    <link href="/resources/css/comm/base.css" rel="stylesheet">
    <link href="/resources/css/index/index.css" rel="stylesheet">
    <link href="/resources/css/shop/choosePayment.css" rel="stylesheet">
    <script src="/resources/js/comm/jquery.min.js"></script>
    <script src="/resources/ctrl/layui/layui.js"></script>
</head>

<body>
<div id="header"></div>
<script>
    $("#header").load("header.html");
</script>
<div class="con">
    <div class="container">
        <div class="row chooseInfo">
            <div class="col-md-2">
                <img class="img-responsive center-block" src="/resources/img/shop/success.png">
            </div>
            <div class="col-md-9">
                <p>订单提交成功！去付款咯～</p>
                <p>
                    <sapn class="col-666">订单号:</sapn>
                    <sapn class="col-red">465413213213213</sapn>
                </p>
                <p>
                    <sapn class="col-666">商品名称:</sapn>
                    <sapn class="col-333">心电仪</sapn>
                </p>
                <p>
                    <span class="col-666">订单金额:</span>
                    <sapn class="col-333">$</sapn>
                    <span class="col-333">555</span>

                </p>
                <p>
                    <span class="col-666">收货信息:</span>
                    <span class="col-333">深圳市宝安区11111号</span>
                </p>
            </div>
        </div>
    </div>
    <div class="container choose">
        <div class="row chooseBox">
            <p>请选择支付方式</p>
            <p>支付平台</p>
            <input type="hidden"  id="language" name="language" value="${language}" />
            <input type="hidden" id="orderNum" name="orderNum" value="${orderNum}" />
            <input type="hidden"  id="payType" name="payType" value="-1" />
            <input type="hidden"  id="timestamp" name="timestamp" value="${timestamp}" />
            <div class="layui-form-item">
                <form  class="layui-form" action="${easyUrl}"  target="_blank"  method="post" class="layui-form">
                    <c:forEach items="${easy}" var="item" varStatus="go">
                        <input type="hidden" name="${item.key}" value="${item.value}"/>
                    </c:forEach>
                    <c:forEach items="${visa}" var="item" varStatus="go">
                        <input type="hidden" name="${item.key}" value="${item.value}"/>
                    </c:forEach>
                    <button lay-submit="" lay-filter="wechat">
                        <img class="img-responsive center-block" src="/resources/img/shop/pay_weixin.png">
                    </button>
                    <button lay-submit="" lay-filter="alipay">
                        <img class="img-responsive center-block" src="/resources/img/shop/pay_zfb.png">
                    </button>
                    <button  lay-submit="" lay-filter="easy">
                        <img class="img-responsive center-block" src="/resources/img/shop/pay_union.png">
                    </button>
                    <button lay-submit lay-filter="visa">
                        <img class="img-responsive center-block" src="/resources/img/shop/pay_visa.png">
                    </button>
                    <button lay-submit lay-filter="master">
                        <img class="img-responsive center-block" src="/resources/img/shop/pay_master.png">
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>

<div id="footer"></div>
<script>
    $("#footer").load("footer.html");
</script>
<script type="text/javascript">
    layui.use([ 'element', 'form' ],function() {
        var layer = layui.layer,
            element = layui.element,
            form = layui.form;

        form.on('submit(easy)', function(data){
            $('#payType').val("${PayTypeEnum.EASY.getValue()}");
            return true;
        });
        form.on('submit(visa)', function(data){
            return true;
        });
        form.on('submit(master)', function(data){
            return true;
        });


    });
</script>
</body>
</html>