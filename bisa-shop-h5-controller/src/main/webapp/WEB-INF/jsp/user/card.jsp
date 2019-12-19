<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="com.bisa.health.shop.entity.SysStatusCode" %>
<%@ page import="com.bisa.health.shop.enumerate.ActivateEnum" %>
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
		<a class="layui-btn layui-btn-normal layui-btn-sm" lay-event="delete"><spring:message code='delete' /></a>
        <a class="layui-btn layui-btn-normal layui-btn-sm" lay-event="activation"><spring:message code='activation' /></a>
    </script>
  
       <script type="text/html" id="cardStatus">
        {{# if(d.status=="${ActivateEnum.ACTIVATE.getValue()}"){ }}
       		<span style="color: #F581B1;"><spring:message code="used"/></span>
        {{#  }else{ }}
 			<span style="color: #F581B1;"><spring:message code="unused"/></span>
		{{#  } }}
    </script>
    
    </script>
       <script type="text/html" id="cardUnit">
        {{# if(d.card_unit=="${CardUnitEnum.COUNT.getValue()}"){ }}
       		<span style="color: #F581B1;"><spring:message code="pcs"/></span>
        {{#  }else{ }}
 			<span style="color: #F581B1;"><spring:message code="day"/></span>
		{{#  } }}
    </script>
 
</head>

<body class="layui-layout-body">
   <div >  
                <p class="f-18 pt-15 pb-15 col-8d969d">
                                <spring:message code="seach"/>
                </p>
                <div class="clear pd-15 bg-fafafa bor bor-col-e8ebf2">
                    <!-- 这里用layui的数据表格的重载 -->
                    <form class="layui-form" lay-filter="form-opt">
                        <div class="layui-form-item mb-0" pane="">
                            <label class="layui-form-label f-14"><spring:message code="seach"/>：</label>
                            <div class="layui-input-block">
                                <div class="layui-inline">
                                    <select name="searchabout" lay-verify="required" lay-search="">
                                        <option value=""><spring:message code="seach.content.input"/></option>
                                        <option value="card_num"><spring:message code="number"/></option>
                                        <option value="c_time"><spring:message code="time"/></option>
                                        
                                    </select>
                                </div>
                                <div class="layui-inline">
                                    <div class="layui-input-inline">
                                        <input type="text" name="incontent" lay-verify="required" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-inline">
                                    <button type="submit" class="layui-btn layui-btn-sm" lay-submit lay-filter="search"><spring:message code="seach"/></button>
                                    <button type="button" class="layui-btn layui-btn-sm btn-refresh"><spring:message code="refresh"/></button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <p class="f-18 pt-5 pb-15 mt-40 col-8d969d">
                  <spring:message code="list"/>
                </p>
                <div class="clear pd-15 bg-fafafa bor bor-col-e8ebf2">
                    <table id="mTable" lay-filter="mTable"></table>
                </div>
    </div>
    
        <%--Send Dialog--%>
        <div class="send-box dis-n">
        	<div class="site-text site-block">
	          	 <form class="layui-form"  id="send-form" lay-filter="send-form">
	                <input name="id" type="hidden" value="0" />
	               <div class="layui-form-item">
				    <div class="layui-input-block">
				      <input type="checkbox" id="is_activation" lay-filter="other-filter" name="is_activation" title="<spring:message code='7008'/>">
				    </div>
				  </div>
				  <div class="dis-n" id="otherUser">
	                <div class="layui-form-item ">
	                    <label class="layui-form-label"><spring:message code="user"/></label>
					    <div class="layui-input-inline">
					      <input type="text" name="username" id="username"  autocomplete="off" placeholder="<spring:message code='7003'/>"  class="layui-input">
					    </div>
	                    <div class="layui-input-inline">
	                       <button type="button" id="selectUser" class="layui-btn"><spring:message code="7001"/></button>
	                    </div>
	                </div>
	                 <div class="layui-form-item ">
	                    <label class="layui-form-label"><spring:message code="7002"/></label>
					    <div class="layui-input-inline">
					      <input type="text" name="mUsername" id="mUsername"  readonly="readonly" autocomplete="off"   class="layui-input">
					    </div>
	                </div>
	               </div>
	               
	                <div class="layui-form-item">
	                    <div class="text-center pd-20">
	                        <button class="layui-btn" lay-submit lay-filter="activation" ><spring:message code='submit' /></button>
	                        <button type="reset" class="layui-btn layui-btn-primary"><spring:message code='reset' /></button>
	                    </div>
	                </div>
	            </form>
			</div>
        </div><!-- end 弹框 -->
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
       	
       	form.on('checkbox(other-filter)', function(data){
       		if(data.elem.checked){
       			$('#otherUser').removeClass('dis-n');
       		}else{
       			$('#otherUser').addClass('dis-n');
       		}
      
       	});        
       	     
       	$('#selectUser').click(function(){
  			var username=$('#username').val();
  			$.ajax({
				type : "GET",
				dataType: "json",
				async: false,
				data:{username:username},
				//contentType: "application/json;charset=UTF-8",
				url : '/user/ajax/load',
				success : function(obj) {
					if(obj.code=="${SysStatusCode.SUCCESS}"){
						$('#mUsername').val(obj.data);
					}
				}
			});
  			
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
            url: '/user/card/ajax/list',
            method:'GET',
            page:{layout:	['prev', 'page', 'next'],limit:10},
            cols: [
                [ //标题栏
                    {field: 'card_num', title: '<spring:message code="number" />', width: '25%', align: 'center'},
                    {field: 'card_pwd', title: '<spring:message code="password" />',width: '15%', align: 'center' },
                    {field: 'status', title: '<spring:message code="status" />',width: '8%',  sort:true,align: 'center',templet:'#cardStatus'},
                    {field: 'card_desc', title: '<spring:message code="desc" />',width: '10%',  align: 'center'},
                    {field: 'card_count', title: '<spring:message code="total" />', width: '10%', align: 'center'},
                    {field: 'card_unit', title: '<spring:message code="unit" />', width: '10%', align: 'center',templet:'#cardUnit'},
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
            if(layEvent == 'delete'){
            	layer.confirm('<spring:message code="submit.disable" />',{
        			  btn: ["<spring:message code='submit' />"] //按钮
        			  ,title:"<spring:message code='warning' />"
        			}, function(index){
        				var loadIndex=layer.load();
        				$.ajax({
        					type : "DELETE",
        					dataType: "json",       			
        					url : '/user/card/ajax/del/'+data.id,
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
        	   
            }else if(layEvent == 'activation'){
            	if(data.status!="${ActivateEnum.ACTIVATE.getValue()}"){
           		 	showMessage("<spring:message code='4003' />");
	           	}else{
	           		$('#send-form')[0].reset();
	           		$('#otherUser').addClass('dis-n');
	           		layer.open({
	                       title: "<spring:message code='activation' />"//弹框标题
	                       , content:$('.send-box')//也可以是一个html
	                       , area: ['700', '400']
	       		         ,closeBtn: 1
	       		         ,shadeClose:true
	       		         ,type: 1
	       		      	,shade: 0 
	       		     	,success:function(layero,index){
	       		     		
	       		     	  	form.on('submit(activation)', function(obj){
	       		     	  		
	       		     	  		if ($("#is_activation").get(0).checked) {
		       		     	 	 if($('#mUsername').val()==""){
		       		     	 		 showMessage("<spring:message code='7000' />");
		       		     	 		 return false;
		       		     	 	 }
		       		     	 	}
	       		     	  		
	       		           		layer.load();
	       		           		obj.field.card_num=data.card_num;
	       		           		obj.field.card_pwd=data.card_pwd;
	       		           	    $.ajax({
	       		    				type : "POST",
	       		    				dataType: "json",
	       		    				//contentType: "application/json;charset=UTF-8",
	       		    				url : '/user/ajax/activation',
	       		    				data : obj.field,
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
	       		     		
	               		}
                   });
           		}
            	
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