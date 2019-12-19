<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="com.bisa.health.shop.enumerate.PayTypeEnum" %>

<!DOCTYPE html>
<html>
<head>
    <link rel="icon" href="/favicon/favicon.ico" type="image/x-icon"/>
    <link rel="shortcut icon" href="/favicon/favicon.ico" type="image/x-icon"/>
    <link rel="bookmark" href="/favicon/favicon.ico" type="image/x-icon"/>
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
    <style type="text/css">
    	.layui-form{
    	    display: inline-block;
    	}
    </style>
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
                <p><spring:message code="3007" /></p>
                <p>
                    <sapn class="col-666"><spring:message code="3008" />:</sapn>
                    <sapn class="col-red">${order.order_num}</sapn>
                </p>
                <p>
                    <sapn class="col-666"><spring:message code="3009" />:</sapn>
                    <sapn class="col-333">${goods.name}</sapn>
                </p>
                <p>
                    <span class="col-666"><spring:message code="3010" />:</span>
                    <sapn class="col-333">$</sapn>
                    <span class="col-333">${order.order_price}</span>

                </p>
                <p>
                    <span class="col-666"><spring:message code="address" />:</span>
                    <span class="col-333">${order.order_address}</span>
                </p>
            </div>
        </div>
    </div>
    <div class="container choose">
        <div class="row chooseBox">
            <p><spring:message code="3012" /></p>
            <input type="hidden"  id="language" name="language" value="${language}" />
            <input type="hidden"  id="timestamp" name="timestamp" value="${timestamp}" />
            <div class="layui-form-item">
            
                  <!--   <button lay-submit lay-filter="wechat">
                        <img class="img-responsive center-block" src="/resources/img/shop/pay_weixin.png">
                    </button>
                    <button lay-submit lay-filter="alipay">
                        <img class="img-responsive center-block" src="/resources/img/shop/pay_zfb.png">
                    </button> -->
                    <form  class="layui-form" action="${easyUrl}"  target="_blank"  method="post" class="layui-form">
	                     <c:forEach items="${easy}" var="item" varStatus="go">
                        	<input type="hidden" name="${item.key}" value="${item.value}"/>
                    	</c:forEach>
	                    <button  lay-submit lay-filter="easy">
	                        <img class="img-responsive center-block" src="/resources/img/shop/pay_union.png">
	                    </button>
                    </form>
                    <form  class="layui-form" action="${visaUrl}"  target="_blank"  method="post" class="layui-form">
	                    <c:forEach items="${visa}" var="item" varStatus="go">
                        	<input type="hidden" name="${item.key}" value="${item.value}"/>
                    	</c:forEach>
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
        	dialog();
            return true;
        });
        form.on('submit(visa)', function(data){
        	dialog();
            return true;
        });
        form.on('submit(master)', function(data){
        	dialog();
            return true;
        });

        function dialog(){
        	
        	var loadIndex=layer.load();
        	 var t = window.setInterval(function(){
     	    	
     	    	$.ajax({
     	            url: '/pay/ajax/pay_result',
     	            type: "GET",
     	            data : {order_num:"${order.order_num}"},
     	            async: false,
     	            success: function (data) {
     	            	if(data.code=="${SysStatusCode.SUCCESS}"){
    	            		
     			         	layer.close(loadIndex);
     			         	clearInterval(t);     			         	   			       	
     			        	layer.confirm('<spring:message code="9001" />', {closeBtn:0,
     			        		  btn: ['<spring:message code="submit" />'] //按钮
     			        		}, function(){
     			        			location.href="index.html";
     			        	});
     			         
     	            	}
     	            	
     	            }
     	     });
     	    },6000); 
   
    
        	
        }
        

    });
</script>
</body>
</html>