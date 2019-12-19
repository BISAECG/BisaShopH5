<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="com.bisa.health.shop.enumerate.LangEnum" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="icon" href="/favicon/favicon.ico" type="image/x-icon"/>
    <link rel="shortcut icon" href="/favicon/favicon.ico" type="image/x-icon"/>
    <link rel="bookmark" href="/favicon/favicon.ico" type="image/x-icon"/>
    <meta http-equiv="Content-Type" content="text/html; "/>
    <meta charset=utf-8>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no"/>
    <!-- necessary -->
    <title><spring:message code="2013" /></title>
    <meta name="keywords" content="<spring:message code="2013" />,<spring:message code="admin.keyword" />">
    <meta name="description" content="<spring:message code="admin.description" />">
    <!-- description -->
    <meta name="renderer" content="webkit">
    <!-- base -->
    <link href="/resources/css/comm/base.css" rel="stylesheet">
    <link href="/resources/css/index/index.css" rel="stylesheet">
    <script src="/resources/js/comm/jquery.min.js"></script>
    <style>
        .good{
            background:rgba(255,255,255,1);
            box-shadow:0px 0px 13px 0px rgba(224,224,224,1);
            border-radius:20px;
            margin-bottom: 20px;
            margin-top: 40px;
            padding: 20px 70px;
            height: 250px;
        }

        .good img{
            max-height: 220px;
        }
        .goodTitle {
            font-size: 24px;
            font-weight: bold;
            color: #333333;
            line-height: 24px;
            overflow: hidden;
            display:-webkit-box;
            -webkit-box-orient:vertical;
            -webkit-line-clamp:1;
            text-overflow:ellipsis;
        }

        .goodDescribe {
            font-size: 20px;
            color: #666666;
            line-height: 24px;
            margin-bottom: 14px;
            overflow: hidden;
            display:-webkit-box;
            -webkit-box-orient:vertical;
            -webkit-line-clamp:1;
            text-overflow:ellipsis;
        }

        .goodPrice {
            font-size: 20px;
            color: #CF1518;
            line-height: 38px;
        }

        .goodMore {
            float: right;
            text-decoration: none;
            margin-bottom: 10px;
            background: #CF1518;
            font-size: 20px;
            padding: 5px 10px;
            color: #FFFFFF;
            border-radius: 5px;
        }
        .con a:focus,.con a:hover {
            color: #fff;
            text-decoration: underline;
        }
    </style>
</head>


<body>
<div id="header"></div>
<script>
    $("#header").load("header.html");
</script>
<div class="con">
    <%--<div class="container-fluid">--%>
        <%--<div class="row">--%>
            <%--<img class="img-responsive center-block" src="/resources/img/index/banner8-cn.gif" alt="碧沙康健心电仪限时活动">--%>
        <%--</div>--%>
    <%--</div>--%>
    <div class="container-fluid">
        <div class="row pos-r " >
        	
        	  <c:if test="${language==LangEnum.zh_CN.name}">
        	   <img class="img-responsive center-block" src="/resources/img/index/banner8-cn.gif" alt="碧沙康健心电仪限时活动">
			  </c:if>
			  <c:if test="${language==LangEnum.en_US.name}">
        	   <img class="img-responsive center-block" src="/resources/img/index/banner8-us.gif" alt="碧沙康健心电仪限时活动">
			  </c:if>
			   <c:if test="${language==LangEnum.zh_HK.name}">
        	   <img class="img-responsive center-block" src="/resources/img/index/banner8-hk.gif" alt="碧沙康健心电仪限时活动">
			  </c:if>
           
            <div class="text-center pos-a" style=" top: 67%;right: 42%;">
                <a target="_blank" href="https://shop194684580.taobao.com/?spm=a230r.7195193.1997079397.2.6815114b089AGi"
                   style=" font-size: 22px;border-radius: 5px;width: 120px;height: 36px;display: inline-block;color: #fff;line-height: 36px;background: #f40;">
                    <spring:message code="jd" /></a>
                <a target="_blank"  href="https://mall.jd.com/index-10103348.html"
                   style=" font-size: 22px;border-radius: 5px;width: 120px;height: 36px;display: inline-block;color: #fff;line-height: 36px;background: #D71C1E;margin-left:20px;">
                    <spring:message code="tb" /></a>
            </div>
        </div>
    </div>
    <p class="title-p">
       <spring:message code="2014" />
    </p>
    <div class="line">
        <span class="line-top"></span>
        <span class="line-btm"></span>
    </div>
    <div class="container">
        <div class="row">
	        <c:forEach items="${list}" var="item">
	            <div class="col-md-4 mb-50">
	                <div class="good">
	                    <img  class="img-responsive center-block" src="${item.img_url}" alt="${item.name}">
	                </div>
	                    <p class="goodTitle">${item.name}</p>
	                    <p class="goodDescribe">
	                      ${item.description}
	                    </p>
	                    <p>
	                        <span class="goodPrice"><spring:message code="pay.unit"/>${item.price}</span>
	                        <a class="goodMore" href="/html/${language}/goods.html?id=${item.id}"><spring:message code="view.details" /></a>
	                    </p>
	            </div>
	         </c:forEach>
        </div>
    </div>

</div>

<div id="footer"></div>
<script>
    $("#footer").load("footer.html");
</script>

</body>
</html>