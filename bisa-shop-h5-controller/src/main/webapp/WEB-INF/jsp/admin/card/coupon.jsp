<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="com.bisa.health.shop.entity.SysStatusCode" %>
<%@ page import="com.bisa.health.shop.enumerate.CouponTypeEnum" %>
<%@ page import="com.bisa.health.shop.enumerate.ActivateEnum" %>
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
		<a class="layui-btn layui-btn-normal layui-btn-sm" lay-event="disable"><spring:message code='disable' /></a>
		<a class="layui-btn layui-btn-normal layui-btn-sm" lay-event="send"><spring:message code='4004' /></a>
    </script>
       <script type="text/html" id="couponStatus">
        {{# if(d.coupon_status=="${ActivateEnum.ACTIVATE.getValue()}"){ }}
       		<span style="color: #F581B1;">正常</span>
        {{#  }else{ }}
 			<span style="color: #F581B1;">停用</span>
		{{#  } }}
    </script>
    
        </script>
       <script type="text/html" id="couponType">
        {{# if(d.coupon_type=="${CouponTypeEnum.DISRATE.getValue()}"){ }}
       		<span style="color: #F581B1;">折扣卷</span>
        {{#  }else{ }}
 			<span style="color: #F581B1;">满减卷</span>
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
                    搜索区
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
                                        <option value="coupon_num">卡号</option>
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
                                      <button type="button" class="layui-btn layui-btn-sm layui-btn-primary btn-add">新增优惠券</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <p class="f-18 pt-15 pb-15 mt-40 col-8d969d">
                                  列表区
                </p>
                <div class="clear pd-15 bg-fafafa bor bor-col-e8ebf2">
                    <table id="mTable" lay-filter="mTable"></table>
                </div>
            </div>
        </div>
        
      <%--Send Dialog--%>
        <div class="send-box dis-n">
        	<div class="site-text site-block">
	          	 <form class="layui-form"  id="send-form" lay-filter="send-form">
	                <input name="id" type="hidden" value="0" />
	             
	                <div class="layui-form-item ">
	                    <label class="layui-form-label">区号</label>
					    <div class="layui-input-inline">
					      <input type="hidden" name="number" id="number" value="" >
					      <select id="selectpicker" name="selectpicker" lay-verify="required" lay-filter="selectpicker">
					      </select>
					    </div>
	                    <label class="layui-form-label">接收人电话</label>
	                    <div class="layui-input-inline">
	                        <input type="text" name="phone" autocomplete="off" placeholder="请输入接收人电话"  class="layui-input">
	                    </div>
	                </div>
	                 <div class="layui-form-item ">
	                    <label class="layui-form-label">接收人邮箱</label>
	                    <div class="layui-input-block">
	                        <input type="text" name="email" autocomplete="off"  placeholder="请输入接收人邮箱"  class="layui-input">
	                    </div>
	                </div>
	               
	                <div class="layui-form-item">
	                    <div class="text-center pd-20">
	                        <button class="layui-btn" lay-submit lay-filter="send_submit" ><spring:message code='submit' /></button>
	                        <button type="reset" class="layui-btn layui-btn-primary"><spring:message code='reset' /></button>
	                    </div>
	                </div>
	            </form>
			</div>
        </div><!-- end 弹框 -->
        
        <%--详情Dialog--%>
        <div class="mainDialog dis-n">
        	<div class="site-text site-block">
	            <form class="layui-form"  id="mainForm" lay-filter="form" >
	                <input name="id" type="hidden"   value="0" />
	                 <input name="version" id="version" type="hidden"   value="0" />
	                 <input name="user_id" id="user_id"   type="hidden" value="0" />
	                  <input name="coupon_num" id="coupon_num"   type="hidden" value="0" />
	                
	                <div class="layui-form-item">
	                    <label class="layui-form-label">新增数量</label>
	                    <div class="layui-input-inline">
	                    	<input type="text"  id="version" name="version"  lay-verify="required|number"  placeholder="请输入标题" autocomplete="off" class="layui-input">
	                    </div>
	                    
	                </div>
	                
	                  <div class="layui-form-item">
	                    <label class="layui-form-label">优惠券类型</label>
	                    <div class="layui-input-inline">
	                    	   <select id="coupon_type" name="coupon_type" lay-filter="coupon_type" lay-verify="required">
	                            	<option value="${CouponTypeEnum.DISRATE.getValue()}">折扣卷</option>
	                            	<option value="${CouponTypeEnum.TOTAL.getValue()}">满减卷</option>
	                            </select>
	                    </div>
	                     <label class="layui-form-label">状态</label>
	                    <div class="layui-input-inline">
	                             <select id="coupon_status" name="coupon_status" lay-verify="required">
	                            	<option value="${ActivateEnum.ACTIVATE.getValue()}">正常</option>
	                            	<option value="${ActivateEnum.INACTIVATED.getValue()}">停用</option>
	                            </select>
	                    </div>
	             
	                </div>
	                <div class="layui-form-item div-disrate">
	                  	 <label class="layui-form-label">折扣优惠券</label>
	                    <div class="layui-input-inline">
	                    	 <select name="coupon_disrate" lay-verify="required|number">
						        <option value="0.1">0.1</option>
						        <option value="0.2">0.2</option>
						        <option value="0.3">0.3</option>
						        <option value="0.4">0.4</option>
						        <option value="0.5">0.5</option>
						        <option value="0.6">0.6</option>
						        <option value="0.7">0.7</option>
						        <option value="0.8">0.8</option>
						        <option value="0.9">0.9</option>
						      </select>
	                    </div>
	                </div>
	                <div class="layui-form-item div-total dis-n">
	                    <label class="layui-form-label layui-col-md3">满减优惠券</label>
	                    <div class="layui-input-inline">
	                        <input   type="text" name="coupon_total" value="0"  lay-verify="required|number" placeholder="请输入满减总价"  class="layui-input">
	                    </div>
	                      <label class="layui-form-label layui-col-md3">减的价格</label>
	                    <div class="layui-input-inline">
	                         <input   type="text" name="coupon_disprice" value="0" lay-verify="required|number" placeholder="请输入减的价格" autocomplete="off" class="layui-input">
	                    </div>
	                </div>
	               
	                 <div class="layui-form-item">
	                    <div class="text-center pd-20">
	                        <button class="layui-btn" lay-submit lay-filter="sendCoupon" ><spring:message code='submit' /></button>
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
     
       	form.on('submit(create)', function(data){
       		layer.load();
       		$.ajax({
				type : "POST",
				dataType: "json",
				//contentType: "application/json;charset=UTF-8",
				url : '/admin/coupon/ajax/add',
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
					
				}
			});
	
       		return false;
       	});
       
     	form.on('submit(send_submit)', function(data){
       		layer.load();
       		$.ajax({
				type : "POST",
				dataType: "json",
				//contentType: "application/json;charset=UTF-8",
				url : '/admin/coupon/ajax/send',
				data : data.field,
				success : function(data) {
					layer.closeAll();
					if(data.code=="${SysStatusCode.SUCCESS}"){
						showMessage(data.msg);
					}
					
				}
			});
	
       		return false;
       	});
       	

  		form.on('submit(search)', function(data){
       		
  			 var incontent = data.field.incontent;
             var searchabout = data.field.searchabout;

         	tableIns.reload({page:{curr:1},where: {
                 	vKey: searchabout,
                 	vVal: incontent
             }});
             return false;
       	});
       	
  		form.on('select(coupon_type)',function(data){
  			
  			swithType(data.value);
  			
  		})
  		
  		$('.btn-refresh').click(function(){
  			tableIns.reload({page:{curr:1},where: {
             	vKey: "",
             	vVal: ""
         	}});
  		});
  		
  		
  		$('.btn-add').click(function(){
  			openDialog('form',$('.mainDialog'),{id:0});
  		});
   
        //=================执行渲染==================
        var tableIns =table.render({
            elem: '#mTable', //指定原始表格元素选择器（推荐id选择器）
            url: '/admin/coupon/ajax/list',
            method:'GET',
            page:{layout:	['prev', 'page', 'next'],limit:10},
            cols: [
                [ //标题栏
                        {field: 'id', title: 'ID', width: '5%', align: 'center'},
                        {field: 'coupon_num', title: '优惠券编号', width: '20%', align: 'center'},
                        {field: 'coupon_type', title: '优惠券类型',width: '10%', sort:true, align: 'center' ,templet:'#couponType'},
                        {field: 'coupon_status', title: '状态',width: '8%',  sort:true,align: 'center',templet:'#couponStatus'},
                        {field: 'coupon_disrate', title: '优惠券折扣率',width: '8%',  align: 'center'},
                        {field: 'coupon_total', title: '优惠券总价', width: '10%', align: 'center'},
                        {field: 'coupon_disprice', title: '满减价', width: '10%', align: 'center'},
                        {field: 'c_time', title: '创建时间', width: '12%',sort:true, align: 'center'},
                        {fixed: 'right', title: "<spring:message code='opt' />", width: '20%', align: 'center', toolbar: '#barDemo'}                  
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
           if(layEvent == 'disable'){
        	   if(data.coupon_status!="${ActivateEnum.ACTIVATE.getValue()}"){
          		 return false;
          		}
        		swithType(data.coupon_type);
            		layer.confirm('是否禁用此优惠券？',{
          			  btn: ["<spring:message code='submit' />"] //按钮
          			  ,title:"警告"
          			}, function(index){
          				var loadIndex=layer.load();
          				$.ajax({
          					type : "POST",
          					dataType: "json",
          					data:{id:data.id,status:"${ActivateEnum.INACTIVATED.getValue()}"},
          					//contentType: "application/json;charset=UTF-8",
          					url : '/admin/coupon/ajax/disable',
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
            
        	   
        	   
            }else if(layEvent == 'send'){
            	
            	if(data.coupon_status!="${ActivateEnum.ACTIVATE.getValue()}"){
            		 showMessage("<spring:message code='4003' />");
            	}else{
            		layer.open({
                        title: "<spring:message code='add' />"//弹框标题
                        , content:$('.send-box')//也可以是一个html
                        , area: ['700', '400']
        		         ,closeBtn: 1
        		         ,shadeClose:true
        		         ,type: 1
        		      	,shade: 0 
        		     	,success:function(layero,index){
        		     		$('#number').val(data.coupon_num);
                		}
                    });
            	}
            	
            	
            }
            
          
        });
        
        function swithType(value){
        	if(value=="${CouponTypeEnum.DISRATE.getValue()}"){
  				$('.div-disrate').removeClass('dis-n');
  				$('.div-total').addClass('dis-n');
  			}else{
  				$('.div-disrate').addClass('dis-n');
  				$('.div-total').removeClass('dis-n');
  			}
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