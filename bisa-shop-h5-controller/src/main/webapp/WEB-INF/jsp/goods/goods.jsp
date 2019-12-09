<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.bisa.health.shop.enumerate.GoodsStatusEnum" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="icon" href="Images/favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="Images/favicon.ico" type="image/x-icon" />
    <link rel="bookmark" href="Images/favicon.ico" type="image/x-icon" />
    <meta http-equiv="Content-Type" content="text/html;" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <!-- necessary -->
    <title><spring:message code="admin.domain"/>${goods.name}</title>
    <meta name="keywords" content="<spring:message code="admin.domain"/>${goods.name}">
    <meta name="description" content="<spring:message code="admin.domain"/>${goods.description}">
    <!-- description -->
    <meta name="renderer" content="webkit">
    <!-- base -->
    <link href="/resources/css/comm/base.css" rel="stylesheet">
    <link href="/resources/css/index/index.css" rel="stylesheet">
    <link href="/resources/css/shop/shop.css" rel="stylesheet">
    <script src="/resources/js/comm/jquery.min.js"></script>
    <style>
        .spantitle{
            color:rgba(153,153,153,1);
            font-size:20px;
            line-height:40px;
            font-weight: 400;
        }
        .spanprice{
            color:rgba(207,21,24,1);
            line-height:40px;
            font-size:28px;
        }
    </style>
</head>

<body>
<div id="header"></div>
<script>
    $("#header").load("header.html");
</script>

<!--ai报告购买页面-->
<div class="container">
    <div class="row mt-40 shopBox">
        <div class="col-md-4 col-md-offset-1 boxLeft">
         	<img class="img-responsive" src="${goods.img_url}">
        </div>
        <div class="col-md-5 col-md-offset-1 boxRight">
	            <p class="shopTitle" style="margin-bottom: 12px">${goods.name}</p>
	            <p style="font-size:16px;color:rgba(207,21,24,1);">${goods.description}</p>
	            <p class="shopPrice">
	                <span ><spring:message code="price"/>:</span>
	                <span>¥${goods.price}</span>
	            </p>
	            <div class="row">
					<div class="goods_num  col-md-12">
						<span class="num_name  pull-left "><spring:message code="total"/>:</span>
						<div class="num_add pull-left pos-r text-center">
							<a href="javascript:;" class="minus fr pos-a">-</a> 
							<input readonly='true' type="text" id="goods_count" name="goods_count"class="num_show fl text-center" value="1">
							 <a href="javascript:;" class="add fr pos-a">+</a>
						</div>
					</div>
	            	<input readonly="true" type="hidden" name="goods_id"  value="${goods.id}">
	            </div>
	            <div class="recommend">
	                <span class=" pull-left"><spring:message code="recommend"/>:</span>
	                   <c:forEach items="${list}" var="item">
	                <div class="pull-left cur-p" style="border: 1px solid #ccc;margin-left: 5px;margin-top: 5px;">
	                    <a   href="/html/${language}/goods.html?id=${item.id}" style="padding: 2px;font-size:18px;color:rgba(102,102,102,1);">
	                      ${item.name}
	                    </a>
	                </div>
	                </c:forEach>
	                
	            </div>
	            <div style="clear: both;" ></div>
	            <c:if test="${goods.status==GoodsStatusEnum.IN_SALE.getValue()}">
	             <a  href="javascript:order();">
		            <button class="Order" style="margin-top: 15px;font-size: 15px;color:#fff">
		              		 <spring:message code="buy.now"/>
		            </button>
	            </a>
	            </c:if>
	             <c:if test="${goods.status==GoodsStatusEnum.SALE_OUT.getValue()}">
		            <button class="Order" style="margin-top: 15px;font-size: 15px;color:#fff;background:#5bd1a1">
		              		<spring:message code="sold.out"/>
		            </button>
	            </c:if>
	             <c:if test="${goods.status==GoodsStatusEnum.INVALID.getValue()}">
		            <button class="Order" style="margin-top: 15px;font-size: 15px;color:#fff;background:#5bd1a1">
		              		 <spring:message code="off.shelves"/>
		            </button>
	            </c:if>
	            <p></p>
	            <button class="now" >
	                <i class="fa fa-phone" style="font-size: 15px;">
	                	<spring:message code="contact.us"/>
	                </i>
	               
	            </button>
        </div>
    </div>
</div>
<div class="container-fluid" style="padding: 0px;margin-top: 68px;">
    <div class="row center-block">
          <img class="img-responsive center-block" src="${goods.detail_body}">
    </div>

</div>

<div id="footer"></div>
<script>
    $("#footer").load("footer.html");
</script>
<script type="text/javascript">
	//加号
	var num = parseInt($('#goods_count').val());
	//当购物车数量增加的时候
	$('.add').click(function() {
		num++;
		$('#goods_count').val(num);
	});
	//当购物车数量减少的时候
	$('.minus').click(function() {
		if (num > 1) {
			num--;
			$('#goods_count').val(num);
		}
	});
	
	function order(){
		var goods_count=$('#goods_count').val();
		 location.href="/html/${language}/order.html?goods_id=${goods.id}&goods_count="+goods_count;
	}
</script>
</body>

</html>