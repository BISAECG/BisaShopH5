<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="com.bisa.health.shop.entity.SysStatusCode" %>
<%@ page import="com.bisa.health.shop.enumerate.GoodsTypeEnum" %>
<%@ page import="com.bisa.health.shop.enumerate.OrderStatusEnum" %>
<%@ page import="com.bisa.health.shop.enumerate.PayEnum" %>
<%@ page import="com.bisa.health.shop.enumerate.ActivateEnum" %>
<%@ page import="com.bisa.health.shop.enumerate.CouponEnum" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN">
<head>
    <link rel="icon" href="/favicon/favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="/favicon/favicon.ico" type="image/x-icon" />
    <link rel="bookmark" href="/favicon/favicon.ico" type="image/x-icon" />
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <!-- necessary -->
    <title><spring:message code="admin.domain"/></title>
    <meta name="keywords" content="<spring:message code="admin.keyword"/>">
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
		
		{{# if(d.is_pay!="${PayEnum.PAY.getValue()}"&&d.order_status=="${OrderStatusEnum.UNSHIPPED.getValue()}"&&d.status=="${ActivateEnum.ACTIVATE.getValue()}"){ }}
			<a class="layui-btn layui-btn-normal layui-btn-sm" lay-event="cancel"><spring:message code='cancel' /></a>
		{{#  } }}

		{{# if(d.order_status=="${OrderStatusEnum.DELIVERRY.getValue()}"&&d.status=="${ActivateEnum.ACTIVATE.getValue()}"){ }}
			<a class="layui-btn layui-btn-normal layui-btn-sm" lay-event="orderOk"><spring:message code='3025' /></a>
		{{#  } }}

			<a class="layui-btn layui-btn-normal layui-btn-sm" lay-event="delete"><spring:message code='delete' /></a>

		 {{# if(d.is_pay=="${PayEnum.NOT_PAY.getValue()}"&&d.status=="${ActivateEnum.ACTIVATE.getValue()}"){ }}
			<a class="layui-btn layui-btn-normal layui-btn-sm" lay-event="resetpay"><spring:message code='reset.pay' /></a>
		{{#  } }}
    </script>
    
     <script type="text/html" id="orderIsPay">
        {{# if(d.is_pay=="${PayEnum.PAY.getValue()}"){ }}
       		<span style="color: #009688;"><spring:message code='paid' /></span>
        {{#  }else{ }}
 			<span style="color: #F581B1;"><spring:message code='unpaid' /></span>
		{{#  } }}
    </script>
  
    <script type="text/html" id="orderStatus">
        {{# if(d.order_status=="${OrderStatusEnum.UNSHIPPED.getValue()}"){ }}
       		<span style="color: #F581B1;"><spring:message code='unshipped' /></span>
        {{# }else if(d.order_status=="${OrderStatusEnum.DELIVERRY.getValue()}"){ }}
            <span style="color: #009688;"><spring:message code='shipped' /></span>
 		{{# }else if(d.order_status=="${OrderStatusEnum.CANCEL.getValue()}"){ }}
            <span style="color: #F581B1;"><spring:message code='returns' /></span>
        {{# }else if(d.order_status=="${OrderStatusEnum.RECEIVED.getValue()}"){ }}
    		<span style="color: #F581B1;"><spring:message code='received' /></span>
        {{#  }else{ }}
 			<span style="color: #F581B1;"><spring:message code='exchange' /></span>
		{{#  } }}
    </script>
 
</head>

<body class="layui-layout-body">
   <div >  
                <p class="f-18 pt-15 pb-15 col-8d969d">
                    <spring:message code='seach' />
                </p>
                <div class="clear pd-15 bg-fafafa bor bor-col-e8ebf2">
                    <!-- 这里用layui的数据表格的重载 -->
                    <form class="layui-form" lay-filter="form-opt">
                        <div class="layui-form-item mb-0" pane="">
                            <label class="layui-form-label f-14"><spring:message code='seach' />：</label>
                            <div class="layui-input-block">
                                <div class="layui-inline">
                                    <select name="searchabout" lay-verify="required" lay-search="">
                                        <option value=""><spring:message code='seach.content.input' /></option>
                                        <option value="user_id"><spring:message code='7003' /></option>
                                        <option value="order_num"><spring:message code='3008' /></option>
                                        <option value="order_address"><spring:message code='address' /></option>
                                        <option value="order_phone"><spring:message code='addressee' /></option>
                                        <option value="c_time"><spring:message code='time' /></option>
                                        
                                    </select>
                                </div>
                                <div class="layui-inline">
                                    <div class="layui-input-inline">
                                        <input type="text" name="incontent" lay-verify="required" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-inline">
                                    <button type="submit" class="layui-btn layui-btn-sm" lay-submit lay-filter="search"><spring:message code='seach' /></button>
                                    <button type="button" class="layui-btn layui-btn-sm btn-refresh"><spring:message code='refresh' /></button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <p class="f-18 pt-5 pb-15 mt-40 col-8d969d">
                    	<spring:message code='list' />
                </p>
                <div class="clear pd-15 bg-fafafa bor bor-col-e8ebf2">
                    <table id="mTable" lay-filter="mTable"></table>
                </div>
    </div>
  <script src="/resources/ctrl/layui/layui.js"></script>
	<script src="/resources/js/utils.js"></script>
    <script type="text/javascript">
        //<spring:message code="refresh"/>  页面按钮
  
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
            url: '/user/order/ajax/list',
            method:'GET',
            page:{layout:	['prev', 'page', 'next'],limit:10},
            cols: [
                [ //标题栏
                        {field: 'order_num', title: '<spring:message code="3008" />', width: '20%', align: 'center'},
                        {field: 'order_status', title: '<spring:message code="status" />',width: '10%', sort:true, align: 'center' ,templet:'#orderStatus'},
                        {field: 'is_pay', title: '<spring:message code="paid.statut" />',width: '15%',  sort:true,align: 'center',templet:'#orderIsPay'},
                        {field: 'ems_num', title: '<spring:message code="3020" />', width: '20%', align: 'center'},
                        {field: 'order_total', title: '<spring:message code="price" />',width: '10%',  align: 'center'},
                        {field: 'c_time', title: '<spring:message code="time" />', width: '12%',sort:true, align: 'center'},
                        {fixed: 'right', title: "<spring:message code='opt' />", width: 'auto', align: 'center', toolbar: '#barDemo'}                  
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
            if(layEvent == 'delete'){
            	layer.confirm('<spring:message code="submit.disable" />',{
        			  btn: ["<spring:message code='submit' />"] //按钮
        			  ,title:'<spring:message code="warning" />'
        			}, function(index){
        				var loadIndex=layer.load();
        				$.ajax({
        					type : "DELETE",
        					dataType: "json",       			
        					url : '/user/order/ajax/del/'+data.id,
        					success : function(data) {
        						layer.close(loadIndex);
        						tableIns.reload({page:{curr:1},where: {
        			             	vKey: "",
        			             	vVal: ""
        			         	}});
        						 showMessage(data.msg);
        					},error:function(){
        						layer.close(loadIndex);
        					}
        				});
        			});
        	   
            }else if(layEvent=='resetpay'){
            	var loadIndex=layer.load();
      			window.open("/html/${language}/order_reset?order_num="+data.order_num);
      			setTimeout(function(){
      				tableIns.reload({page:{curr:1},where: {
      	             	vKey: "",
      	             	vVal: ""
      	         	}});
      				layer.close(loadIndex);
                }, 5000);
      	   
            }else if(layEvent=='orderOk'){
            	layer.confirm('<spring:message code="3026" />',{
      			  btn: ["<spring:message code='submit' />"] //按钮
      			  ,title:'<spring:message code="warning" />'
      			}, function(index){
      				var loadIndex=layer.load();
      				$.ajax({
      					type : "POST",
      					dataType: "json",       			
      					url : '/user/order/ajax/ok/'+data.id,
      					success : function(data) {
      						layer.close(loadIndex);
      						tableIns.reload({page:{curr:1},where: {
      			             	vKey: "",
      			             	vVal: ""
      			         	}});
      						 showMessage(data.msg);
      					},error:function(){
      						layer.close(loadIndex);
      					}
      				});
      			});
            }else if(layEvent=='cancel'){
            	layer.confirm('<spring:message code="3028" />',{
        			  btn: ["<spring:message code='submit' />"] //按钮
        			  ,title:'<spring:message code="warning" />'
        			}, function(index){
        				var loadIndex=layer.load();
        				$.ajax({
        					type : "POST",
        					dataType: "json",       			
        					url : '/user/order/ajax/cancel/'+data.id,
        					success : function(data) {
        						layer.close(loadIndex);
        						tableIns.reload({page:{curr:1},where: {
        			             	vKey: "",
        			             	vVal: ""
        			         	}});
        						 showMessage(data.msg);
        					},error:function(){
        						layer.close(loadIndex);
        					}
        				});
        			});
              }
            
          
        });
    

        
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