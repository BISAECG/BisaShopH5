<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="com.bisa.health.shop.entity.SysStatusCode" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN">
<head>
  <link rel="icon" href="/favicon/favicon.ico" type="image/x-icon"/>
    <link rel="shortcut icon" href="/favicon/favicon.ico" type="image/x-icon"/>
    <link rel="bookmark" href="/favicon/favicon.ico" type="image/x-icon"/>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=0.3, maximum-scale=1">
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
    
 	<style type="text/css">
      .layui-form-label{
    		width:130px !important;
    	}
    	.layui-input-block{
    		margin-left:130px !important;
    	}
    </style>

    <!-- 这里是自定义的表格模板   取值：{{ d.id }}  lay-event：事件name（需要监听生效）  -->
    <script type="text/html" id="barServer">
        <a class="layui-btn layui-btn-normal layui-btn-sm" lay-event="edit"><spring:message code="edit" /></a>
		<a class="layui-btn layui-btn-danger layui-btn-sm" lay-event="delete"><spring:message code="delete" /></a>
    </script>
   <!-- 表格  报告状态 中文显示 -->
        <script type="text/html" id="statusTpl">
            	{{# if(d.status == 1){ }}
                	<span style="color: #009688;"><spring:message code="1004" /></span>
            	{{# }else{ }}
                	<span style="color: #F581B1;"><spring:message code="1005" /></span>
            	{{#  } }}
        </script>
</head>

<body class="layui-layout-body">
<div class="layui-layout">
    <!-- 左侧导航区域 -->
    <%@ include file="nav.jsp" %>

    <!-- 内容主体区域 -->
    <div class="layui-body">
        <div style="padding: 15px;">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
                <legend><spring:message code="1006" />：</legend>
            </fieldset>

            <%--App更新表单--%>
            <div class="clear pd-15 bg-fafafa bor bor-col-e8ebf2 min-w-1200 ml-30">
	         
	            <div class="layui-upload layui-inline">
                        <button type="button" class="layui-btn" id="uploadFile"><spring:message code="1007" /></button>
                </div>
	            <span class="ml-60 pd-15" style="border-right: 1px solid #d5d6d8;height: 50px;margin-right: 100px"></span>
                   <form class="layui-form layui-inline" lay-filter="apkForm" id="apkForm" method="post"  >
	                    <div class="layui-inline mt-3">
	                    	<input type="hidden" name="status" value="1" />
	                        <input type="text" name="appUrl" id="appUrl" readonly="readonly" lay-verify="required " autocomplete="off"  class="layui-inline layui-input">
	                    </div>
	                     <div class="layui-inline mt-3">
	                        <input type="text" name="version" lay-verify="required " autocomplete="off" placeholder="<spring:message code="version.input" />" class="layui-inline layui-input">
	                    </div>
	                    <div class="layui-inline mt-3">
	                    	      <button class="layui-btn" lay-submit="" lay-filter="demo1"><spring:message code="submit" /></button>
	                    </div>
                    </form>
            	</div>

            <%--App更新表格--%>
            <div  class="ml-30">

                    <p class="f-20 pb-15 mt-20 col-8d969d">
                        <spring:message code="1008" />
                    </p>
                    <div class="clear pd-15 bg-fafafa bor bor-col-e8ebf2 min-w-1200">
                        <table id="appUpdate" lay-filter="table1"></table>
                    </div>
					<!-- 分页 -->
                	<div id="layer-pager" class="text-center"></div>
            </div>


            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
                <legend><spring:message code="1009" />：</legend>
            </fieldset>

            <%--App更新表格--%>
            <div  class="ml-30">

                <p class="f-20 pb-15 mt-20 col-8d969d">
                    	<spring:message code="1010" />
                </p>
                <div class="clear pd-15 bg-fafafa bor bor-col-e8ebf2 min-w-1200">
                    <table id="serverDeploy" lay-filter="tableServerFilter"></table>
                   <p class="text-right"><button type="button" class="layui-btn" id="serverClick"><spring:message code="1011" /></button></p>
                </div>
					<!-- 分页 -->
                	<div id="layer-pager-a" class="text-center"></div>
            </div>


            <%--弹框html js调用--%>
            <div class="formdetail dis-n">
	            <div class="site-text site-block">
		            <form class="layui-form"  id="serverForm" lay-filter="formServer"  method="post">
		                 <div class="layui-form-item">
		                    <label class="layui-form-label"><spring:message code="version" /></label>
		                    <div class="layui-input-inline">
		                    	<input name="status" type="hidden" value="1" />
		                    	 <input name="id" type="hidden" value="0" />
		                        <input type="text" name="version"  lay-verify="required"  placeholder="<spring:message code="1012" />" class="layui-input">
		                    </div>
		                      <label class="layui-form-label"><spring:message code="country.code" /></label>
		                    <div class="layui-input-inline">
		                        <input type="text" name="countryCode"  lay-verify="required"   placeholder="<spring:message code='country.code.input' />" class="layui-input">
		                    </div>
		                </div>
		            
		                <div class="layui-form-item">
		                    <label class="layui-form-label"><spring:message code='city.code' /></label>
		                    <div class="layui-input-inline">
		                        <input type="text" name="phoneCode" lay-verify="required"  placeholder="<spring:message code='city.code.input' />"  class="layui-input">
		                    </div>
		                      <label class="layui-form-label"><spring:message code='timezone' /></label>
		                    <div class="layui-input-inline">
		                        <select name="time_zone" id="time_zone" lay-filter="aihao">
		                            <option value=""></option>
		                              <option value="GMT-01">GMT-01</option>
		                            <option value="GMT-02" >GMT-02</option>
		                            <option value="GMT-03">GMT-03</option>
		                            <option value="GMT-04">GMT-04</option>
		                            <option value="GMT-05">GMT-05</option>
		                            <option value="GMT-06">GMT-06</option>
		                            <option value="GMT-07">GMT-07</option>
		                            <option value="GMT-08">GMT-08</option>
		                            <option value="GMT-09">GMT-09</option>
		                            <option value="GMT-10">GMT-10</option>
		                            <option value="GMT-11">GMT-11</option>
		                            <option value="GMT-12">GMT-12</option>
		                            <option value="GMT-13">GMT-13</option>
		                            <option value="GMT+00">GMT+00</option>
		                            <option value="GMT+01">GMT+01</option>
		                            <option value="GMT+02">GMT+02</option>
		                            <option value="GMT+03">GMT+03</option>
		                            <option value="GMT+04">GMT+04</option>
		                            <option value="GMT+05">GMT+05</option>
		                            <option value="GMT+06">GMT+06</option>
		                            <option value="GMT+07">GMT+07</option>
		                            <option value="GMT+08" selected>GMT+08</option>
		                            <option value="GMT+09">GMT+09</option>
		                            <option value="GMT+10">GMT+10</option>
		                            <option value="GMT+11">GMT+11</option>
		                            <option value="GMT+12">GMT+12</option>
		                            <option value="GMT+13">GMT+13</option>
		                        </select>
		                    </div>
		                    
		                </div>
		    
		    			<div class="layui-form-item">
		                    <label class="layui-form-label"><spring:message code='1013' /></label>
		                    <div class="layui-input-block">
		                        <input type="text" name="domain" lay-verify="required"  placeholder="<spring:message code='1014' />"  class="layui-input">
		                    </div>
		                </div>
		     
		                <div class="layui-form-item">
		                    <label class="layui-form-label"><spring:message code='1015' /></label>
		                    <div class="layui-input-block">
		                        <input type="text" name="shopserver" lay-verify="required"  placeholder="<spring:message code='1016' />"  class="layui-input">
		                    </div>
		                </div>
		                
		                <div class="layui-form-item">
		                    <label class="layui-form-label"><spring:message code='1065' /></label>
		                    <div class="layui-input-block">
		                        <input type="text" name="datserver" lay-verify="required"  placeholder="<spring:message code='1066' />"  class="layui-input">
		                    </div>
		                </div>
		                <div class="layui-form-item">
		                    <label class="layui-form-label"><spring:message code='1017' /></label>
		                    <div class="layui-input-block">
		                        <input type="text" name="cn_country"  lay-verify="required"  placeholder="<spring:message code='1018' />"  class="layui-input">
		                    </div>
		                </div>
		                
		                 <div class="layui-form-item">
		                    <label class="layui-form-label"><spring:message code='1019' /></label>
		                    <div class="layui-input-block">
		                        <input type="text" name="hk_country" lay-verify="required" placeholder="<spring:message code='1020' />"  class="layui-input">
		                    </div>
		                </div>
		                
		                 <div class="layui-form-item">
		                    <label class="layui-form-label"><spring:message code='1021' /></label>
		                    <div class="layui-input-block">
		                        <input type="text" name="en_country"  lay-verify="required"  placeholder="<spring:message code='1022' />"  class="layui-input">
		                    </div>
		                </div>
		              
						<div class="layui-form-item pt-20">
		                    <div class="text-center">
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

</div>

<script src="/resources/js/comm/jquery.min.js"></script>
<script src="/resources/ctrl/layui/layui.js"></script>

<script>

    //加载layui
    layui.use(['element', 'table', 'upload','form','laypage'], function () {
        var layer = layui.layer,
         element = layui.element,
         table = layui.table,
         upload = layui.upload,
         form = layui.form,
         laypage = layui.laypage,
         $=layui.jquery;
         
         
         upload.render({
         	elem: '#uploadFile' //绑定元素
         	,url: '/admin/common/upload'
         	,accept: 'file'
         	,exts: 'apk'
         	,data:{'suffix':'apk'}
         	,before: function(obj){ //obj参数包含的信息，跟 choose回调完全一致，可参见上文。
         	    layer.load(); //上传loading
             }
         	,done: function(res){
         		layer.closeAll('loading');
         		if(res.code=="${SysStatusCode.SUCCESS}"){
         			$("#appUrl").val(res.data);
				}
				showMessage(res.msg);
         	 }
         	 ,error: function(e){
         		layer.closeAll('loading');
         	 }
     	});
         //更新Server
     	form.on('submit(create)', function(data){
     		
     		
       		$.ajax({
				type : "POST",
				dataType: "json",
				//contentType: "application/json;charset=UTF-8",
				url : '/admin/ajax/uploadserver',
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
     	//更新App
     	form.on('submit(demo1)', function(data){
     		
       		$.ajax({
				type : "POST",
				dataType: "json",
				//contentType: "application/json;charset=UTF-8",
				url : '/admin/ajax/uploadapp',
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
         
        /*表格渲染*/
        var tableInsApp = table.render({
            elem: '#appUpdate', //id选择器
            url: '/admin/ajax/app/list',//返回的数据格式layui官方有规定  https://www.layui.com/demo/table/user/?page=1&limit=30 此URL参考
    	  	cellMinWidth: 50,
            page:{layout:	['prev', 'page', 'next'],limit:10},
            cols: [
                [ //标题栏  toolbar:自定义模板
                    {field: 'id', title: "<spring:message code='id' />",  align: 'center'},
                    {field: 'appUrl', title: "<spring:message code='url' />",hide:true, align: 'center'},
                    {field: 'fileName', title: "<spring:message code='filename' />", hide:true,width: 250, align: 'center',event:'pductIntroduce'},
                    {field: 'status', title: "<spring:message code='status' />", align:'center',templet: '#statusTpl'},
                    {field: 'version', title: "<spring:message code='version' />", align:'center'},
                	{title: "<spring:message code='opt' />", width: 150, toolbar: '#barDemo', align: 'left'}
                ]
            ],
            //回调
            done: function (res, curr, count) {
		
            }
        });


        /*表格渲染*/
        var tableIns = table.render({
            elem: '#serverDeploy', //id选择器
            url: '/admin/ajax/server/list',
            cols: [
                [ //标题栏  toolbar:自定义模板
                	{field: 'id', title: 'id',  hide:true, align: 'center'},
                  	{field: 'version', title: "<spring:message code='version' />", width: 100,align: 'center'},
                    {field: 'phoneCode', title: "<spring:message code='country.code' />", width: 100, align: 'center'},
                    {field: 'countryCode', title: "<spring:message code='city.code' />",width: 100, align: 'center'},
                    {field: 'time_zone', title: "<spring:message code='timezone' />", width: 100, align: 'center'},
                    {field: 'en_country', title: "<spring:message code='1021' />", width: 100, align: 'center'},
                    {field: 'cn_country', title: "<spring:message code='1017' />", width: 100, align: 'center'},
                    {field: 'hk_country', title: "<spring:message code='1019' />", width: 100, align: 'center'},
                    {field: 'domain', title: "<spring:message code='1013' />", width: 300, align: 'center'},
                    {field: 'shopserver', title: "<spring:message code='1015' />", width: 300, align: 'center'},
                    {title: "<spring:message code='opt' />", width: 150, toolbar: '#barServer', align: 'left'}
                ]
            ],
            //回调
            done: function (res, curr, count) {
				 laypage.render({
	                 elem: 'layer-pager-a' //分页容器的id
	                 ,count: res.count //总页数
	                 ,skin: '#1E9FFF' //自定义选中色值
	                ,prev: '<em>←</em>'
	                ,next: '<em>→</em>'
	                ,curr:curr
	                ,limit:res.size
	               });

            }
        });


        /*监听*/
        table.on('tool(tableServerFilter)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
        		
        
        	  var data = obj.data; // 获得当前行数据
	          var layEvent = obj.event; // 获得 lay-event 对应的值
	          var tr = obj.tr; // 获得当前行 tr 的DOM对象
	          if(layEvent=='edit'){
	        	  
	              $("#time_zone option[selected=selected]").removeAttr("selected", false);
	              $("#time_zone option[value='"+data.time_zone+"']").attr("selected", true);
	            	openDialog('formServer',".formdetail",data);
	      
	          }else if(layEvent=='delete'){
	        	  $.get("/admin/ajax/server/delete?id="+data.id, function(result){
	        		  table.reload('serverDeploy',{url: '<%=request.getContextPath()%>/admin/ajax/server/list'});
	        	  });
	          }
	            
        });
        
    
        $("#serverClick").click(function () {
        	openDialog('formServer',".formdetail",null);
        })
        

        function openDialog(formName,formHtml,data){
       	 layer.open({
                title: "<spring:message code='add' />"//弹框标题
                , content: $(formHtml).html()//也可以是一个html
                , area: ['700', '600']
		         ,closeBtn: 1
		         ,shadeClose:true
		         ,type: 1
            });
       	 	if(data!=null){
       	 	 form.val(formName,data);
       	 	}else{
       	 	 form.val(formName,{id:0});
       	 	}
	         form.render(null,formName);
       	 
     		
       }
        
        
            /*弹框*/
        $("#uploadApp").click(function () {

            layer.open({
                title: "<spring:message code='1006' />"//弹框标题
                , content: $(".appformdetail").html()//也可以是一个html
                , area: ['700px', '400px']
                , btn: ['<spring:message code="close" />']
                , yes: function (index, layero) {
                    layer.close(index);        
                   
                }
            })
          
        })
        
           /*异常信息*/
        function showMessage(msg) {
        	if(msg!=''){
        		layer.msg(msg);
        	}
        	
        }
    
})


</script>
</body>
</html>