<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="com.bisa.health.shop.entity.SysStatusCode" %>
<%@ page import="com.bisa.health.shop.enumerate.GoodsTypeEnum" %>
<%@ page import="com.bisa.health.shop.enumerate.OrderStatusEnum" %>
<%@ page import="com.bisa.health.shop.enumerate.PayEnum" %>
<%@ page import="com.bisa.health.shop.enumerate.CouponEnum" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN">
<head>
    <link rel="icon" href="favicon/favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="favicon/favicon.ico" type="image/x-icon" />
    <link rel="bookmark" href="favicon/favicon.ico" type="image/x-icon" />
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <!-- necessary -->
    <title><spring:message code="admin.domain"/></title>
    <meta name="keywords" content="<spring:message code="admin.domain"/>">
    <meta name="description" content="<spring:message code="admin.description"/>">
    <!-- description -->
    <meta name="renderer" content="webkit">
    <!-- base -->
    <link href="/resources/ctrl/layui/css/layui.css" rel="stylesheet">
    <link href="/resources/css/comm/base.css" rel="stylesheet">
    <link href="/resources/css/admin/style.css" rel="stylesheet">
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
     <style type="text/css">
    	.layui-form-label{
    		width:110px !important;
    	}
      
    </style>
    <script type="text/html" id="barDemo">
		<a class="layui-btn layui-btn-normal layui-btn-sm" lay-event="address"><spring:message code='3003' /></a>
		<a class="layui-btn layui-btn-normal layui-btn-sm" lay-event="details"><spring:message code='details' /></a>
        <a class="layui-btn layui-btn-sm layui-btn-danger" lay-event="ems"><spring:message code='3005' /></a>
    </script>
  
    <script type="text/html" id="orderStatus">
        {{# if(d.order_status=="${OrderStatusEnum.UNSHIPPED.getValue()}"){ }}
       		<span style="color: #F581B1;">未发货</span>
        {{# }else if(d.order_status=="${OrderStatusEnum.DELIVERRY.getValue()}"){ }}
            <span style="color: #009688;">已发货</span>
 		{{# }else if(d.order_status=="${OrderStatusEnum.CANCEL.getValue()}"){ }}
            <span style="color: #F581B1;">退货</span>
        {{#  }else{ }}
 			<span style="color: #F581B1;">换货</span>
		{{#  } }}
    </script>
 
</head>

<body class="layui-layout-body">
    <div class="layui-layout">
        <!-- 左侧导航区域 -->
        <%@ include file="nav.jsp" %>
        <!-- 内容主体区域 -->
        <div class="layui-body">
            <div style="padding: 50px;">
                <p class="f-18 pt-15 pb-15 col-8d969d">
                    搜索文章
                </p>
                <div class="clear pd-15 bg-fafafa bor bor-col-e8ebf2">
                    <!-- 这里用layui的数据表格的重载 -->
                    <form class="layui-form" lay-filter="form-opt">
                        <div class="layui-form-item mb-0" pane="">
                            <label class="layui-form-label f-14">搜索：</label>
                            <div class="layui-input-block">
                                <div class="layui-inline">
                                    <select name="searchabout" lay-verify="required" lay-search="">
                                        <option value="">请选择您要查询的内容</option>
                                        <option value="user_id">手机/邮箱/用户名</option>
                                        <option value="order_num">订单编号</option>
                                        <option value="order_address">发货地址</option>
                                        <option value="order_phone">联系人</option>
                                        <option value="c_time">订单时间</option>
                                        <option value="user_id">用户</option>
                                        
                                    </select>
                                </div>
                                <div class="layui-inline">
                                    <div class="layui-input-inline">
                                        <input type="text" name="incontent" lay-verify="required" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-inline">
                                    <button type="submit" class="layui-btn layui-btn-sm" lay-submit lay-filter="search">搜索</button>
                                    <button type="button" class="layui-btn layui-btn-sm btn-refresh">刷新</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <p class="f-18 pt-15 pb-15 mt-40 col-8d969d">
                    	文章列表
                </p>
                <div class="clear pd-15 bg-fafafa bor bor-col-e8ebf2">
                    <table id="mTable" lay-filter="mTable"></table>
                </div>
            </div>
        </div>
        
        <%--详情Dialog--%>
        <div class="details dis-n">
        	<div class="site-text site-block">
	            <form class="layui-form"  id="mainForm" lay-filter="form" >
	                <input name="id" type="hidden" readonly="readonly"  value="0" />
	                 <input name="address_id" id="address_id" type="hidden" readonly="readonly"  value="0" />
	                 <input name="user_id" id="user_id" readonly="readonly"  type="hidden" value="0" />
	                <div class="layui-form-item">
	                    <label class="layui-form-label">商品编号</label>
	                    <div class="layui-input-inline">
	                    	<input type="text" readonly="readonly"  name="goods_num"  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
	                    </div>
	                     <label class="layui-form-label">商品类型</label>
	                    <div class="layui-input-inline">
	                             <select id="goods_type" name="type" lay-verify="required">
	                            	<option value="${GoodsTypeEnum.REAL.getValue()}">实体</option>
	                            	<option value="${GoodsTypeEnum.VIRTUAL.getValue()}">虚拟</option>
	                            </select>
	                    </div>
	             
	                </div>
	                  <div class="layui-form-item ">
	                  	 <label class="layui-form-label">商品价格</label>
	                    <div class="layui-input-inline">
	                         <input readonly="readonly"  type="text" name="goods_price"  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
	                    </div>
	                    <label class="layui-form-label layui-col-md3">商品数量</label>
	                    <div class="layui-input-inline">
	                         <input readonly="readonly"  type="text" name="goods_count"  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
	                    </div>
	                </div>
	                <div class="layui-form-item ">
	                    <label class="layui-form-label layui-col-md3">订单编号</label>
	                    <div class="layui-input-inline">
	                        <input readonly="readonly"  type="text" name="order_num"  lay-verify="required" placeholder="请输入商品价格"  class="layui-input">
	                    </div>
	                      <label class="layui-form-label layui-col-md3">订单时间</label>
	                    <div class="layui-input-inline">
	                         <input readonly="readonly"  type="text" name="c_time"  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
	                    </div>
	                
	                </div>
	                  <div class="layui-form-item ">
	                  	 <label class="layui-form-label">订单状态</label>
	                    <div class="layui-input-inline">
	                    	<select  id="order_status" name="order_status" lay-verify="required">
	                            <option value="${OrderStatusEnum.UNSHIPPED.getValue()}">未发货</option>
	                            <option value="${OrderStatusEnum.DELIVERRY.getValue()}">已发货</option>
	                            <option value="${OrderStatusEnum.CANCEL.getValue()}">退货</option>
	                            <option value="${OrderStatusEnum.EXCHANGE.getValue()}">换货</option>
	                        </select>
	                    </div>
	                    <label class="layui-form-label layui-col-md3">支付状态</label>
	                    <div class="layui-input-inline">
	                    	<select   id="is_pay" name="is_pay" lay-verify="required">
	                    		<option value="${PayEnum.PAY.getValue()}">已付</option>
	                            <option value="${PayEnum.NOT_PAY.getValue()}">未付</option>
	                        </select>
	                    </div>
	                </div>
	                <div class="layui-form-item ">
	                    <label class="layui-form-label layui-col-md3">订单实际金额</label>
	                    <div class="layui-input-inline">
	                         <input readonly="readonly"  type="text" name="order_price"  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
	                    </div>
	                      <label class="layui-form-label layui-col-md3">订单总价</label>
	                    <div class="layui-input-inline">
	                    	<input readonly="readonly"  type="text" name="order_total"  lay-verify="required" placeholder="请输入商品价格"  class="layui-input">
	                    </div>
	                </div>
	                <div class="layui-form-item ">
	                <label class="layui-form-label layui-col-md3">优惠号码</label>
	                    <div class="layui-input-block">
	                         <input readonly="readonly"  type="text" name="coupon_num"  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
	                    </div>
	                </div>
	                  <div class="layui-form-item ">
	                  	 <label class="layui-form-label">是否优惠</label>
	                    <div class="layui-input-inline">
	                    	<select  id="is_coupon" name="is_coupon" lay-verify="required">
	                    		<option value="${CouponEnum.COUPON.getValue()}">已优惠</option>
	                            <option value="${CouponEnum.NOT_COUPON.getValue()}">未优惠</option>
	                         </select>
	                    </div>
	                     <label class="layui-form-label">优惠价格</label>
	                    <div class="layui-input-inline">
	                    	<input readonly="readonly"  type="text" name="coupon_price"  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
	                    </div>
	                </div>
	       			<div class="layui-form-item ">
	       				<label class="layui-form-label">联系电话</label>
	                    <div class="layui-input-inline">
	  							<input readonly="readonly"  type="text" name="order_phone"  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
	                    </div>
	                	<label class="layui-form-label layui-col-md3">快递单号</label>
	                    <div class="layui-input-inline">
	                         <input readonly="readonly"  type="text" name="ems_num"  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
	                    </div>
	                </div>
	                <div class="layui-form-item ">
	                	<label class="layui-form-label layui-col-md3">快递地址</label>
	                    <div class="layui-input-block">
	                         <input readonly="readonly"  type="text" name="order_address"  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
	                    </div>
	                </div>
	            </form>
			</div>
        </div><!-- end 弹框 -->
        
        
        <%--地址Dialog--%>
        <div class="address-box dis-n">
        	<div class="site-text site-block">
	          	 <form class="layui-form"  id="address-form" lay-filter="address-form">
	                <input name="id" type="hidden" value="0" />
	                <div class="layui-form-item ">
	                    <label class="layui-form-label">邮寄地址</label>
	                    <div class="layui-input-block">
	                        <input type="text" name="order_address"  lay-verify="required" placeholder="请输入商品分类名"  class="layui-input">
	                    </div>
	                </div>
	                <div class="layui-form-item ">
	                  
	                    <label class="layui-form-label">邮寄电话</label>
	                    <div class="layui-input-inline">
	                        <input type="text" name="order_phone"  lay-verify="required" placeholder="请输入商品分类名"  class="layui-input">
	                    </div>
	                </div>
	               
	                <div class="layui-form-item">
	                    <div class="text-center pd-20">
	                        <button class="layui-btn" lay-submit lay-filter="address_submit" ><spring:message code='submit' /></button>
	                        <button type="reset" class="layui-btn layui-btn-primary"><spring:message code='reset' /></button>
	                    </div>
	                </div>
	            </form>
			</div>
        </div><!-- end 弹框 -->
        
        <%--物流Dialog--%>
        <div class="ems-box dis-n">
        	<div class="site-text site-block">
	          	 <form class="layui-form"  id="ems-form" lay-filter="ems-form">
	                <input name="id" type="hidden" value="0" />
	                <div class="layui-form-item ">
	                    <label class="layui-form-label">物流状态</label>
	                    <div class="layui-input-inline">
	                       	<select  id="order_status" name="order_status" lay-filter="ems_status" lay-verify="required">
	                            <option value="${OrderStatusEnum.UNSHIPPED.getValue()}">未发货</option>
	                            <option value="${OrderStatusEnum.DELIVERRY.getValue()}">已发货</option>
	                            <option value="${OrderStatusEnum.CANCEL.getValue()}">退货</option>
	                            <option value="${OrderStatusEnum.EXCHANGE.getValue()}">换货</option>
	                        </select>
	                    </div>
	                    <label class="layui-form-label">物流单号</label>
	                    <div class="layui-input-inline">
	                        <input type="text" name="ems_num"  placeholder="请输入商品分类名"  class="layui-input">
	                    </div>
	                </div>
	               
	                <div class="layui-form-item">
	                    <div class="text-center pd-20">
	                        <button class="layui-btn" lay-submit lay-filter="ems_submit" ><spring:message code='submit' /></button>
	                        <button type="reset" class="layui-btn layui-btn-primary"><spring:message code='reset' /></button>
	                    </div>
	                </div>
	            </form>
			</div>
        </div><!-- end 弹框 -->
        
    </div>
  <script src="/resources/ctrl/layui/layui.js"></script>
	<script src="/resources/js/utils.js"></script>
    <script type="text/javascript">
        //刷新  页面按钮
  
     //加载layui
    layui.use(['element', 'table', 'upload','form'], function () {
        var layer = layui.layer,
         element = layui.element,
         table = layui.table,
         upload = layui.upload,
         form = layui.form,
         $=layui.jquery;
       	 showMessage("${message}");
     
       	form.on('submit(address_submit)', function(data){
       		layer.load();
       		$.ajax({
				type : "POST",
				dataType: "json",
				//contentType: "application/json;charset=UTF-8",
				url : '/admin/order/ajax/address',
				data : data.field,
				success : function(data) {
					layer.closeAll();
					if(data.code=="${SysStatusCode.SUCCESS}"){
						tableIns.reload({page:{curr:1},where: {
			             	vKey: "",
			             	vVal: ""
			         	}});
						showMessage(data.msg);
					}
					
				},error:function(){
					layer.closeAll();
				}
			});
	
       		return false;
       	});
       	
	form.on('submit(ems_submit)', function(data){
			layer.load();
	 		$.ajax({
				type : "POST",
				dataType: "json",
				//contentType: "application/json;charset=UTF-8",
				url : '/admin/order/ajax/ems',
				data : data.field,
				success : function(data) {
					layer.closeAll();
					if(data.code=="${SysStatusCode.SUCCESS}"){
						tableIns.reload({page:{curr:1},where: {
			             	vKey: "",
			             	vVal: ""
			         	}});
						showMessage(data.msg);
					}
					
				},error:function(){
					layer.closeAll();
				}
			});
       	return false;
       	});
	
  		form.on('submit(search)', function(data){
       		
  			 var incontent = data.field.incontent;
             var searchabout = data.field.searchabout;

             if(searchabout=="user_id"){
  	  			$.ajax({
  					type : "GET",
  					dataType: "json",
  					async: false,
  					data:{username:incontent},
  					//contentType: "application/json;charset=UTF-8",
  					url : '/admin/user/ajax/load/',
  					success : function(obj) {
  						if(obj.code=="${SysStatusCode.SUCCESS}"){
  							tableIns.reload({page:{curr:1},where: {
  		 	                	vKey: searchabout,
  		 	                	vVal: obj.data.user_guid
  		 	            	}});
  						}
  					}
  				});
  	  		
  			}else{

  	        	tableIns.reload({page:{curr:1},where: {
  	                	vKey: searchabout,
  	                	vVal: incontent
  	            }});
  			}
             return false;
       	});
  		
  		
       	
  		$('.btn-refresh').click(function(){
  			tableIns.reload({page:{curr:1},where: {
             	vKey: "",
             	vVal: ""
         	}});
         	return false;
  		});
   
        //=================执行渲染==================
        var tableIns =table.render({
            elem: '#mTable', //指定原始表格元素选择器（推荐id选择器）
            url: '/admin/order/ajax/list',
            method:'GET',
            page:{layout:	['prev', 'page', 'next'],limit:10},
            cols: [
                [ //标题栏
                        {field: 'id', title: 'ID', width: '5%', align: 'center'},
                        {field: 'order_num', title: '订单号码', width: '10%', align: 'center'},
                        {field: 'order_status', title: '订单状态',width: '10%', sort:true, align: 'center' ,templet:'#orderStatus'},
                        {field: 'is_pay', title: '支付状态',width: '8%',  sort:true,align: 'center'},
                        {field: 'coupon_price', title: '优惠价格',width: '8%',  align: 'center'},
                        {field: 'goods_price', title: '单价', width: '10%', align: 'center'},
                        {field: 'goods_count', title: '商品数量', width: '10%', align: 'center'},
                        {field: 'order_total', title: '总价',width: '10%',  align: 'center'},
                        {field: 'c_time', title: '订单时间', width: '12%',sort:true, align: 'center'},
                        {fixed: 'right', title: "<spring:message code='opt' />", width: '25%', align: 'center', toolbar: '#barDemo'}                  
                ]
            ],
            done: function (res, curr, count) {

            }
        });
        
        // ===============监听工具条===================
        table.on('tool(mTable)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
        	var data = obj.data; // 获得当前行数据
            var layEvent = obj.event; // 获得 lay-event 对应的值
            var tr = obj.tr; // 获得当前行 tr 的DOM对象
            var where=null;
           if(layEvent == 'ems'){
        	   var isOk=false;
      			
        	   if(data.order_status!="${OrderStatusEnum.UNSHIPPED.getValue()}"){
        		   isOk=true;
        	   }
        	
            	if(isOk){
            	
            		layer.confirm('此商品已经发货确认修改？',{
          			  btn: ["<spring:message code='submit' />"] //按钮
          			  ,title:"警告"
          			}, function(index){
          				 openEms(data);
          				layer.close(index);
          			});
            	}else{
            		 openEms(data);
            	}
        	   
        	   
            }else if(layEvent == 'address'){
            	
              	 layer.open({
                     title: "<spring:message code='modify' />"//弹框标题
                     , content:$('.address-box')//也可以是一个html
                     , area: ['700', '300']
     		         ,closeBtn: 1
     		         ,shadeClose:true
     		         ,type: 1
     		      	,shade: 0 
     		     	,success:function(layero,index){
	  	   		       	form.val('address-form',data);
	  	   		 	    form.render(null,'address-form');
             		}
                 });
            	 
            }else if(layEvent == 'details'){
            	openDialog('form','.details',data);
            }
            
          
        });
        
        
        function openEms(data){
    		layer.open({
                  title: "<spring:message code='modify' />"//弹框标题
                  , content:$('.ems-box')//也可以是一个html
                  , area: ['700', '300']
  		         ,closeBtn: 1
  		         ,shadeClose:true
  		         ,type: 1
  		      	,shade: 0 
  		     	,success:function(layero,index){
	  	   		       	form.val('ems-form',data);
	  	   		 	    form.render(null,'ems-form');
          		}
              });
        }

        function openDialog(formName,formHtml,data){
          	 layer.open({
                   title: "<spring:message code='add' />"//弹框标题
                   , content:$(formHtml)//也可以是一个html
                   , area: ['700', '600']
   		         ,closeBtn: 1
   		         ,shadeClose:true
   		         ,type: 1
   		      	,shade: 0 
   		     	,success:function(layero,index){
	   		       	form.val(formName,data);
	   		 	    form.render(null,formName);
           		}
               });
       
          }
    	 
        
        /*异常信息*/
        function showMessage(msg) {
        	if(msg!=''){
        		layer.msg(msg);
        	}
        	
        }
    });

    
    </script>
</body>
</html>