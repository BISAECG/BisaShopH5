<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN">
<head>
    <link rel="icon" href="Images/favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="Images/favicon.ico" type="image/x-icon" />
    <link rel="bookmark" href="Images/favicon.ico" type="image/x-icon" />
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
    <script src="/resources/js/comm/jquery.min.js"></script>
	<script src="/resources/ctrl/layui/layui.js"></script>
	<script src="/resources/js/utils.js"></script>
    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-normal layui-btn-sm" lay-event="edit"><spring:message code='edit' /></a>
 		<a class="layui-btn layui-btn-normal layui-btn-sm" lay-event="generate"><spring:message code='1063' /></a>
  		<a class="layui-btn layui-btn-danger layui-btn-sm" lay-event="delete"><spring:message code='delete' /></a>
    </script>
    
   <script type="text/html" id="temp_time">
 		{{# return javaToJsDateTime(d.update_time); }} 
	</script>
	
	      <script type="text/html" id="tempType">
        {{# if(d.type ==1){ }}
       		<span style="color: #009688;"><spring:message code='1037' /></span>
        {{# }else{ }}
            <span style="color: #F581B1;"><spring:message code='1038' /></span>
        {{#  } }}
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
                        	<button type="button" id="addPage" class="layui-btn"><spring:message code='1032' /></button>
                        </div>
                    </div>
                </div>
        </div>
        <div style="padding:0px 30px 30px 30px;">
            <p class="f-18 pt-15 pb-15  col-8d969d">
                <spring:message code='1033' />
            </p>
            <div class="clear pd-15 bg-fafafa bor bor-col-e8ebf2">
                <table id="keywordlist" lay-filter="test"></table>
                    <!-- 分页 -->
             	<div id="layer-pager" class="text-center"></div>
            </div>
        
        </div>
        <div class="clear pd-15 bg-fafafa bor bor-col-e8ebf2">
            <form class="layui-form" action="">
                <div class="layui-form-item mb-0" pane="">
                    <div class="layui-input-block">
                        <div class="layui-inline">
                            <button type="button" class="layui-btn layui-btn-sm" lay-submit="" id="allhtml"><spring:message code='1034' /></button>
                            <button type="button" class="layui-btn layui-btn-sm btn-head" id="headhtml"><spring:message code='1035' /></button>
                            <button type="button" class="layui-btn layui-btn-sm btn-footer" id="foothtml"><spring:message code='1036' /></button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <%--弹框html js调用--%>
        <div class="formsetting dis-n">
        	<div class="site-text site-block">
	            <form class="layui-form"  id="serverForm"  lay-filter="formServer"  method="post">
	                <input name="id" type="hidden" value="0" />
	                <div class="layui-form-item ">
	                    <label class="layui-form-label" style="width: 110px;"><spring:message code='url' /></label>
	                    <div class="layui-input-inline">
	                    	 <select name="name" lay-verify="required">
	   							<c:forEach items="${list}" var="p">
	   							   <option value="${p}">${p}</option>
	   							</c:forEach>
	                          </select>
	                    </div>
	                    <label class="layui-form-label" style="width: 80px;"><spring:message code='sort' /></label>
	                    <div class="layui-input-inline" style="width: 80px;">
	                            <select name="order_id" lay-verify="required">
	                                <option value=""><spring:message code='select' /></option>
	                                <option value="1">1</option>
	                                <option value="2">2</option>
	                                <option value="3">3</option>
	                                <option value="4">4</option>
	                                <option value="5">5</option>
	                                <option value="6">6</option>
	                            </select>
	                    </div>
	                    
	                     <label class="layui-form-label" style="width: 80px;"><spring:message code='sort' /></label>
	                    <div class="layui-input-inline" style="width: 80px;">
	                            <select name="type" lay-verify="required">
	                                <option value="1"><spring:message code='1037' /></option>
	                                <option value="0"><spring:message code='1038' /></option>
	                            </select>
	                    </div>
	                </div>
	                <div class="layui-form-item ">
	                    <label class="layui-form-label" style="width: 110px;padding-left:0px;"><spring:message code='1039' /></label>
	                    <div class="layui-input-inline">
	                        <input type="text" name="html_title_CN"  lay-verify="required" placeholder="<spring:message code='1040' />"  class="layui-input">
	                    </div>
	                    <label class="layui-form-label " style="width: 110px;padding-left: 0px;"><spring:message code='1041' /></label>
	                    <div class="layui-input-inline">
	                        <input type="text" name="column_name_CN"  placeholder="<spring:message code='1042' />"  class="layui-input">
	                    </div>
	                </div>
	                <div class="layui-form-item">
	                    <label class="layui-form-label " style="width: 110px;padding-left:0px;"><spring:message code='1043' /></label>
	                    <div class="layui-input-inline">
	                        <input type="text" name="html_title_HK"  lay-verify="required"  placeholder="<spring:message code='1044' />"  class="layui-input">
	                    </div>
	                    <label class="layui-form-label " style="width: 110px;padding-left: 0px;"><spring:message code='1045' /></label>
	                    <div class="layui-input-inline">
	                        <input type="text" name="column_name_HK"  lay-verify="required"  placeholder="<spring:message code='1046' />"  class="layui-input">
	                    </div>
	                </div>
	                <div class="layui-form-item">
	                    <label class="layui-form-label " style="width: 110px;padding-left:0px;"><spring:message code='1047' /></label>
	                    <div class="layui-input-inline">
	                        <input type="text" name="html_title_US"  lay-verify="required"  placeholder="<spring:message code='1048' />"  class="layui-input">
	                    </div>
	                    <label class="layui-form-label " style="width: 110px;padding-left: 0px;"><spring:message code='1049' /></label>
	                    <div class="layui-input-inline">
	                        <input type="text" name="column_name_US"  lay-verify="required"  placeholder="<spring:message code='1050' />"  class="layui-input">
	                    </div>
	                </div>
	                <div class="layui-form-item">
	                    <label class="layui-form-label " style="width: 110px;padding-left:0px;padding-right: 0px;"><spring:message code='1051' /></label>
	                    <div class="layui-input-block">
	                        <input type="text" name="html_keyWord_CN"  placeholder="<spring:message code='1052' />"  class="layui-input">
	                    </div>
	                </div>
	                <div class="layui-form-item">
	                    <label class="layui-form-label " style="width: 110px;padding-left: 0px;padding-right: 0px;"><spring:message code='1053' /></label>
	                    <div class="layui-input-block">
	                        <input type="text" name="html_keyWord_HK"  lay-verify="required"  placeholder="<spring:message code='1054' />"  class="layui-input">
	                    </div>
	                </div>
	                <div class="layui-form-item">
	                    <label class="layui-form-label " style="width: 110px;padding-left: 0px;padding-right: 0px;"><spring:message code='1055' /></label>
	                    <div class="layui-input-block">
	                        <input type="text" name="html_keyWord_US"  lay-verify="required"  placeholder="<spring:message code='1056' />"  class="layui-input">
	                    </div>
	                </div>
	                <div class="layui-form-item">
	                    <label class="layui-form-label " style="width: 110px;padding-left: 0px;"><spring:message code='1057' /></label>
	                    <div class="layui-input-block">
	                        <input type="text" name="html_description_CN"   lay-verify="required" placeholder="<spring:message code='1058' />"  class="layui-input">
	                    </div>
	                </div>
	                <div class="layui-form-item">
	                    <label class="layui-form-label " style="width: 110px;padding-left: 0px;"><spring:message code='1059' /></label>
	                    <div class="layui-input-block">
	                        <input type="text" name="html_description_HK"  lay-verify="required"  placeholder="<spring:message code='1060' />"  class="layui-input">
	                    </div>
	                </div>
	                <div class="layui-form-item">
	                    <label class="layui-form-label " style="width: 110px;padding-left: 0px;"><spring:message code='1061' /></label>
	                    <div class="layui-input-block">
	                        <input type="text" name="html_description_US"  lay-verify="required"  placeholder="<spring:message code='1062' />"  class="layui-input">
	                    </div>
	                </div>
	                <div class="layui-form-item">
	                    <div class="text-center">
	                        <button class="layui-btn" lay-submit="" lay-filter="create" id="create"><spring:message code='submit' /></button>
	                        <button type="reset" class="layui-btn layui-btn-primary"><spring:message code='reset' /></button>
	                    </div>
	                </div>
	            </form>
			</div>
        </div>
        <!-- 对话框结束 -->
    </div>
</div>

<script type="text/javascript">


    /*layui方面js*/
    layui.use(['form', 'table','upload', 'element'], function () {
        var form = layui.form,
            layer = layui.layer,
            element = layui.element,
            table = layui.table,
          	upload = layui.upload,
        	laypage = layui.laypage,
        	$=layui.jquery;

        //=================执行渲染==================
        var tableIns =table.render({
            elem: '#keywordlist', //指定原始表格元素选择器（推荐id选择器）
            id: 'keywordlist',
            url: '/admin/page/ajax/list',
            limit: 10,
            method:'GET',
            page:{layout:	['prev', 'page', 'next'],limit:10},
            cols: [
                [ //标题栏1065
                    {type: 'numbers'},
                    {field: 'type', title: '<spring:message code='1067' />', width: 100,sort: true, align: 'center',templet:'#tempType'},
                    {field: 'name', title: "<spring:message code='url' />", width: 200, align: 'center'},
                    {field: 'column_name_CN', title: "<spring:message code='1041' />", width: 200, align: 'center'},
                    {field: 'column_name_HK', title: "<spring:message code='1039' />", width: 200, align: 'center'},
                    {field: 'column_name_US', title: "<spring:message code='1043' />", width: 200, align: 'center'},
                    {field: 'update_time', title: "<spring:message code='modify.time' />", width: 200, sort: true, align: 'center',templet:'#temp_time'},
                    {field: 'order_id', title: "<spring:message code='sort' />", width: 200,  align: 'center'},
                    {fixed: 'right', title: "<spring:message code='opt' />", width: 250, align: 'center', toolbar: '#barDemo'}
                ]
            ],
            done: function (res, curr, count) {
                 	
            }
        });
        
    	form.on('submit(create)', function(data){
       		
       		$.ajax({
				type : "POST",
				dataType: "json",
				//contentType: "application/json;charset=UTF-8",
				url : '/admin/page/ajax/save',
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
        
        // ===============监听工具条===================
          table.on('tool(test)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data; // 获得当前行数据
            var layEvent = obj.event; // 获得 lay-event 对应的值
            var tr = obj.tr; // 获得当前行 tr 的DOM对象
            console.log(data.id)
            if (layEvent == 'edit') {
                // 编辑
            	openDialog(data);
                
            }else if(layEvent == 'delete'){
                // 删除
                var id = data.id;
                layer.confirm("<spring:message code='submit.delete' />", function (index) {
                    $.ajax({
                        url: '/admin/page/ajax/'+id,
                        type: "DELETE",
                        success: function (data) {
                            if (data.flag == true) {
                                layer.msg("<spring:message code='success' />", {icon: 6, time: 1000}, function () {
                                    obj.del();
                                    layer.close(index);
                                });
                            }
                        }
                    });
                });
            }else if(layEvent == 'generate'){
                var id = data.id;
                layer.confirm("<spring:message code='1064' />", function (index) {
                    $.ajax({
                        url: '/admin/page/ajax/'+id,
                        type: "POST",
                        success: function (data) {
                        	layer.close(index);
                        	layer.msg("<spring:message code='success' />");
                        }
                    });
                });
            }
        });
        
        function openDialog(data){
       	 layer.open({
                title: "<spring:message code='1003' />"//弹框标题
                , content: $(".formsetting").html()//也可以是一个html
                , area: ['750', '680']
		      	,closeBtn: 1
		    	,shadeClose:true
		    	,type: 1
            });
       	 if(data!=null){
       		 form.val("formServer", data); 
       	 }
            form.render();
            
       }
        
     	 
        $("#addPage").click(function(){
        	openDialog({id:0});
        });
        
        

     // 一键生成全部静态文件
         $("#allhtml").click(function () {
        	 layer.load();
             $.ajax({
                 type: "post",
                 dataType: "json",
                 url: "/admin/page/ajax/generate/all",
                 success: function (data) {
                	 layer.closeAll('loading');
                     layer.msg("<spring:message code='success' />");
                 }
             });
         })
         // 一键生成底部文件
         $("#foothtml").click(function () {
        	 layer.load();
             $.ajax({
                 type: "post",
                 dataType: "json",
                 url: "/admin/page/ajax/generate/footer",
                 success: function (data) {
                	 	layer.closeAll('loading');
                         layer.msg("<spring:message code='success' />");
                 }
             });
         })

     // 一键生成头部文件
         $("#headhtml").click(function () {
        	 layer.load();
             $.ajax({
                 type: "post",
                 dataType: "json",
                 url: "/admin/page/ajax/generate/header",
                 success: function (data) {
                	 layer.closeAll('loading');
                     layer.msg("<spring:message code='success' />");
                         
                 }
          	});
       	})
       	
       	   
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