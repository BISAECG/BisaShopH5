<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="com.bisa.health.shop.entity.SysStatusCode" %>
<%@ page import="com.bisa.health.shop.enumerate.GoodsTypeEnum" %>
<%@ page import="com.bisa.health.shop.enumerate.PayTypeEnum" %>
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
 <title><spring:message code="admin.domain" /></title>
 <meta name="keywords" content="<spring:message code="admin.keyword" />">
 <meta name="description" content="<spring:message code="admin.description" />">
<!-- description -->
<meta name="renderer" content="webkit">
<!-- base -->
<link href="/resources/ctrl/layui/css/layui.css" rel="stylesheet">
<link href="/resources/css/comm/base.css" rel="stylesheet">
<link href="/resources/css/index/index.css" rel="stylesheet">
<link href="/resources/css/shop/payment.css" rel="stylesheet">
<script src="/resources/js/comm/jquery.min.js"></script>
<script src="/resources/ctrl/layui/layui.js"></script>
<script src="/resources/js/utils.js"></script>
</head>
<body>
	<div id="header"></div>
	<script>
		$("#header").load("header.html");
	</script>
	<div class="container payBox">
		<form  class="layui-form" id="orderForm" action="/html/${language}/order" method="post">
			<div class="row">
				<div class="col-md-4 col-md-offset-1 mt-60 mb-60">
					<img class="img-responsive center-block"
						src="${goods.img_url}">
				</div>
				<div class="col-md-4 col-md-offset-2 payRight">
					<p class="payTitle" style="margin-bottom: 10px;">${goods.name}</p>
					<p class="payPrice">
						<span><spring:message code="price" />:</span> <span class="redInfo" >¥${goods.price}<input type="hidden" id="goods_price" name="goods_price" value="${goods.price}" ></span>
						<input type="hidden" name="goods_num" value="${goods.number}">
						<input type="hidden" name="goods_id" value="${goods.id}">
					</p>
					<p class="payPrice">
						<span><spring:message code="2015" />:</span><span class="redInfo">${goods_count}</span>
						<input type="hidden" id="goods_count" name="goods_count" value="${goods_count}">
					</p>
					<p class="payPrice">
						<span><spring:message code="2016" />:</span><span class="xPrice redInfo">￥${goods.price}</span>
						<input type="hidden" id="order_total" name="order_total" value="0">
					</p>
					<p class="payNum">
						<span><spring:message code="coupon" />:</span> <input type="text" id="coupon_num" name="coupon_num" autocomplete="off">
					</p>
					<p class="payInfo dis-n">
						<span><spring:message code="2017" />:</span> <span id="xCoupan" class="redInfo"></span>
						<input type="hidden" name="coupon_price" id="coupon_price" value="0">
					</p>
					<c:if test="${goods.type==GoodsTypeEnum.REAL.getValue()}">
					<p class="payPostage">
						<span><spring:message code="postage" />:</span> <span class="redInfo">¥50</span>
						<input type="hidden" id="emd_postage" name="emd_postage" value="50">
					</p>
					</c:if>
					<c:if test="${goods.type==GoodsTypeEnum.VIRTUAL.getValue()}">
					<p class="payPostage">
						<input type="hidden" id="emd_postage" name="emd_postage" value="0">
					</p>
					</c:if>
					<p class="totalPrice">
						<span><spring:message code="2018" />:</span> <span id="xTotal" class="redInfo"></span><input type="hidden" id="order_price" name="order_price" value="0"></span>
					</p>
				     <p class="payNum">
				     	<input type="hidden" id="address_id" name="address_id" value="0">
						<span><spring:message code="address" />:</span> <input type="text" lay-reqText="<spring:message code='address.empty' />" lay-verify="required" readonly="readonly" autocomplete="off" name="order_address" id="order_address" placeholder="<spring:message code='address.input' />">
					</p>
					  <button lay-submit lay-filter="submitOrder" class="payMode f-20 col-white">
			                	<spring:message code="submit.order" />
			            </button>
				
				</div>
			</div>
		</form>
	</div>
	
	<!-- 弹框 -->
	<div class="address-form dis-n mg-20" id="address-form">
		<form class="layui-form" id="addressMain"  lay-filter="address-filter" >
			
		  <div class="layui-form-item">
		    <label class="layui-form-label"><spring:message code="addressee" /></label>
		    <div class="layui-input-block">
		       <input type="hidden" name="id" value="0">
		       <input type="hidden" name="user_id" value="0">
		       <input type="hidden" name="country" value="">
		       <input type="hidden" name="province" value="">
		       <input type="hidden" name="county" value="">
		       <input type="hidden" name="town" value="">
		        <input type="hidden" name="is_default"  value="">
		         <input type="hidden" name="address_label"  value="">
		      <input type="text" name="consignee" required  lay-verify="required" lay-reqText="<spring:message code="addressee.emptu" />" placeholder="<spring:message code="addressee.input" /> autocomplete="off" class="layui-input">
		    </div>
		  </div>
		  <div class="layui-form-item">
		   <label class="layui-form-label"><spring:message code="tell" /></label>
		    <div class="layui-input-block">
		      <input type="text" name="phone" required  lay-verify="required" lay-reqText="<spring:message code="tell.empty" />" placeholder="<spring:message code="tell.input" />" autocomplete="off" class="layui-input">
		    </div>
		  </div>
		  <div class="layui-form-item">
		    <label class="layui-form-label"><spring:message code="city" /></label>
		    <div class="layui-input-block">
		      <select name="city" id="city" lay-reqText="<spring:message code="city.empty" />" lay-verify="required" >
		      </select>
		    </div>
		  </div>
		 
		  <div class="layui-form-item layui-form-text">
		    <label class="layui-form-label"><spring:message code="address.details" /></label>
		    <div class="layui-input-block">
		      <textarea name="detail_address" lay-reqText="<spring:message code="address.details.empty" />" placeholder="<spring:message code="address.details.input" />" class="layui-textarea"></textarea>
		    </div>
		  </div>
		  <div class="layui-form-item">
		    <div class="layui-input-block">
		      <button class="layui-btn" lay-submit lay-filter="saveAddress"><spring:message code="submit.now" /></button>
		      <button type="reset" class="layui-btn layui-btn-primary"><spring:message code="reset" /></button>
		    </div>
		  </div>
		</form>
	</div>
	<!-- end 弹框 -->

	<div id="footer"></div>
	<script>
		$("#footer").load("footer.html");
	</script>
	<script type="text/javascript">
		//加载layui
		layui.use([ 'element', 'table', 'form' ],function() {
			var layer = layui.layer, 
			element = layui.element, 
			table = layui.table,
			form = layui.form,
			$ = layui.jquery;
			var addIndex;
			
			var msg="${msg}";
			if(msg!=null&&msg!=""){
				layer.msg(msg);
			}
			
			function address(){
				
				var index=layer.load();
				$('#addressMain')[0].reset();
				var city=<spring:message code='city.lang' />;
				$('#city').empty();
				$(city).each(function(index,element){
					$('#city').append("<option value="+element+">"+element+"</option>");
				});
				
				form.render('select'); 
				$.ajax({
					type : "GET",
					dataType: "json",
					url : '/html/order/address',
					async:false,
					success : function(data) {
						layer.close(index);
						if(data.code=="${SysStatusCode.SUCCESS}"){
							console.log(data.data);
							form.val('address-filter', data.data);
							form.render(''); 
						}
					},error:function(){
						layer.close(index);
					}
				});
				addIndex=layer.open({
	                  title: "<spring:message code='address' />"//弹框标题
	                  , content:$('#address-form')//也可以是一个html
	                  , area: ['600px', '420px']
	  		         ,closeBtn: 1
	  		         ,shadeClose:true
	  		         ,type: 1
	  		      	,shade: 0.5
	              });
			  
			   }
			//添加地址
			form.on('submit(saveAddress)', function(data){
				var index=layer.load();
		 		$.ajax({
					type : "POST",
					dataType: "json",
					//contentType: "application/json;charset=UTF-8",
					url : '/html/order/address',
					data : data.field,
					success : function(obj) {
						layer.close(index);
						layer.close(addIndex);
						if(obj.code=="${SysStatusCode.SUCCESS}"){
							$('#order_address').val(data.field.city+data.field.detail_address);
							$('#address_id').val(data.field.id);
						}
					},error:function(){
						layer.close(index);
					}
				});
		 		return false;
			});
			
			
			$('#order_address').click(function(){
				address();
				
			});
			
			form.on('submit(submitOrder)', function(data){				
				return true; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
			});
			
		
			function ShopCart(xCoupan){
				var goods_price=$('#goods_price');//单价
				var goods_count=$('#goods_count');//数量
				var coupon_price=$('#coupon_price');//优惠价
				var emd_postage=$('#emd_postage');//邮费
				var order_price=$('#order_price');//实际金额
				var order_total=$('#order_total');//订单总价
				
				var xPrice=$('.xPrice');//商品总价
				var xTotal=$('#xTotal');//总价
				
				var a=parseFloat(goods_price.val());
				var c=parseFloat(emd_postage.val());
				var d=parseFloat(order_price.val());
				var z=parseFloat(goods_count.val());
				order_total.val((a*z));
				xPrice.html("¥"+(a*z));
				xTotal.html("¥"+(a*z-xCoupan+c))
				order_price.val(a*z-xCoupan+c);
			}
			//优惠券
			$("#coupon_num").blur(function(){
				
				var goods_price=$('#goods_price').val();//单价
				var goods_count=$('#goods_count').val();//数量
				var order_total=goods_price*goods_count;
				var coupon_num=$('#coupon_num').val();
				var index=layer.load();
				$.ajax({
					type : "GET",
					dataType: "json",
					//contentType: "application/json;charset=UTF-8",
					url : '/html/order/coupan',
					data : {coupon_num:coupon_num,order_total:order_total},
					success : function(obj) {
						layer.close(index);
						if(obj.code=="${SysStatusCode.SUCCESS}"){
							$('#coupon_price').val(obj.data);
							$('#xCoupan').html('¥-'+obj.data);
							$('.payInfo').removeClass("dis-n");
							ShopCart(obj.data);
						}else{
							$('.payInfo').addClass("dis-n");
							layer.msg(obj.msg);
						}
					},error:function(){
						layer.close(index);
					}
				});
					 
			});
			
			ShopCart(0);
			
		});
		
	</script>
</body>
</html>