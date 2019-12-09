<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.bisa.health.shop.entity.SysStatusCode" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN">
<head>
<link rel="icon" href="Images/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="Images/favicon.ico" type="image/x-icon" />
<link rel="bookmark" href="Images/favicon.ico" type="image/x-icon" />

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
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
</head>

<body class="layui-layout-body">
	<div class="layui-layout">
		<!-- 内容主体区域 -->
		<div class="layui-body">

			<div class="pt-50">
				<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
				  <legend>图片上传</legend>
				</fieldset>
				
				<div class="layui-container">  
				  <div class="layui-row">
				    <div class="layui-col-md8">
				      <input type="text"  readonly="readonly"  id="imgpath" name="incontent" lay-verify="required" autocomplete="off" class="layui-input">
				    </div>
				    <div class="layui-col-md4">
				      	<div class="layui-upload">
								<button type="button" class="layui-btn" id="upFile">多图片上传</button>
							</div>
				    </div>
				  </div>
                 
                   	<blockquote class="layui-elem-quote layui-quote-nm"style="margin-top: 10px;">
						预览图：
						<div class="layui-upload-list">
							 <img class="layui-upload-img" id="imgView">
						</div>
					</blockquote>
				
			</div>
		</div>
	</div>
	<script src="resources/ctrl/layui/layui.js"></script>
	<script type="text/javascript">
		layui.use([ 'form', 'upload' ], function() {
			var form = layui.form, upload = layui.upload,$=layui.jquery;

			//普通图片上传
			var uploadInst = upload.render({
				elem: '#upFile' //绑定元素
				,url: '/admin/common/upload'
			    ,accept: 'file'
			    ,exts: 'jpg|png'
			    ,data:{'suffix':'jpg'}
				,before : function(obj) {
					//预读本地文件示例，不支持ie8
					obj.preview(function(index, file, result) {
						$('#imgView').attr('src', result); //图片链接（base64）
					});
				},
				done : function(data) {
					if(data.code=="${SysStatusCode.SUCCESS}"){
						  $('#imgpath').val(data.data);
					}
						layer.msg(data.msg);
				}
			});

		});
	</script>


</body>
</html>