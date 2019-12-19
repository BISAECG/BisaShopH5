<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="com.bisa.health.shop.entity.SysStatusCode" %>
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
    <script type="text/html" id="barDemo">
		<a class="layui-btn layui-btn-sm layui-btn-danger" lay-event="view"><spring:message code='view' /></a>
        <a class="layui-btn layui-btn-sm layui-btn-danger" lay-event="delete"><spring:message code='delete' /></a>
    </script>
    <script type="text/html" id="msgType">
        {{# if(d.order_status=="1"){ }}
       		<span style="color: #F581B1;"><spring:message code="6001"/></span>
        {{# }else if(d.order_status=="2"){ }}
            <span style="color: #009688;"><spring:message code="6002"/></span>
        {{#  }else{ }}
 			<span style="color: #F581B1;"><spring:message code="6003"/></span>
		{{#  } }}
    </script>

    <style type="text/css">
    	.layui-form-label{
    		width:110px !important;
    	}
      
    </style>
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
                                    <select name="searchabout" id="searchabout" lay-verify="required" lay-search="">
                                        <option value=""><spring:message code="seach.content.input"/></option>
                                        <option value="mail"><spring:message code="6004"/></option>
                                        <option value="phone"><spring:message code="6005"/></option>
                                        <option value="name"><spring:message code="6006"/></option>
                                    </select>
                                </div>
                                <div class="layui-inline">
                                    <div class="layui-input-inline">
                                        <input type="text" id="incontent" name="incontent" lay-verify="required" autocomplete="off" class="layui-input">
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
                <p class="f-18 pt-15 pb-15 mt-40 col-8d969d">
                    	<spring:message code="list"/>
                </p>
                <div class="clear pd-15 bg-fafafa bor bor-col-e8ebf2">
                    <table id="mTable" lay-filter="mTable"></table>
                </div>
            </div>
        </div>
        
    </div>
    <!-- 弹框 -->
	<div class="message-form dis-n mg-20" id="message-form">
		<form class="layui-form" id="messageForm"  lay-filter="message-filter" >
			
		  <div class="layui-form-item">
		    <label class="layui-form-label"><spring:message code="name" /></label>
		    <div class="layui-input-inline">
		      <input type="text" name="name"  lay-verify="required"  autocomplete="off" class="layui-input">
		    </div>
		     <label class="layui-form-label"><spring:message code="category" /></label>
		    <div class="layui-input-inline">
		      <select name="message_type" id="message_type"  lay-verify="required" >
		      	   <option value="1"><spring:message code="6001"/></option>
                    <option value="2"><spring:message code="6002"/></option>
                    <option value="3"><spring:message code="6003"/></option>
		      </select>
		    </div>
		  </div>
		  <div class="layui-form-item">
		   <label class="layui-form-label"><spring:message code="tell" /></label>
		    <div class="layui-input-inline">
		      <input type="text" name="phone"  lay-verify="required"  autocomplete="off" class="layui-input">
		    </div>
		     <label class="layui-form-label"><spring:message code="email" /></label>
		    <div class="layui-input-inline">
		      <input type="text" name="mail"  lay-verify="required"  autocomplete="off" class="layui-input">
		    </div>
		  </div>
		  
		 
		  <div class="layui-form-item layui-form-text">
		    <label class="layui-form-label"><spring:message code="content" /></label>
		    <div class="layui-input-block">
		      <textarea name="message" rows="10" maxlength="1000" class="layui-textarea"></textarea>
		    </div>
		  </div>
	
		</form>
	</div>
	<!-- end 弹框 -->
    
  <script src="/resources/ctrl/layui/layui.js"></script>
	<script src="/resources/js/utils.js"></script>
    <script type="text/javascript">
        //<spring:message code="refresh"/>  页面按钮
  
     //加载layui
    layui.use(['element', 'table', 'form'], function () {
        var layer = layui.layer,
         element = layui.element,
         table = layui.table,
         form = layui.form,
         $=layui.jquery;
       	 showMessage("${message}");
 		form.on('submit(search)', function(data){
 			var incontent = data.field.incontent;
            var searchabout = data.field.searchabout;
        	tableIns.reload({page:{curr:1},where: {
                	vKey: searchabout,
                	vVal: incontent
            }});
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
            url: '/admin/book/ajax/list',
            method:'GET',
            page:{layout:	['prev', 'page', 'next'],limit:10},
            cols: [
                [ //标题栏
                        {field: 'id', title: 'ID', width: '5%', align: 'center'},
                        {field: 'name', title: '<spring:message code="6006"/>', width: '20%', align: 'center'},
                        {field: 'phone', title: '<spring:message code="6005"/>', width: '10%', align: 'center'},
                        {field: 'message_type', title: '<spring:message code="6007"/>', width: '10%', align: 'center',templet:'#msgType'},
                        {field: 'message', title: '<spring:message code="content"/>', width: '30%', align: 'center'},
                        {field: 'c_time', title: '<spring:message code="time"/>',width: '10%',  align: 'center'},
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
                // 删除这里有个BUG就是单页删除完后需要手动刷新
                var id = data.id;
                layer.confirm("<spring:message code='submit.delete' />", {
        			  btn: ["<spring:message code='submit' />"] //按钮
    			  ,title:"<spring:message code='tip'/>"
    			},function (index) {
                    $.ajax({
                        url: '/admin/book/ajax/del/'+id,
                        type: "DELETE",
                        success: function (data) {
                        	
                        	if(data.code=="${SysStatusCode.SUCCESS}"){
                        		layer.closeAll();
        						tableIns.reload({page:{curr:1}});
                        	}
                        	showMessage(data.msg);
                        }
                    });
                });
            }else if(layEvent=='view'){
            	 layer.open({
                     title: "<spring:message code='view' />"//弹框标题
                     , content:$('.message-form')//也可以是一个html
                     , area: ['700', '420']
     		         ,closeBtn: 1
     		         ,shadeClose:true
     		         ,type: 1
     		      	,shade: 0 
     		     	,success:function(layero,index){
	  	   		       	form.val('message-filter',data);
	  	   		 	    form.render(null,'message-filter');
             		}
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