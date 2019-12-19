<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
      <title><spring:message code="admin.domain" /></title>
    <meta name="keywords" content="<spring:message code="admin.keyword" />">
    <meta name="description" content="<spring:message code="admin.description" />">
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
		<a class="layui-btn layui-btn-normal layui-btn-sm" lay-event="edit"><spring:message code='edit' /></a>   
        <a class="layui-btn layui-btn-danger layui-btn-sm" lay-event="delete"><spring:message code='delete' /></a>
    </script>
    

    <style type="text/css">
        .layui-table-cell{
            height: 100%;
            max-width: 100%;
        }
        .laytable-cell-1-11{
            height: 100%;
            max-width: 100%;
        }
    </style>
</head>

<body class="layui-layout-body">
<div class="layui-layout">
    <!-- 左侧导航区域 -->
    <%@ include file="nav.jsp" %>
    <!-- 内容主体区域 -->
    <div class="layui-body">
        <div class="clear pd-15 bg-fafafa bor bor-col-e8ebf2 mt-20">
            <!-- 这里用layui的数据表格的重载 -->
                <div class="layui-form-item mb-0" pane="">
                    <div class="layui-input-block">
                        <div class="layui-inline">
                        	<button type="button" id="addPage" class="layui-btn"><spring:message code="5027" /></button>
                        </div>
                    </div>
                </div>
        </div>
        <div style="padding:0px 30px 30px 30px;">
            <p class="f-18 pt-15 pb-15  col-8d969d">
                	<spring:message code="list" />
            </p>
            <div class="clear pd-15 bg-fafafa bor bor-col-e8ebf2 min-w-1200">
                 <table id="table" lay-filter="table"></table>
             </div>
        </div>
        <%--弹框html js调用--%>
        <div class="formsetting dis-n">
        	<div class="site-text site-block">
	            <form class="layui-form"  id="serverForm" lay-filter="form"  method="post">
	                <input name="id" type="hidden" value="0" />
	                <div class="layui-form-item ">
	                    <label class="layui-form-label"><spring:message code="5028" /></label>
	                    <div class="layui-input-block">
	                        <input type="text" name="inner_chain_text_CN"  lay-verify="required" placeholder="<spring:message code="5029" />"  class="layui-input">
	                    </div>
	                </div>
	                 <div class="layui-form-item ">
	                    <label class="layui-form-label"><spring:message code="5030" /></label>
	                    <div class="layui-input-block">
	                        <input type="text" name="inner_chain_text_EN"  lay-verify="required" placeholder="<spring:message code="5031" />"  class="layui-input">
	                    </div>
	                </div>
	                 <div class="layui-form-item ">
	                    <label class="layui-form-label"><spring:message code="5032" /></label>
	                    <div class="layui-input-block">
	                        <input type="text" name="inner_chain_text_HK"  lay-verify="required" placeholder="<spring:message code="5033" />"  class="layui-input">
	                    </div>
	                </div>
	                  <div class="layui-form-item ">
	                    <label class="layui-form-label"><spring:message code="5034" /></label>
	                    <div class="layui-input-block">
	                        <input type="text" name="inner_chain_url"  lay-verify="required" placeholder="<spring:message code="5035" />"  class="layui-input">
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
        </div>
        <!-- 对话框结束 -->
    </div>
</div>
<script src="/resources/js/comm/jquery.min.js"></script>
<script src="/resources/ctrl/layui/layui.js"></script>
<script src="/resources/js/utils.js"></script>
<script type="text/javascript">

        //加载layui
    layui.use(['element', 'table', 'upload','form','laypage'], function () {
        var layer = layui.layer,
         element = layui.element,
         table = layui.table,
         upload = layui.upload,
         form = layui.form,
         laypage = layui.laypage,
         $=layui.jquery;
       	 showMessage("${message}");
       	 
       	form.on('submit(create)', function(data){
       		$.ajax({
				type : "POST",
				dataType: "json",
				//contentType: "application/json;charset=UTF-8",
				url : '/admin/news/inlink/ajax/add',
				data : data.field,
				success : function(data) {
					if(data.code=="${SysStatusCode.SUCCESS}"){
						layer.closeAll();
						tableIns.reload();
					}
						showMessage(data.msg);
					
				}
			});
	
       		return false;
       	});
       	 
       	 
        //=================执行渲染==================
        var tableIns =table.render({
            elem: '#table', //指定原始表格元素选择器（推荐id选择器）
            url: '/admin/news/inlink/ajax/list',
            method:'GET',
            totalRow:true,
            page:{layout:	['prev', 'page', 'next'],limit:10},
            cols: [
                [ //标题栏
                    {type: 'numbers'},
                    {field: 'inner_chain_text_CN', title: '<spring:message code="5028" />', width: '15%', align: 'center'},
                    {field: 'inner_chain_text_EN', title: '<spring:message code="5030" />', width: '15%', align: 'center'},
                    {field: 'inner_chain_text_HK', title: '<spring:message code="5032" />', width: '15%', align: 'center'},
                    {field: 'inner_chain_url', title: '<spring:message code="5034" />', width: '27%',  align: 'center'},
                    {field: 'create_time', title: "<spring:message code='create.time' />", width: '10%', sort: true, align: 'center'},
                    {fixed: 'right', title: '<spring:message code="opt" />', width: '15%', align: 'center', toolbar: '#barDemo'}
                ]
            ],
            done: function (res, curr, count) {
            	
            
            	
            }
        });
        
        // ===============监听工具条===================
        table.on('tool(table)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
        	var data = obj.data; // 获得当前行数据
            var layEvent = obj.event; // 获得 lay-event 对应的值
            var tr = obj.tr; // 获得当前行 tr 的DOM对象
            var where=null;
           if(layEvent == 'delete'){
                // 删除这里有个BUG就是单页删除完后需要手动刷新
                layer.confirm("<spring:message code='submit.delete' />",{
        			  btn: ["<spring:message code='submit' />"] //按钮
    			  ,title:"<spring:message code='warning'/>"
    			}, function (index) {
                    $.ajax({
                        url: '/admin/news/inlink/ajax/delect/'+data.id,
                        type: "DELETE",
                        success: function (data) {
                        	
                        	if(data.code=="${SysStatusCode.SUCCESS}"){
                        		layer.closeAll();
        						tableIns.reload();
                        	}
                        	showMessage(data.msg);
                        }
                    });
                });
            }else{
            	where={id:data.id};
            }
            if(where!=null){
            	fullData(where);
            }
        });
        
        function openDialog(formName,formHtml,data){
        	$('#serverForm')[0].reset();
       	 layer.open({
                title: "<spring:message code='add' />"//弹框标题
                , content: $(formHtml)//也可以是一个html
                , area: ['750', '400']
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
        
     	 
        $("#addPage").click(function(){
        	openDialog('form','.formsetting',{id:0});
        });
        
        
        function fullData(where){
        	$.ajax({
				url: "/admin/news/inlink/ajax/load",
				type: "GET",
				data:where,
				success: function(data) {
					if(data.code=="${SysStatusCode.SUCCESS}"){
						openDialog('form','.formsetting',data.data);
		            }else{
		                openDialog('form','.formsetting',where);
		            }
				}
			})
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