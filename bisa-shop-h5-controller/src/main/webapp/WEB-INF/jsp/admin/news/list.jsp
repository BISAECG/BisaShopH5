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
		<div class="layui-btn-group">
			<a class="layui-btn layui-btn-normal layui-btn-sm" lay-event="zh_CN"><spring:message code='language.cn' /></a>
        	<a class="layui-btn layui-btn-normal layui-btn-sm" lay-event="zh_HK"><spring:message code='language.hk' /></a>
			<a class="layui-btn layui-btn-normal layui-btn-sm" lay-event="en_US"><spring:message code='language.us' /></a>
		</div>
  		<a class="layui-btn layui-btn-sm" lay-event="generate"><spring:message code='1063' /></a>
       <a class="layui-btn layui-btn-sm layui-btn-warm" lay-event="detail"><spring:message code='preview' /></a>
        <a class="layui-btn layui-btn-sm layui-btn-danger" lay-event="delarticle"><spring:message code='delete' /></a>
    </script>
    
      <script type="text/html" id="news_roofPlacement">
        {{# if(d.type == 0){ }}
       		<span style="color: #009688;"><spring:message code='5021' /></span>
        {{# }else{ }}
            <span style="color: #F581B1;"><spring:message code='5020' /></span>
        {{#  } }}
     </script>

     <script type="text/html" id="is_pc">
        {{# if(d.is_pc == 0){ }}
       		<span style="color: #009688;">PC</span>
        {{# }else{ }}
            <span style="color: #F581B1;">PHONE</span>
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
                    <form class="layui-form" action="">
                        <div class="layui-form-item mb-0" pane="">
                            <label class="layui-form-label f-14"><spring:message code="seach"/>：</label>
                            <div class="layui-input-block">
                                <div class="layui-inline">
                                    <select name="searchabout" lay-verify="required" lay-search="">
                                        <option value=""><spring:message code="seach.content.input"/></option>
                                        <option value="news_title"><spring:message code='5006' /></option>
                                        <option value="release_time"><spring:message code='time' /></option>
                                    </select>
                                </div>
                                <div class="layui-inline">
                                    <div class="layui-input-inline">
                                        <input type="text" name="incontent" lay-verify="required" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-inline">
                                    <button type="submit" class="layui-btn layui-btn-sm" lay-submit="" lay-filter="search1"><spring:message code="seach"/></button>
                                    <button type="button" class="layui-btn layui-btn-sm btn-refresh"><spring:message code="refresh"/></button>
                                    <button type="button" class="layui-btn layui-btn-sm btn-generate"><spring:message code='1034' /></button>
                                    <a href="/admin/news/add" class=" layui-btn layui-btn-primary layui-btn-sm"><spring:message code='5005' /></a>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <p class="f-18 pt-15 pb-15 mt-40 col-8d969d">
                    	<spring:message code="list"/>
                </p>
                <div class="clear pd-15 bg-fafafa bor bor-col-e8ebf2">
                    <table id="commentlist" lay-filter="test"></table>
                </div>
            </div>
        </div>
        
    </div>
  <script src="/resources/ctrl/layui/layui.js"></script>
	<script src="/resources/js/utils.js"></script>
    <script type="text/javascript">
        //<spring:message code="refresh"/>  页面按钮
  

        /*layui方面js*/
        layui.use(['form', 'table', 'element','layer'], function () {
        	
            var form = layui.form,
                layer = layui.layer,
                element = layui.element,
                table = layui.table,
              	$=layui.jquery;
            
            //一键生成所有静态网页
            
            
            $(".btn-refresh").click(function () {
            	tableIns.reload({page:{curr:1},where:{vKey: ""}});
            });
           
            $(".btn-generate").click(function () {
            	layer.load();
                $.ajax({
                    type: "GET",
                    dataType: "json",
                    async:false,
                    url: "/admin/news/ajax/generate/html",
                    success: function (data) {
                        //显示新闻数据，填充页面元素
                    	  layer.closeAll('loading');
                    	  showMessage(data.msg);
                    }
                });
            });

            //监听提交
            form.on('submit(search1)', function (data) {
                var incontent = data.field.incontent;
                var searchabout = data.field.searchabout;

            	tableIns.reload({page:{curr:1},where: {
                    	vKey: searchabout,
                    	vVal: incontent
                }});
                return false;
            });
            //=================执行渲染==================
             var tableIns =table.render({
                elem: '#commentlist', //指定原始表格元素选择器（推荐id选择器）
                id: 'commentlist',
                url: '/admin/news/ajax/list',
                limit: 10,
                page:{layout:	['prev', 'page', 'next'],limit:10},
                cols: [
                    [ //标题栏
                        {type: 'numbers'},
                        {field: 'author', title: '<spring:message code="5011" />', width: '5%', align: 'center'},
                        {field: 'news_title', title: '<spring:message code="5006" />', width: '10%', align: 'center'},
                        {field: 'language', title: '<spring:message code="lang" />', width: '10%', align: 'center'},
                        {field: 'is_pc', title: '<spring:message code="type" />', width: '5%', sort: true, align: 'center',templet:'#is_pc'},
                        {field: 'html_keyWord', title: '<spring:message code="1070" />', width: '10%', align: 'center'},
                        {field: 'html_description', title: '<spring:message code="1072" />', width: '10%', align: 'center'},
                        {field: 'html_title', title: '<spring:message code="1068" />', width: '10%', align: 'center'},
                        {field: 'news_roofPlacement', title: '<spring:message code="5019" />', width: '5%', sort: true, align: 'center',templet:'#news_roofPlacement'},
                        {field: 'release_time', title: '<spring:message code="time" />', width: '10%', sort: true, align: 'center'},
                        {fixed: 'right', title: '<spring:message code="opt" />', width: 'auto', align: 'center', toolbar: '#barDemo'}
                    ]
                ],
                done: function (res, curr, count) {
                }
     
            });
            //===============监听工具条===================
            table.on('tool(test)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
                var data = obj.data; //获得当前行数据
                var layEvent = obj.event; //获得 lay-event 对应的值
                var tr = obj.tr; //获得当前行 tr 的DOM对象
                if (layEvent == 'detail') { //预览
                    window.open("/html/"+data.language+"/" + data.id+".html");
                } else if (layEvent === 'delarticle') { //删除
                    layer.confirm("<spring:message code='submit.delete' />", {
            			  btn: ["<spring:message code='submit' />"] //按钮
        			  ,title:"<spring:message code='warning'/>"
        			},function (index) {
                    	$.post("/admin/news/ajax/delect/"+ data.id, function(result){
                    		showMessage(result.msg);
                    		  //执行重载
                    		tableIns.reload({page:{curr:1}});
                    	 });
                    });
                }else if(layEvent ==='generate'){
                	layer.load();
                    $.ajax({
                        type: "GET",
                        dataType: "json",
                        async:false,
                        url: "/admin/news/ajax/generate/html/"+data.news_num,
                        success: function (data) {
                            //显示新闻数据，填充页面元素
                        	  layer.closeAll('loading');
                        	  showMessage(data.msg);
                        }
                    });
                }else{
                	window.location = "/admin/news/add?id="+data.id+"&news_num="+data.news_num+"&language="+layEvent;
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