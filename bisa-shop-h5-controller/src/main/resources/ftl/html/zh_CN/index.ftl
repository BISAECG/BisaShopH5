<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>碧沙</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
   <meta name="keywords" content="${html_description}">
    <meta name="description" content="${html_keyWord}">
    <title>${html_title}</title>
    <link href="/resources/ctrl/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/ctrl/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="/resources/css/public.css" rel="stylesheet">
    <link href="/resources/css/index.css" rel="stylesheet">
    <script src="/resources/js/comm/jquery.min.js"></script>
    <script src="/resources/js/rootFont.js"></script>
    <script src="/resources/ctrl/bootstrap/js/bootstrap.js"></script>
</head>

<body>
    <div id="header"></div>
    <script>
        $("#header").load("header.html");
    </script>
    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <img class="img-responsive center-block" src="/resources/img/index/banner.png"> 
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <p class="title-p">为什么选择碧沙动态心电记录仪</p>
                <div class="line">
                    <p class="line-top"></p>
                    <p class="line-btm"></p>
                </div>
            </div>
            <div class="row">            
                    <img class="img-responsive center-block" src="/resources/img/index/banner1.png">
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <p class="title-p">碧沙视屏展示</p>
                <div class="line">
                    <p class="line-top"></p>
                    <p class="line-btm"></p>
                </div>
            </div>
            <div class="row indexVideo">
                <div class="col-xs-12" style="padding: 0;">
                    <video width="100%" id="audio" controls="controls" >
                        <source src="https://bisa-hk-comm-data.oss-cn-hongkong.aliyuncs.com/video/PECG_zh_CN.mp4" type="video/mp4">
                    </video>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <p class="title-p">碧沙产品证书</p>
                <div class="line">
                    <p class="line-top"></p>
                    <p class="line-btm"></p>
                </div>
            </div>
            <div class="row certificate">
                <div class=" text-center col-xs-6">
                    <a href="/resources/img/certificate/SCZ.png">
                        <img src="/resources/img/index/chanpin.png">
                        <p>医疗器械生产许可证</p>
                    </a>
                </div>
                <div class=" text-center col-xs-6">
                    <a  href="/resources/img/certificate/zcz.png">
                        <img src="/resources/img/index/chanpin1.png">
                        <p>CFDA注册证</p>
                    </a>
                </div>
            </div>
            <div class="row" style="margin-top: 0.38rem;">
                <img class="img-responsive center-block" src="/resources/img/index/banner2.png">
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <p class="title-p">碧沙新闻资讯</p>
                <div class="line">
                    <p class="line-top"></p>
                    <p class="line-btm"></p>
                </div>
            </div>

            <div class="row">
                <div class="col-xs-12" style="padding: 0;">
                       	   <div id="carousel-example-generic" class="carousel slide" data-ride="carousel" data-ride="carousel" data-interval="10000">
                              
            					   <!--Wrapper for slides-->
                                <div class="carousel-inner" id="newsBox" role="listbox">
                                    
                                </div>
            
                                <!-- Controls -->
                                <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                        <span class="sr-only">Previous</span>

                                </a>
                                <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>

                </div>

            </div>
            <div class="row Offer">
                    <img class="img-responsive center-block" src="/resources/img/index/offer.gif">
                    <div>
                        <a href="/app/share/taobao" >淘宝</a>
                        <a href="https://mall.jd.com/index-10103348.html">京东</a>
                    </div> 
            </div>
        </div>
    </div>
    <div id="footer"></div>
    <script>
        $("#footer").load("footer.html");
    </script>
</body>
<script>
    $(document).ready(function () {
        //新闻内容获取
        function indexNew() {

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
                    	
                    	$("#newsBox").append(
                    	     '<div class="item '+active+'">'+
                                '<div class="row indexNews">'+
                                 	'<div class="col-xs-5">'+
                                     	'<img class="img-responsive center-block" src="'+item.img_url+'">'+
                                    '</div>'+
                                    '<div class="col-xs-7">'+
                                        '<p>'+item.news_title+'</p>'+
                                        '<p>'+item.news_describe+'</p>'+
                                        '<p>'+
                                            '<span>日期:</span>'+
                                            '<span>'+item.release_time+'</span>'+
                                            '<span><br/>阅读量:</span>'+
                                            '<span>'+item.read_quantity+'</span>'+
                                        '</p>'+
                                    '</div>'+
                                '</div>'+
                            '</div>'		
                    	);
                    	
                       
                    });
                }
            });
        }

        indexNew();
        
    });
    </script>

</html>