<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="com.bisa.health.shop.entity.SysStatusCode" %>
<%@ page import="com.bisa.health.shop.enumerate.GoodsTypeEnum" %>
<%@ page import="com.bisa.health.shop.enumerate.GoodsStatusEnum" %>
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
    <style type="text/css">
    	.layui-form-label{
    		width:110px !important;
    	}
      
    </style>
	<link href="/resources/ctrl/layui/css/layui.css" rel="stylesheet">
    <link href="/resources/css/comm/base.css" rel="stylesheet"> 
	<link href="/resources/css/admin/style.css" rel="stylesheet"> 
	
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type="text/html" id="barDemo">
		<div class="layui-btn-group">
		<a class="layui-btn layui-btn-normal layui-btn-sm" lay-event="zh_CN"><spring:message code='language.cn' /></a>
        <a class="layui-btn layui-btn-normal layui-btn-sm" lay-event="zh_HK"><spring:message code='language.hk' /></a>
		<a class="layui-btn layui-btn-normal layui-btn-sm" lay-event="en_US"><spring:message code='language.us' /></a>
		</div>
		<a class="layui-btn layui-btn-sm" lay-event="linked"><spring:message code='2007' /></a>
        <a class="layui-btn layui-btn-danger layui-btn-sm" lay-event="delete"><spring:message code='delete' /></a>
    </script>
	
	  <script type="text/html" id="goodType">
        {{# if(d.type == 0){ }}
       		<span style="color: #009688;"><spring:message code="2009" /></span>
        {{# }else{ }}
            <span style="color: #F581B1;"><spring:message code="2010" /></span>
        {{#  } }}
    </script>
    <script type="text/html" id="goodStatus">
        {{# if(d.status == "${GoodsStatusEnum.IN_SALE.getValue()}"){ }}
       		<span style="color: #009688;"><spring:message code="2020" /></span>
        {{# }else if(d.status == "${GoodsStatusEnum.SALE_OUT.getValue()}"){ }}
            <span style="color: #F581B1;"><spring:message code="2021" /></span>
        {{#  }else{ }}
 			<span style="color: #F581B1;"><spring:message code="2022" /></span>
		 {{#  } }}

    </script>
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
                        	<button type="button" id="addPage" class="layui-btn"><spring:message code="2002" /></button>
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
        <div class="dis-n" id="open-box">
        	<div class="site-text site-block">
	            <form class="layui-form"  id="mainForm" lay-filter="mainForm" >
	                <input name="id" type="hidden" value="0" />
	                 <input name="number" id="number" type="hidden" value="0" />
	                 <input name="category_name" id="category_name" type="hidden" value="0" />
	                <div class="layui-form-item ">
	                  	 <label class="layui-form-label"><spring:message code="2023" /></label>
	                    <div class="layui-input-block">
	                    	<input type="text" name="name" required="" lay-verify="required" placeholder="<spring:message code="2024" />" autocomplete="off" class="layui-input">
	                    </div>
	                </div>
	                 
	                <div class="layui-form-item">
	                    <label class="layui-form-label"><spring:message code="2037" /></label>
	                    <div class="layui-input-inline">
	                    	<input type="text" name="pattern" required="" lay-verify="required" placeholder="<spring:message code="2038" />" autocomplete="off" class="layui-input">
	                    </div>
	                    <label class="layui-form-label"><spring:message code="status" /></label>
	                    <div class="layui-input-inline">
	                         <select id="status" name="status" lay-verify="required">
	                         		<option value="${GoodsStatusEnum.IN_SALE.getValue()}"><spring:message code="2020" /></option>
	                         		<option value="${GoodsStatusEnum.SALE_OUT.getValue()}"><spring:message code="2021" /></option>
	                            	<option value="${GoodsStatusEnum.INVALID.getValue()}"><spring:message code="2022" /></option>
	                         </select>
	                    </div>
	             
	                </div>
	                  <div class="layui-form-item ">
	                  	 <label class="layui-form-label"><spring:message code="2003" /></label>
	                    <div class="layui-input-inline">
	                         <select id="category_num" name="category_num" lay-verify="required">
	                         </select>
	                    </div>
	                    <label class="layui-form-label layui-col-md3"><spring:message code='lang' /></label>
	                    <div class="layui-input-inline">
	                            <select id="language" name="language" lay-filter="language" lay-verify="required">
	                            </select>
	                    </div>
	                </div>
	         
	                <div class="layui-form-item ">
	                    <label class="layui-form-label layui-col-md3"><spring:message code="2025" /></label>
	                    <div class="layui-input-inline">
	                            <select id="goods_type"  lay-filter="goods_type"  name="type" lay-verify="required">
	                            	<option value="${GoodsTypeEnum.REAL.getValue()}"><spring:message code="2009" /></option>
	                            	<option value="${GoodsTypeEnum.VIRTUAL.getValue()}"><spring:message code="2010" /></option>
	                            </select>
	                    </div>
	                   
	                        <label class="layui-form-label layui-col-md3"><spring:message code="2026" /></label>
		                    <div class="layui-input-inline">
		                        <input type="text" name="price"  lay-verify="required" placeholder="<spring:message code="2027" />"  class="layui-input">
		                    </div>
		           
	                </div>
	                
	               <div class="layui-form-item div-service dis-n">
		                    <label class="layui-form-label layui-col-md3"><spring:message code="virtual.service" /></label>
		                    <div class="layui-input-inline">
		                            <select id="service_token" name="service_token" lay-verify="required">
		                            </select>
		                    </div>
	                </div>
	                
	                 <div class="layui-form-item ">
	                   <label class="layui-form-label" ><spring:message code="2028" /></label>
	                    <div class="layui-input-inline">
	                    	<input type="text" name="img_url"  id="img_url" readonly="readonly" lay-verify="required " autocomplete="off"  class="layui-inline img_url layui-input">
	                     
	                    </div>
	                    <div class="layui-input-inline">
							<button type="button" onclick="upPreviewFile()"  class="layui-btn">
			  					<i class="layui-icon">&#xe67c;</i><spring:message code="2022" /><spring:message code="2029" />
							</button>
	                    </div>
	              
	                </div>
	                <div class="layui-form-item ">
	                    <label class="layui-form-label"><spring:message code="2030" /></label>
	                    <div class="layui-input-block">
	                        <textarea name="description" placeholder="<spring:message code="2031" />"  lay-verify="required" class="layui-textarea"></textarea>
	                    </div>
	                </div>
	                
	                <div class="layui-form-item ">
	                    <label class="layui-form-label" ><spring:message code="2032" /></label>
	                    <div class="layui-input-inline">
	                    	<input type="text" name="detail_body" placeholder="<spring:message code="2033" />"  id="detail_body" readonly="readonly" lay-verify="required " autocomplete="off"  class="layui-inline detail_body layui-input">
	                     
	                    </div>
	                    <div class="layui-input-inline">
							<button type="button" onclick="upFile()"  class="layui-btn">
			  					<i class="layui-icon">&#xe67c;</i><spring:message code="2034" />
							</button>
	                    </div>
	                    
	                </div>
	                <div class="layui-form-item pt-20">
	                    <div class="text-center">
	                        <button class="layui-btn" lay-submit lay-filter="create" ><spring:message code='submit' /></button>
	                        <button type="reset" class="layui-btn layui-btn-primary"><spring:message code='reset' /></button>
	                    </div>
	                </div>
	            </form>
	            <div class="layui-upload-list text-center">
			       <img class="layui-upload-img imgView"/>
			    </div>
			</div>
        </div><!-- end 弹框 -->
        
        <!-- 弹框 -->
         <div class="linkdiv dis-n" id="linkdiv">
        	<div class="site-text site-block">
        		<div id="treelink" class="demo-tree-more"></div>
        	</div>
        	    <div class="layui-form-item pt-55">
	                    <div class="text-center">
	                    	<button type="button" id="isok" class="layui-btn layui-btn-normal"><spring:message code='submit' /></button>
	                    </div>
	                </div>
         </div>
        <!-- end 弹框 -->
        
		<div class="layui-upload dis-n">
		  <button type="button" class="layui-btn" id="upFile"></button>
		  <div class="layui-upload-list">
		    <img class="layui-upload-img" id="demo1">
		    <p id="demoText"></p>
		  </div>
		</div>  
		
		<div class="layui-upload dis-n">
		  <button type="button" class="layui-btn" id="upPreviewFile"></button>
		  <div class="layui-upload-list">
		    <img class="layui-upload-img" id="demo2">
		    <p id="demoText"></p>
		  </div>
		</div>  
        
    </div>

</div>
<script src="/resources/js/comm/jquery.min.js"></script>
<script src="/resources/ctrl/layui/layui.js"></script>
<script src="/resources/js/utils.js"></script>
<script type="text/javascript">

	//解决layui内置上传上传元素不能点击
	function upFile(){
		$('#upFile').trigger("click");
	}
	
	function upPreviewFile(){
		$('#upPreviewFile').trigger("click");
	}
        //加载layui
    layui.use(['element', 'table', 'upload','form','laypage','tree', 'util'], function () {
        var layer = layui.layer,
         element = layui.element,
         table = layui.table,
         upload = layui.upload,
         form = layui.form,
         laypage = layui.laypage,
         tree = layui.tree,
         util = layui.util,
         $=layui.jquery;
       	 showMessage("${message}");
       	 
       	 function linkOpen(goodNumber){
       		 
       		 
       		 var treeData=null;
       		 
       		$.ajax({
                url: '/admin/goods/ajax/tree/'+goodNumber,
                type: "GET",
                success: function (data) {
                	console.log(data.data);
                	if(data.code=="${SysStatusCode.SUCCESS}"){
                		
                		layer.open({
                            title: "<spring:message code='add' />"//弹框标题
                            , content:$('#linkdiv')//也可以是一个html
                            , area: ['700', '600']
            		         ,closeBtn: 1
            		         ,shadeClose:true
            		         ,type: 1
            		      	,shade: 0 
            		     	,success:function(layero,index){
            		     		 tree.render({
                         		    elem: '#treelink'
                         		    ,data: data.data
                         		    ,showCheckbox: true  //是否显示复选框
                         		    ,id: 'treelinkId'
                         		    ,isJump: true //是否允许点击节点时弹出新窗口跳转
                         		    ,click: function(obj){
                         		    	treeData = obj.data;  //获取当前点击的节点数据
                         		    }
                         		  });
            		     		 
            		     	
                    		}
                        });
                	}
                }
            });
       		
      		$('#isok').click(function(){
    			let count=0;
    			let data=[];
    			var datas = tree.getChecked('treelinkId');
    			  $.each(datas, function(i,val){
    			 	  $.each(val.children, function(i,val){
    					  if(val.field=='s_goods'){
    						  data[count++]=val;
    					  }
    				  }); 
    			  }); 
    			  
    			  if(data.length>7){
    				  showMessage('<spring:message code='2008' />');
    			  }else{
    				  $.ajax({
    						type : "POST",
    						dataType: "json",
    						async: false,
    						contentType: "application/json;charset=UTF-8",
    						url : '/admin/goods/ajax/tree/'+goodNumber,
    						data :JSON.stringify(data),
    						success : function(data) {
    							 layer.closeAll();
    							 showMessage(data.msg);
    						},
    						error: function (XMLHttpRequest, textStatus, errorThrown) {
    							layer.closeAll();
    						}
    					});
    			  }
    			
    		});
       		 
       		 
       	 }
       	 
       	form.on('submit(create)', function(data){
       		
       		$.ajax({
				type : "POST",
				dataType: "json",
				//contentType: "application/json;charset=UTF-8",
				url : '/admin/goods/ajax/add',
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
            url: '/admin/goods/ajax/list',
            method:'GET',
            page:{layout:	['prev', 'page', 'next'],limit:10},
            cols: [
                [ //标题栏
                        {field: 'id', title: 'ID', width: '5%', align: 'center'},
                        {field: 'status', title: '<spring:message code="status" />',width: '10%',  align: 'center',templet:'#goodStatus'},
                        {field: 'number', title: '<spring:message code="number" />', width: '10%', align: 'center'},
                        {field: 'type', title: '<spring:message code="type" />', width: '10%', align: 'center',templet:'#goodType'},
                        {field: 'language', title: '<spring:message code='lang' />', width: '10%', align: 'center'},
                        {field: 'price', title: '<spring:message code="price" />', width: '10%', align: 'center'},
                        {field: 'name', title: '<spring:message code="2023" />',width: '10%',  align: 'center'},
                        {fixed: 'right', title: "<spring:message code='opt' />", width: 'auto', align: 'center', toolbar: '#barDemo'}                  
                ]
            ],
            done: function (res, curr, count) {

            }
        });
        
        form.on('select(goods_type)',function(obj){
        	
        	if(obj.value=="${GoodsTypeEnum.REAL.getValue()}"){
        		$(".div-service").addClass('dis-n');
        	}else{
        		$(".div-service").removeClass("dis-n");
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
                var id = data.id;
                layer.confirm("<spring:message code='submit.delete' />", {
      			  btn: ["<spring:message code='submit' />"] //按钮
  			  ,title:"<spring:message code='warning'/>"
  			},function (index) {
                    $.ajax({
                        url: '/admin/goods/ajax/del/'+id,
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
            }else if(layEvent == 'linked'){
            	linkOpen(data.number);
            }else{
             	layer.load();
             	$('.div-service').addClass('dis-n');
            	where={number:data.number,language:layEvent,id:0,price:data.price,type:data.type,status:data.status,type:"${GoodsTypeEnum.REAL.getValue()}"};
            	inidData(where);
            	loadObject(where,true);
           	  	layer.closeAll('loading');
            }
     
          
        });
        

        function openDialog(formName,elem,data,isReset){
        	if(isReset){
        		$('#'+formName)[0].reset();
        	}
          	 layer.open({
                   title: "<spring:message code='add' />"//弹框标题
                   , content:elem//也可以是一个html
                   , area: ['700', '600']
   		         ,closeBtn: 1
   		         ,shadeClose:true
   		         ,type: 1
   		      	,shade: 0
   		     	,success:function(layero,index){
   		     		if(data!=null){
   		     			form.val(formName,data);
   		     		}
	   		 	    form.render(null,formName);
           		}
               });
       
          }
        
        function inidData(where){
        	$("#category_num").empty();
         	$.ajax({
        		url: "/admin/goods/ajax/category/list/"+where.language,
				type: "GET",
				async: false,
				success: function(obj) {
					$("#category_num").empty();
					
					if(obj.code=="${SysStatusCode.SUCCESS}"){
						if(obj.count>0){
							for(var i = 0; i < obj.data.length; i++) {
								//添加option元素
								$("#category_num").append("<option value='" + obj.data[i].number + "'>" + obj.data[i].name + "</option>");
							}
						}
						
                	}
				}
			})
			$("#service_token").empty();
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
							$("#service_token").append("<option value='" + obj.data[i].stoken + "'>" + obj.data[i].name + "</option>");
						}
					}
				}
			});
        }
    	 
        
        
        function loadObject(where){
			$.ajax({
                    url: '/admin/goods/ajax/load',
                    type: "GET",
                    data : where,
                    async: false,
                    success: function (data) {
                    	console.log(data);
                    	if(data.code=="${SysStatusCode.SUCCESS}"){
                   	
                   		 	if(data.data.service_token!=""){
                   		 		$('.div-service').removeClass('dis-n');
                   		 	}
                   		 	$('.imgView').attr('src', data.data.detail_body); //图片链接（base64）
                   			openDialog("mainForm",$('#open-box'),data.data,true);
                    	}else{
                    		$('.imgView').attr('src',null); //图片链接（base64）
                    		openDialog("mainForm",$('#open-box'),where,true);
                    		
                    	}
                    	
                    }
             });
			
        }
    	 
        	//商品详情
 	        upload.render({
 		     	elem: '#upFile' //绑定元素
 		     	,url: '/admin/common/upload'
 		     	,accept: 'file'
 		     	,exts: 'jpg|png'
 		        ,data:{'suffix':'jpg'}
 		     	,before: function(obj){ //obj参数包含的信息，跟 choose回调完全一致，可参见上文。
 		         	    layer.load(); //上传loading
 		         	    
 		         	//预读本地文件示例，不支持ie8
 		               obj.preview(function(index, file, result){
 		                 $('.imgView').attr('src', result); //图片链接（base64）
 		               });
 		        }
 		         ,done: function(res){
 		         	layer.closeAll('loading');
 		         	if(res.code=="${SysStatusCode.SUCCESS}"){
 		         		$(".detail_body").val(res.data);
 					}
 					showMessage(res.msg);
 					
 					form.render(null,'form');
 		        }
 		         ,error: function(e){
 		         	layer.closeAll('loading');
 		        }	
 		 	});
 	     //商品预览图详情
 	       upload.render({
		     	elem: '#upPreviewFile' //绑定元素
		     	,url: '/admin/common/upload'
		     	,accept: 'file'
		     	,exts: 'jpg|png'
		        ,data:{'suffix':'jpg','width':369,'height':332}
		     	,before: function(obj){ //obj参数包含的信息，跟 choose回调完全一致，可参见上文。
		         	    layer.load(); //上传loading
		         	
		        }
		         ,done: function(res){
		         	layer.closeAll('loading');
		         	if(res.code=="${SysStatusCode.SUCCESS}"){
		         		$(".img_url").val(res.data);
					}
					showMessage(res.msg);
					form.render(null,'form');
		        }
		         ,error: function(e){
		         	layer.closeAll('loading');
		        }	
		 	});
        $("#addPage").click(function(){
        	$('.div-service').addClass('dis-n');
        	inidData({language:"${language}"});
        	openDialog("mainForm",$('#open-box'),{number:'',id:0,type:"${GoodsTypeEnum.REAL.getValue()}"},true);
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