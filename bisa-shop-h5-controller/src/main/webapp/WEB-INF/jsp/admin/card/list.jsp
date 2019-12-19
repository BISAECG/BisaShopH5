<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="com.bisa.health.shop.entity.SysStatusCode" %>
<%@ page import="com.bisa.health.shop.enumerate.CardUnitEnum" %>
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
		<a class="layui-btn layui-btn-normal layui-btn-sm" lay-event="disable"><spring:message code='disable' /></a>
		<a class="layui-btn layui-btn-normal layui-btn-sm" lay-event="activation"><spring:message code='activation' /></a>
    </script>
       <script type="text/html" id="cardStatus">
        {{# if(d.status=="${ActivateEnum.ACTIVATE.getValue()}"){ }}
       		<span style="color: #F581B1;"><spring:message code="enable"/></span>
        {{#  }else{ }}
 			<span style="color: #F581B1;"><spring:message code="disable"/></span>
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
    <div class="layui-layout">
        <!-- 左侧导航区域 -->
        <%@ include file="nav.jsp" %>
        <!-- 内容主体区域 -->
        <div class="layui-body">
            <div style="padding: 50px;">
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
                                        <option value="user_id"><spring:message code="7003"/></option>
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
                                      <button type="button" class="layui-btn layui-btn-sm layui-btn-primary btn-add"><spring:message code="7010"/></button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <p class="f-18 pt-15 pb-15 mt-40 col-8d969d">
                                  <spring:message code="list"/>
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
	                    <label class="layui-form-label"><spring:message code="7009"/></label>
					    <div class="layui-input-inline">
					      <input type="text" name="username" id="username" lay-verify="required" autocomplete="off" placeholder="<spring:message code="7003"/>"  class="layui-input">
					    </div>
	                    <div class="layui-input-inline">
	                       <button type="button" id="selectUser" class="layui-btn"><spring:message code="7001"/></button>
	                    </div>
	                </div>
	                 <div class="layui-form-item ">
	                    <label class="layui-form-label"><spring:message code="7002"/></label>
					    <div class="layui-input-inline">
					      <input type="text" name="mUsername" id="mUsername"  lay-verify="required" readonly="readonly" autocomplete="off"   class="layui-input">
					    </div>
	                </div>
	                
	                 <div class="layui-form-item">
	                    <label class="layui-form-label"><spring:message code="4024"/></label>
					    <div class="layui-input-inline">
					     <input type="checkbox" name="is_activation" lay-skin="switch" lay-text="ON|OFF">
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
        
        <%--详情Dialog--%>
        <div class="mainDialog dis-n">
        	<div class="site-text site-block">
	            <form class="layui-form"  id="mainForm" lay-filter="form" >
	                <input name="id" type="hidden"   value="0" />
	                 <div class="layui-form-item ">
	                    <label class="layui-form-label layui-col-md3"><spring:message code="virtual.service"/></label>
	                    <div class="layui-input-block">
	                       <select id="service_token" lay-filter="service_token" name="service_token" lay-verify="required">
	                       </select>
	                    </div>
	                     <div class="dis-n">
	                       <select id="dis_token" disabled="disabled" name="dis_token" lay-verify="required">
	                       </select>
	                    </div>
	                 </div>
	                 
	                 <div class="layui-form-item ">
	                    <label class="layui-form-label"><spring:message code="4022"/></label>
	                    <div class="layui-input-inline">
	                    	<input type="text"  id="card_count" name="card_count"  lay-verify="required|number"  placeholder="<spring:message code="4023"/>" autocomplete="off" class="layui-input">
	                    </div>
	                
	                    <label class="layui-form-label layui-col-md3"><spring:message code="unit"/></label>
	                    <div class="layui-input-inline">
	                       <select id="card_unit" class="card_unit"	 name="card_unit" disabled="disabled" lay-verify="required">
	                       		<option value="${CardUnitEnum.COUNT.getValue()}"><spring:message code="pcs"/></option>
	                       		<option value="${CardUnitEnum.TIME.getValue()}"><spring:message code="day"/></option>
	                       </select>
	                    </div>
	                 
	                 </div>
	                  <div class="layui-form-item">
	              		<label class="layui-form-label"><spring:message code="total"/></label>
	                    <div class="layui-input-inline">
	                    	<input type="text"  id="version" name="version"  lay-verify="required|number"  placeholder="<spring:message code="4016"/>" autocomplete="off" class="layui-input">
	                    </div>
	                     <label class="layui-form-label"><spring:message code="status"/></label>
	                    <div class="layui-input-inline">
	                             <select id="status" name="status" lay-verify="required">
	                            	<option value="${ActivateEnum.ACTIVATE.getValue()}"><spring:message code="enable"/></option>
	                            	<option value="${ActivateEnum.INACTIVATED.getValue()}"><spring:message code="disable"/></option>
	                            </select>
	                    </div>
	             
	                </div>
	               
	                 <div class="layui-form-item">
	                    <div class="text-center pd-20">
	                        <button class="layui-btn" lay-submit lay-filter="create" ><spring:message code='submit' /></button>
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
        //<spring:message code="refresh"/>  页面按钮
  
     //加载layui
    layui.use(['element', 'table', 'upload','form'], function () {
        var layer = layui.layer,
         element = layui.element,
         table = layui.table,
         upload = layui.upload,
         form = layui.form,
         $=layui.jquery;
     
       	form.on("submit(create)", function(data){
       		
       		data.field.card_unit=$('#card_unit').val();
       		layer.load();
      		$.ajax({
				type : "POST",
				dataType: "json",
				//contentType: "application/json;charset=UTF-8",
				url : '/admin/card/ajax/add',
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
 					url : '/admin/user/ajax/load',
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
       	
  		form.on('select(service_token)',function(data){
  			var unit=$("#dis_token option[value='"+data.value+"']").text();
  		  	$(".card_unit option").each(function (i,ele) {
  		  		if(ele.value==unit){
  		  		 $(this).attr("selected", true);
  		  		}else{
  		  		 $(this).attr("selected", false);
  		  		}
          	});
  			form.render('select','form');
  		})
  		
  		$('.btn-refresh').click(function(){
  			tableIns.reload({page:{curr:1},where: {
             	vKey: "",
             	vVal: ""
         	}});
  		});
  		
  		$('#selectUser').click(function(){
  			var username=$('#username').val();
  			$.ajax({
				type : "GET",
				dataType: "json",
				async: false,
				data:{username:username},
				//contentType: "application/json;charset=UTF-8",
				url : '/admin/user/ajax/load',
				success : function(obj) {
					if(obj.code=="${SysStatusCode.SUCCESS}"){
						$('#mUsername').val(obj.data);
					}
				}
			});
  			
  		});
  		
  		
  		$('.btn-add').click(function(){
  			
  			$("#service_token").empty();
  			$("#dis_token").empty();
			$.ajax({
				type : "GET",
				dataType: "json",
				async: false,
				//contentType: "application/json;charset=UTF-8",
				url : '/admin/service/ajax/list',
				success : function(obj) {
					if(obj.code=="${SysStatusCode.SUCCESS}"){
						for(var i = 0; i < obj.data.length; i++) {
							//添加option元素
							if(i==0){
								$("#card_unit").find("option[value='"+obj.data[i].serviceType+"']").attr("selected",true);
							}
							$("#dis_token").append("<option value='" + obj.data[i].stoken + "'>" + obj.data[i].serviceType + "</option>");
							$("#service_token").append("<option value='" + obj.data[i].stoken + "'>" + obj.data[i].name + "</option>");
						}
					}
				}
			});
  			
  			openDialog('form',$('.mainDialog'),{id:0});
  		});
   
        //=================执行渲染==================
        var tableIns =table.render({
            elem: '#mTable', //指定原始表格元素选择器（推荐id选择器）
            url: '/admin/card/ajax/list',
            method:'GET',
            page:{layout:	['prev', 'page', 'next'],limit:10},
            cols: [
                [ //标题栏
                        {field: 'id', title: 'ID', width: '5%', align: 'center'},
                        {field: 'card_num', title: '<spring:message code="number"/>', width: '20%', align: 'center'},
                        {field: 'card_pwd', title: '<spring:message code="password"/>',width: '10%', align: 'center' },
                        {field: 'status', title: '<spring:message code="status"/>',width: '8%',  sort:true,align: 'center',templet:'#cardStatus'},
                        {field: 'card_desc', title: '<spring:message code="desc"/>',width: '8%',  align: 'center'},
                        {field: 'card_count', title: '<spring:message code="total"/>', width: '10%', align: 'center'},
                        {field: 'card_unit', title: '<spring:message code="unit"/>', width: '10%', align: 'center',templet:'#cardUnit'},
                        {field: 'c_time', title: '<spring:message code="time"/>', width: '12%',sort:true, align: 'center'},
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
        	   if(data.status!="${ActivateEnum.ACTIVATE.getValue()}"){
        		   return false;
        	   }
        	   
            		layer.confirm('<spring:message code="submit.disable"/>',{
          			  btn: ["<spring:message code='submit' />"] //按钮
          			  ,title:"<spring:message code="warning"/>"
          			}, function(index){
          				var loadIndex=layer.load();
          				$.ajax({
          					type : "POST",
          					dataType: "json",
          					data:{id:data.id,status:"${ActivateEnum.INACTIVATED.getValue()}"},
          					//contentType: "application/json;charset=UTF-8",
          					url : '/admin/card/ajax/disable',
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
            		layer.open({
                        title: "<spring:message code='add' />"//弹框标题
                        , content:$('.send-box')//也可以是一个html
                        , area: ['700', '400']
        		         ,closeBtn: 1
        		         ,shadeClose:true
        		         ,type: 1
        		      	,shade: 0 
        		     	,success:function(layero,index){
        		     		
        		     	  	form.on('submit(activation)', function(obj){
        		           		layer.load();
        		           		obj.field.card_num=data.card_num;
        		           		obj.field.card_pwd=data.card_pwd;
        		           	    $.ajax({
        		    				type : "POST",
        		    				dataType: "json",
        		    				//contentType: "application/json;charset=UTF-8",
        		    				url : '/admin/card/ajax/activation',
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