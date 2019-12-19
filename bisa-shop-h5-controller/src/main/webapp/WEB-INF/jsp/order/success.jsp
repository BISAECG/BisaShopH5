<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="com.bisa.health.shop.entity.SysStatusCode" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="icon" href="/favicon/favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="/favicon/favicon.ico" type="image/x-icon" />
    <link rel="bookmark" href="/favicon/favicon.ico" type="image/x-icon" />
    
    <meta http-equiv="Content-Type" content="text/html;" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <!-- necessary -->
    <title><spring:message code="admin.domain" /></title>
    <meta name="keywords" content="<spring:message code="admin.keyword" />">
    <meta name="description" content="<spring:message code="admin.description" />">
    <!-- description -->
    <meta name="renderer" content="webkit">
    <!-- base -->

    <link href="/resources/css/comm/base.css" rel="stylesheet">
    <link href="/resources/css/shop/success.css" rel="stylesheet">
    <link href="/resources/ctrl/layui/css/layui.css" rel="stylesheet">
    <script src="/resources/js/comm/jquery.min.js"></script>
	<script src="/resources/ctrl/layui/layui.js"></script>
</head>

<body>
<div id="header"></div>
<script>
    $("#header").load("header.html");
</script>
<!--解决方案购买页-->
<div class="container">
    <div class="row successInfo dis-n pay-success">
        <div class="col-md-2">
            <img class="img-responsive center-block" src="/resources/img/shop/success.png">
        </div>
        <div class="col-xs-10">
            <p><spring:message code="9005" /></p>
            <p>
                <span><spring:message code="9006" /></span>
            </p>
             <p>
                <span><spring:message code="9007" /></span>
            </p>
             <p>
                <span><spring:message code="9008" /></span>
            </p>
            
        </div>
    </div>
     <div class="row successInfo pay-wait">
        <div class="col-md-2">
            <img class="img-responsive center-block" src="/resources/img/shop/payWaiting.gif">
        </div>
        <div class="col-xs-10">
            <p style="color:rgba(53,146,208,1);"><spring:message code="9003" /></p>
            <p>
                <span style="color:rgba(51,51,51,1)"><spring:message code="9004" /></span>
            </p>
        </div>
    </div>
    <div class="row">
        <img class="img-responsive center-block" src="/resources/img/shop/success1.png">
    </div>
    <div class="row recommend">
    
    	<c:forEach items="${list}" var="item" varStatus="go" end="${exitId}">
    		 <c:if test="${go.index==4}">
		         <c:set var="exitId" value="0"></c:set>
		     </c:if>
    	  <div class="col-md-3">
	            <p>${item.name}</p>
	            <div>
	                <img class="img-responsive center-block" src="${item.img_url}" alt="${item.name}">
	            </div>
	            <a href="/html/${language}/goods.html?id=${item.id}"><spring:message code="view.details" /></a>
        	</div>
    	</c:forEach>
    </div>
    <div class="row return text-center">
        <div class="col-md-3 col-md-offset-3 ">
            <a class="pull-right" href="shop.html"><spring:message code="9009" /></a>
        </div>
        <div class="col-md-3 ">
            <a class="pull-left" href="index.html"><spring:message code="go.home" /></a>
        </div>
    </div>
</div>

<!--结束-->
<div id="footer"></div>
<script>
    $("#footer").load("footer.html");
</script>
<script type="text/javascript">

	layui.use([ 'element','form'],function() {
	    var layer = layui.layer,
	    element = layui.element,
	    $=layui.jquery;
	
	    var t = window.setInterval(function(){
	    	
	    	$.ajax({
	            url: '/pay/ajax/pay_result',
	            type: "GET",
	            data : {order_num:"${order.order_num}"},
	            async: false,
	            success: function (data) {
	            	if(data.code=="${SysStatusCode.SUCCESS}"){
	            		$('.pay-wait').addClass("dis-n");
	            		$('.pay-success').removeClass("dis-n");
			         	layer.closeAll('loading');
			         	clearInterval(t);
			         
	            	}
	            	
	            }
	     });
	    },6000); 
	    $(function(){
	    	layer.load();
	    });
		
	});
</script>
</body>

</html>