<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="icon" href="/favicon/favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="/favicon/favicon.ico" type="image/x-icon" />
    <link rel="bookmark" href="/favicon/favicon.ico" type="image/x-icon" />
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html;" />
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <!-- necessary -->
    <title><spring:message code='admin.domain'/></title>
    <meta name="keywords" content="<spring:message code='admin.keyword'/>">
    <meta name="description" content="<spring:message code='admin.description'/>">
    <!-- description -->
    <meta name="renderer" content="webkit">
    <!-- base -->
    <link href="/resources/ctrl/layui/css/layui.css" rel="stylesheet" >
    <link href="/resources/css/comm/base.css" rel="stylesheet">
    <link href="/resources/css/news/HK_News.css" rel="stylesheet">
    <script src="/resources/js/comm/jquery.min.js"></script>
    <style>
        .title-color{
            background-color:rgba(1,144,255,0.3);
        }
        .seach span{
            margin: 0 5px;
        }
        .seach span a{
            color:#858585;
        }
        .seach span a:hover{
            color:#2B84C6;
        }
    </style>
</head>

<body>
<div id="header"></div>
<script>
    $("#header").load("header.html");
</script>
<div class="wrap clear" id="title-list">
    <div class="container-full pos-r center-block">
        <img class="img-responsive center-block" src="/resources/img/news/HK_HowToShop/banner.png" >
        <p style="position: absolute;left:40%;top: 34%;">
            <span class="f-30 pr-40"  style="color: #FFFFFF;"><spring:message code='5002'/></span>
            <span class="f-30" style="background: #3592D0;color: #FFFFFF;"><spring:message code='5003'/></span>
        </p>
        <p class="f-30"  style="color: #FFFFFF;position: absolute;left:42%;top: 50%;"><spring:message code='5004'/></p>
        <img style="position: absolute;left:48%;top: 75%;"
             src="/resources/img/news/HK_HowToShop/downlogo.png">
    </div>
    <div class="container pt-20 pb-20">
        <div class="row">
            <div class="col-md-6 seach" id="div-classify">
                <span style="color: #010101;"><spring:message code='keyword'/>:</span>
                
                <c:forEach items="${listClassify}" var="item">
                <span><a  id="classify"  data-num="${item.number}">${item.name}</a></span>
                </c:forEach>
            </div>
            <div class="col-md-3 col-md-offset-3 seach">
                    <div class="pos-r" style="border:1px solid rgba(43,132,198,1);height: 36px;width: 180px;">
                        <input id="seachtext" type="text" style="width:160px;border:0;height:35px;position:
                        absolute;left: 20px;top: 0%;border-bottom:1px solid rgba(43,132,198,1); ">
                     
                        <img class="img-responsive " src="/resources/img/news/HK_HowToShop/searh1.png"  style="margin-top: 7px;">
                    </div>
                    <input id="seach" type="button"
                           style="width:55px;height:36px;background:rgba(43,132,198,1);color: #fff;border: 0;position: absolute;left:
                           180px;top: 0%;" value="<spring:message code='seach'/>">
            </div>
        </div>
    </div>
    <div class="full-w mb-20" >
        <div class="container">
            <div class="row"  style="background: #F1F1F1;">
                <div class="col-md-2 pt-10 pb-10">
                <span style="font-size: 18px;font-weight: bold;">
                    <spring:message code='5001'/>
                </span>
                </div>
           
                <div class="col-md-1 col-md-offset-9" style="line-height: 45px;">
                    <img src="/resources/img/news/HK_HowToShop/down.png" style="margin-left: 50px;">
                </div>
            </div>
        </div>
    </div>
    <div class="container mt-40 pb-40"  style="border-bottom: 1px solid #E5E5E4;">
    	<!-- 新闻置顶 -->
 
	        <div class="row main_div" id="zhidingtitle">
	          <c:forEach items="${list}" var="news">
		         <div class="clear col-md-3 new-div">
			            <div class="row">
			            <input type="hidden"  class="zd-id" value="${news.id}"/>
			            <img class=" wh16-9 cur-p news-img" width="280" height="200" src="${news.img_url}">
			            <p class="line-h-20 h-20 f-16 col-414141 text-overflow cur-p  text-center mt-10 news-title" style="font-weight:bold;">${news.news_title}
			            </p>
			            <p class="f-12 col-888 mtb-10-0-ipad h-40 overflow-h line-h-20 text-line-2-1-ipad cur-p hovecol-999 news-describe">${news.news_describe}
			            </p>
			            <p class="f-12 col-888 mtb-10-0-ipad line-h-20 text-line-2-1-ipad cur-d">
			            <span><spring:message code='date'/>:</span><span class="col-888 news-time">${news.release_time}</span>
			            <span  style="margin-left: 40px;"><spring:message code='reading'/>:</span><span class="col-888 news-total">${news.read_quantity}</span>
			            </p>
			            </div>
		            </div>
	            </c:forEach>
	        </div>
    
        <!-- 新闻置顶 end-->
    </div>
    <!--putongwenzhang-->
    <div class="container seachlist pt-div">
        <ul class="flow-default"  id="LAY_demo1">
        </ul>
        <div id="page" class="text-center"></div>
    </div>
</div>

<div id="footer"></div>
<script>
    $("#footer").load("footer.html");
</script>
</body>
<script src="/resources/ctrl/layui/layui.js"></script>
<script>
  
      
        layui.use(['flow','laypage'], function () {
            var flow = layui.flow,
            laypage = layui.laypage;
            
            $("#div-classify, #classify").bind("click", function() {
                // 处理逻辑
            	event.preventDefault();
            	var number=$(this).data("num");
            	if(number!=null){
            		where={page:1,limit:10,vKey:'news_classify_num',vVal:number};
                	ajaxList(where,true);
            	}
            	
            });
   
            $('#seach').click(function(){
            	var v=$('#seachtext').val();
            	if(v!=""){
            		where={page:1,limit:10,vKey:'news_title',vVal:v};
            	}else{
            		where={page:1,limit:10,vKey:'',vVal:''};
            	}
             	ajaxList(where,true);
            });
            
            var where={page:1,limit:10,vKey:'',vVal:''};
            ajaxList(where,true);
            function ajaxList(where,isInit){
            	 $.ajax({
                     url: '/news/ajax/page',
                     type: "GET",
                     data:where,
                     success: function (data) {
                    	 
                    	 if(isInit){
                           	 laypage.render({
                            	  elem: 'page'
                            	  ,count:data.count //数据总数，从服务端得到
                            	  ,prev: '<em>←</em>'
                            	  ,next: '<em>→</em>'
                            	  ,jump: function(obj, first){
                            		//首次不执行
                            		    if(!first){
                            		      where.page=obj.curr;
                                   		  ajaxList(where,false);
                            		    }
                            	  }
                            });
                    	 }
                    	 
                    	$("#LAY_demo1").empty();
                   	    $(data.data).each(function(index,item){
                   	    	console.log(item);
	               		$("#LAY_demo1").append(
	                             '<li class="cur-p">'+
	                             '<div class="row news-div">'+
	                             '<input type="hidden" name="id" class="id" value="'+item.id+'"/>'+
	                             '<div class="col-md-12 pt-15 pb-20 " style="border-bottom: 1px solid #E5E5E4;padding-left: 0px;">'+
	                             '<div class="col-md-2" style="padding:0px;">'+
	                             '<span class="col-888" style="background:linear-gradient(0deg,rgba(44,106,206,1) 0%,rgba(47,232,230,1) 100%);box-shadow:0px 1px 5px 0px rgba(53,143,238,1);color: #fff;">'+item.release_time+'</span>'+
	                             '</div>'+
	                             '<div class="col-md-9">'+
	                             '<span class="col-888" style="color: #101010;">'+item.news_title+'</span>'+
	                             '</div>'+
	                             '<div class="col-md-1">'+
	                             '<span class="cur-p pull-right"><spring:message code="details"/>></span>'+
	                             '</div>'+
	                             '</div>'+
	                             '</div>'+
	                             '</li>'//作为元素塞进数组lis中
	           	  		);
                   		  
                   	  });
                    	 
                     }
                 });
            	
            }
            
          //点击图片跳转
        $(".main_div").on("click", ".new-div", function () {
                var id = $(this).find(".zd-id").val();
                window.open(id+".html",'_blank')
        });
     
        $(".pt-div").on("click", ".news-div", function () {
        
            var id = $(this).find(".id").val();
            window.open(id+".html",'_blank')
        });

        });
</script>
</html>