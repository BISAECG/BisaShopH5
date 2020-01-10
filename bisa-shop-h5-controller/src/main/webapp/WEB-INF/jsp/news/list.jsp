<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
   <!-- necessary -->
    <title><spring:message code='admin.domain'/></title>
    <meta name="keywords" content="<spring:message code='admin.keyword'/>">
    <meta name="description" content="<spring:message code='admin.description'/>">
          <link href="/resources/ctrl/layui/css/layui.css" rel="stylesheet" >
    <link href="/resources/ctrl/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/ctrl/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="/resources/css/public.css" rel="stylesheet">
    <link href="/resources/css/new.css" rel="stylesheet">
  
     <script src="/resources/js/comm/jquery.min.js"></script>
     <script src="/resources/ctrl/bootstrap/js/bootstrap.js"></script>
    <script src="/resources/js/rootFont.js"></script>
    <script src="/resources/ctrl/layui/layui.js"></script>

</head>

<body>
    <div id="header"></div>
    <script>
        $("#header").load("header.html");
    </script>
    <div class="content bg">
        <div class="container-full newBanner">
            <div class="row" style="margin: 0;">          
                    <img class="img-responsive center-block" src="/resources/img/news/banner.png">
                    <div>
                        <p><spring:message code='5002'/></p>
                        <p><span><spring:message code='5003'/></span></p>
                        <p><spring:message code='5004'/></p>
                        <img class=" img-responsive center-block" src="/resources/img/news/downlogo.png" >
                    </div>            
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-xs-12 title">
                    <div></div>
                    <span><spring:message code='5001'/></span>
                </div>
            </div>
            <div id="newTop">
	           
            </div>
            <div class="row" id="listNews">
                
            </div>
        </div>
    </div>
    <div id="footer"></div>
    <script>
        $("#footer").load("footer.html");
    </script>
    <script type="text/javascript">
    
    
    
    layui.use('flow', function(){
    	  var $ = layui.jquery; //不用额外加载jQuery，flow模块本身是有依赖jQuery的，直接用即可。
    	  var flow = layui.flow;
    	  
    	  //新闻内容获取

              $.ajax({
                  type: "GET",
                  dataType: "json",
                  url: "/news/ajax/top4",
                  success: function (data) {
                     
                      $.each(data, function (i, item) {
                      	var active="";
                      	if(i==0){
                      		active="active";
                      	}
                      	
                      	$("#newTop").append(
                      		'<a href="'+item.id+'.html"><div class="row top_news" >'+
             	                '<div class="col-xs-4" style="padding-right: 0;padding-left: 5px;">'+
             	                    '<img class="new_img img-responsive center-block" src="'+item.img_url+'">'+
             	                '</div>'+
             	                '<div class="col-xs-8 new_span">'+
             	                    '<p class="new_title titleTopping">'+item.news_title+'</p>'+
             	                    '<p class="new_con">'+item.news_describe+'</p>'+
             	                    '<span><spring:message code="date"/></span>'+
             	                    '<span class="new_time timeTopping">'+item.release_time+'</span>'+
             	                    '<span class="newRead"><spring:message code="reading"/>:</span>'+
             	                    '<span class="new_read">'+item.read_quantity+'</span>'+
             	                '</div>'+
             	            '</div></a>'
                      	);
                      	
                         
                      });
                  }
              });
    	  
    	  flow.load({
    	    elem: '#listNews' //指定列表容器
    	     ,isAuto:true
    	     ,mb:100
    	    ,end:'<spring:message code="not.data"/>'
    	    ,done: function(page, next){ //到达临界点（默认滚动触发），触发下一页
    	      var lis = [];
    	      //以jQuery的Ajax请求为例，请求下一页数据（注意：page是从2开始返回）
    	      $.get('/news/ajax/page?page='+page+'&limit=10', function(res){
    	        //假设你的列表返回在data集合中
    	        layui.each(res.data, function(index, item){
    	          lis.push('<a href="'+item.id+'.html"><div class="col-xs-12 " style=" margin-top:0.24rem;border-bottom: 0.01rem solid #ECECEC;padding-bottom: 0.1rem;">'+
    	                    '<div class="col-xs-3 timeOrdinary">'+
    	                        '<span class="new_time ">'+item.release_time+'</span>'+
    	                    '</div>'+
    	                    '<div class="col-xs-8" style="padding:0;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">'+
    	                        '<span class="new_title titleOrdinary">'+item.news_title+'</span>'+
    	                    '</div>'+
    	                    '<div class="col-xs-1 more" style="padding: 0;">'+
    	                      '<i class="fa fa-chevron-right pull-right"></i>'+
    	                    '</div>'+
    	                '</div></a>');
    	        }); 
    	        
    	        //执行下一页渲染，第二参数为：满足“加载更多”的条件，即后面仍有分页
    	        //pages为Ajax返回的总页数，只有当前页小于总页数的情况下，才会继续出现加载更多
    	        next(lis.join(''), page < res.count);    
    	      });
    	    }
    	  });
    	});
    	     
    </script>
</body>
</html>