<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="com.bisa.health.shop.entity.SysStatusCode" %>
<%@ page import="com.bisa.health.shop.enumerate.GoodsTypeEnum" %>
<%@ page import="com.bisa.health.shop.enumerate.PayTypeEnum" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title><spring:message code="admin.domain" /></title>
    <meta name="keywords" content="<spring:message code="admin.keyword" />">
    <meta name="description" content="<spring:message code="admin.description" />">
    <link href="/resources/ctrl/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/css/public.css" rel="stylesheet">
    <link href="/resources/ctrl/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="/resources/css/buy.css" rel="stylesheet">
    <script src="/resources/js/comm/jquery.min.js"></script>
    <script src="/resources/js/rootFont.js"></script>

</head>

<body>
    <div class="content">
        <div class="container">
            <div class="row return">
                <div class="col-xs-1 text-center">
                    <a href="details.html">
                        <i class="fa fa-chevron-left"></i>
                    </a>
                </div>
                <div class="col-xs-10  text-center">
                    <span>提交訂單</span>
                </div>
            </div>
        </div>
        <div class="container-full">
            <div class="row" style="height:20px;background:rgba(241,241,241,1);margin: 0;">
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-xs-10 col-xs-offset-1 info">
                    <div class="row">
                        <div class="col-sm-10 col-sm-offset-2 col-xs-12 Personal_info">
                            <span class="default">默認</span>
                            <span class="username">胡新</span>
                            <span class="phone">13666666666</span>
                        </div>
                    </div>
                    <div class="row address">
                        <div class="col-xs-2">
                            <img class="img-responsive center-block" src="/resources/img/shop/logo.png">
                        </div>
                        <div class="col-xs-8">
                            <span>廣東省深圳市寶安區全誌科技園10E碧沙科技</span>
                        </div>
                        <div class="col-xs-2 text-right">
                            <a href="address.html"><i class="fa fa-chevron-right "></i></a>
                            
                        </div>

                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-10 col-xs-offset-1 info_two">
                    <div class="row">
                        <div class=" col-xs-4 col-xs-offset-1 product_img">
                            <img class="center-block img-responsive" src="/resources/img/shop/xixin.png">
                        </div>
                        <div class="col-xs-7">
                            <p class="product_title">悉心動態心電儀</p>
                            <p class="product_Introduction">世界首創三導聯無線攜帶式心電記錄儀 </p>
                            <div class="product_price">
                                <span class="col-red originalPrice">￥</span><span class="col-red originalPrice">1280</span>
                                <span class="col-666 discountedPrices">￥</span><span class="col-666 discountedPrices">1800</span>
                                <span class="col-666 quantityLeft">x</span><span class="col-666 quantityRight">1</span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-10 col-xs-offset-1 board">
                                <p>我們將盡快為您安排發貨</p>
                                <p><span>買家留言:</span><input type="text" placeholder="給我們留言，最多140個字 " maxlength="140"></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-10 col-xs-offset-1 info">
                    <div class="row">
                        <div class="col-xs-10 col-xs-offset-1 pay">
                            <div class="row">
                                <span>購買數量</span>
                                <div class="goods_num clearfix pull-right">
                                    <div class="gw_num">
                                        <em class="less">-</em>
                                        <input id="goods_count" type="text" value="1" class="num" onkeyup="value=value.replace(/[^\d]/g,'')" maxlength="3" />
                                        <em class="add">+</em>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <span>郵費</span>
                                <span class="pull-right col-red">￥</span><span class="col-red pull-right">10</span>
                            </div>
                            <div class="row">
                                <span>優惠券</span>
                                <input class="pull-right" type="text" placeholder="請輸入兌換碼">
                            </div>
                            <div class="row">
                                <span>總價</span>
                                <span class="pull-right col-red">￥</span><span class="pull-right col-red">1220</span>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <div class="row">
                <div class="col-xs-11 col-xs-offset-1">                  
                        <div class="col-xs-12 buy">
                            <button class="pull-right">
                                <a href="order.html">
                                   立即下單
                                </a>
                            </button>
                            <button class=" pull-right">
                                <a href="#">
                                    電話咨詢
                                </a>
                            </button>
                        </div>
               
                </div>
            </div>
        </div>


    </div>
</body>
<script type="text/javascript">
	//加號
	var num = parseInt($('#goods_count').val());
	//當購物車數量增加的時候
	$('.add').click(function() {
		num++;
		$('#goods_count').val(num);
	});
	//當購物車數量減少的時候
	$('.less').click(function() {
		if (num > 1) {
			num--;
			$('#goods_count').val(num);
		}
	});
	function order(){
		var goods_count=$('#goods_count').val();
		 location.href="/html/zh_CN/order.html?goods_id=10&goods_count="+goods_count;
	}
</script>
</html>