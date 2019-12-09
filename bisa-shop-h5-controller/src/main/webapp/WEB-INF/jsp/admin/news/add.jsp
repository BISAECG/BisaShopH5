<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="com.bisa.health.shop.entity.SysStatusCode" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <script src="/resources/ctrl/layui/layui.js"></script>
    <script src="/resources/ctrl/ckeditor/ckeditor.js"></script>
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
            <div style="padding: 30px 50px;">
                <p class="f-18 pt-15 pb-15 col-8d969d">
                    	填写新闻基本资料
                </p>
                <form class="layui-form" lay-filter="mainForm" id="mainForm" >
                	<input type="hidden" name="id" value="${id}">
                	<input type="hidden" id="news_num" name="news_num" value="${news_num}">
                    <div class="clear pd-15 bg-fafafa bor bor-col-e8ebf2">
                    	<div class="layui-form-item">
						    <label class="layui-form-label">语言:</label>
						    <div class="layui-input-block">
						      <input type="radio" name="language" id="radio-zh_CN" lay-filter="radio_lang" value="<spring:message code='language.cn.code' />" title="<spring:message code='language.cn' />" >
						      <input type="radio" name="language" id="radio-zh_HK" lay-filter="radio_lang" value="<spring:message code='language.hk.code' />" title="<spring:message code='language.hk' />" >
						      <input type="radio" name="language" id="radio-en_US" lay-filter="radio_lang" value="<spring:message code='language.us.code' />" title="<spring:message code='language.us' />" >
						    </div>
						  </div>
                    	
                        <div class="layui-form-item">
                            <label class="layui-form-label ">新闻标题：</label>
                            <div class="layui-input-block">
                                <input type="text" name="news_title" id="news_title" lay-verify="required" autocomplete="off" placeholder="请输入新闻标题" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label ">新闻副标题：</label>
                            <div class="layui-input-block">
                                <input type="text" name="news_subhead" id="news_subhead" lay-verify="required" placeholder="请输入新闻副标题" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        
                       <div class="layui-form-item">
                            <label class="layui-form-label ">新闻分类：</label>
                            <div class="layui-input-block">
                              	<select id="news_classify_num" name="news_classify_num" lay-verify="required">
	                            	
	                            </select>
                            </div>
                        </div>
                        
                        <div class="layui-form-item">
                            <label class="layui-form-label ">作者：</label>
                            <div class="layui-input-inline">
                                <input type="text" name="author" id="author" lay-verify="required" placeholder="请输入作者" autocomplete="off" class="layui-input">
                            </div>
                             <label class="layui-form-label ">阅读量：</label>
                            <div class="layui-input-inline">
                                <input type="text" name="read_quantity"  id="read_quantity" lay-verify="required|number" placeholder="请输入阅读量" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label ">主图地址：</label>
                            <div class="layui-inline layui-col-md6">
                            		<input type="text" readonly="readonly"  name="img_url" id="img_url" lay-verify="required" placeholder="请输入新闻主图地址" autocomplete="off" class="layui-input">
                            </div>
                            <div class="layui-inline">
                            	<div class="layui-input-inline">
                            		<button type="button" id="upJumpFile" class="layui-btn">上传主图</button>
      							</div>
                            </div>
                             
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label ">新闻描述：</label>
                            <div class="layui-input-block">
                                <input type="text" name="news_describe" id="describe" lay-verify="required" placeholder="请输入新闻内容描述"
                                       autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label ">关键词：</label>
                            <div class="layui-input-block">
                                <input type="text" name="html_keyWord" id="html_keyWord" lay-verify="required" placeholder="请输入新闻meat的关键词"
                                       autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label ">页面标题：</label>
                            <div class="layui-input-block">
                                <input type="text" name="html_title" id="html_title" lay-verify="required" placeholder="请输入新闻meat的名称"
                                       autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label ">页面描述：</label>
                            <div class="layui-input-block">
                            	<textarea name="html_description" placeholder="请输入新闻meat标签中的描述"  lay-verify="required" class="layui-textarea"></textarea>
                            </div>
                        </div>
                            	
                        <div class="layui-form-item">
                            <label class="layui-form-label ">是否置顶：</label>
                            <div class="layui-input-block">
                                <input type="radio" name="news_roofPlacement" value="1" title="置顶">
                                <input type="radio" name="news_roofPlacement" value="0" title="不置顶" checked>
                            </div>
                        </div>
                    </div>
                    
                    <p class="f-18 pt-15 pb-15 col-8d969d mt-10 mb-10">
                        编辑新闻主要内容
                    </p>

                    <div class="clear pd-15 bg-fafafa bor bor-col-e8ebf2">
                         <textarea  name="newseditor" id="newseditor"></textarea>
                         <div class="layui-form-item pt-20">
		                    <div class="text-center">
		                        <button class="layui-btn" lay-submit lay-filter="create" ><spring:message code='submit' /></button>
		                        <button type="reset" class="layui-btn layui-btn-primary"><spring:message code='reset' /></button>
		                        <a href="/admin/news/list" class="layui-btn layui-btn-primary">返回</a>
		                    </div>
	                	</div>
                    </div>
                </form>
        </div>
    </div>
    	<div class="layui-upload dis-n">
			<button type="button" class="layui-btn" id="test1">上传图片</button>
		</div> 
	<script type="text/javascript">
	
	 /*layui方面js*/
    layui.use(['form', 'table', 'element','upload'], function () {
        var form = layui.form,
            layer = layui.layer,
            element = layui.element,
            table = layui.table,
        	upload = layui.upload,
        	$=layui.jquery;
        reloadData("${language}",$('#news_num').val());
        
        $('#upJumpFile').click(function(){
        	 $('#test1').trigger("click");
        });
        
       
        
        
        upload.render({
		     	elem: '#test1' //绑定元素
		     	,url: '/admin/common/upload'
		     	,accept: 'file'
		     	,exts: 'jpg|png'
		        ,data:{'suffix':'jpg'}
		     	,before: function(obj){ //obj参数包含的信息，跟 choose回调完全一致，可参见上文。
		         	    layer.load(); //上传loading
		        }
		         ,done: function(res){
		         	layer.closeAll('loading');
		         	if(res.code=="${SysStatusCode.SUCCESS}"){
		         		$("#img_url").val(res.data);
					}
		        }
		         ,error: function(e){
		         	layer.closeAll('loading');
		        }	
		 	});

    /*定义ckeditor*/
    var editor = CKEDITOR.replace('newseditor', {
        customConfig: '/resources/ctrl/ckeditor/config.js',
        height: 550,
    });

    /*添加新闻*/
        form.on('submit(create)', function (data) {
            /*获取ck的数据*/
            var ck_val = CKEDITOR.instances.newseditor.getData();
            /*把ck的值推入到lay数组里面*/
         
            if(ck_val=='' || ck_val==undefined  || ck_val==null){
                layer.msg('新闻内容不能为空!');
                return false;
            }
            data.field.news_content = ck_val;
            $.ajax({
                url: '/admin/news/ajax/save',
                data: data.field,
                type: "POST",
            	dataType: "json",
                success: function (data) {
                	showMessage(data.msg);
                	if(data.news_num==null){
                		window.location = "/admin/news/list";
                	}
                }
            });
            return false;
        });
    
        form.on('radio(radio_lang)', function(data){
        	 reloadData(data.value,$('#news_num').val());
        	 
        }); 
        
        var fData=null;//保留新闻某些值
        function reloadData(language,news_num){
        	   $("#radio-"+language).attr('checked', true);
	       	 $.ajax({
	                url: '/admin/news/ajax/category/list/'+language,
	                type: "GET",
	            	dataType: "json",
	            
	                success: function (obj) {
	               		$("#news_classify_num").empty();
	   					if(obj.code=="${SysStatusCode.SUCCESS}"){
	   						if(obj.count>0){
	   							for(var i = 0; i < obj.data.length; i++) {
	   								//添加option元素
	   								$("#news_classify_num").append("<option value='" + obj.data[i].number + "'>" + obj.data[i].name + "</option>");
	   							}
	   						}
	   						
	                   	}
	   					if(news_num!= ""){
	   					 var mData={};
	   						$.ajax({
		   		                url: '/admin/news/ajax/load',
		   		                type: "GET",
		   		            	dataType: "json",
		   		             	data : {number:news_num,language:language},
		   		                success: function (data) {
		   		                	mData=data.data;
		   		                	if(data.code=="${SysStatusCode.SUCCESS}"){
		   		                		fData=data.data;
		   		                		CKEDITOR.instances.newseditor.setData(data.data.news_content);
		   		                	}else{		  
		   		                		console.log(fData!=null);
		   		                		if(fData!=null){
		   		                			mData.img_url=fData.img_url;
		   		                			mData.news_roofPlacement=fData.news_roofPlacement;
		   		                		}
		   		                	}
		   		                	mData.news_num=$('#news_num').val();
		   		                	form.val('mainForm',mData);
		   		                 	form.render();
		   		                 	showMessage(data.msg);
		   		                }
	   						});
	   					}else{			
   		                 	form.render();
	   					}
	   				
	   					
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