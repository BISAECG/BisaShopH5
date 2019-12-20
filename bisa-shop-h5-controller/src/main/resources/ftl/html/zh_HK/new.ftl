<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>新聞資訊</title>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <link href="/resources/ctrl/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/ctrl/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="/resources/css/public.css" rel="stylesheet">
    <link href="/resources/css/new.css" rel="stylesheet">
    <script src="/resources/js/comm/jquery.min.js"></script>
    <script src="/resources/ctrl/bootstrap/js/bootstrap.js"></script>
    <script src="/resources/js/rootFont.js"></script>
</head>

<body>
    <div id="header"></div>
    <script>
        $("#header").load("head.html");
    </script>
    <div class="content bg">
        <div class="container-full">
            <div class="row" style="margin: 0;">          
                    <img class="img-responsive center-block" src="/resources/img/news/banner-hk.png">            
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-xs-12 title">
                    <div></div>
                    <span>健康資訊</span>
                </div>
            </div>
            <div class="row top_news">
                <div class="col-xs-4" style="padding-right: 0;">
                    <img class="new_img img-responsive center-block" src="/resources/img/index/chanpin2.png">
                </div>
                <div class="col-xs-8 new_span">
                    <p class="new_title titleTopping">ISO13485醫療器械質量管理體系內審</p>
                    <p class="new_con">力求碧沙內部質量管理及產品質量任何時刻都嚴格遵守國際標準規範，經得起消費者、市場、政府的監督考驗。</p>
                    <span>日期</span>
                    <span class="new_time timeTopping">2019-06-25 09:59:09</span>
                    <span class="newRead">閱讀：</span>
                    <span class="new_read">131</span>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12 "
                    style="  margin-top: 0.24rem;   border-bottom: 0.01rem solid #ECECEC;padding-bottom: 0.1rem;">
                    <div class="col-xs-3 timeOrdinary">
                        <span class="new_time ">2019-06-25 </span>
                    </div>
                    <div class="col-xs-8" style="padding: 0;">
                        <span class="new_title titleOrdinary">碧莎亮相2018香港秋季電子產品展</span>
                    </div>
                    <div class="col-xs-1 more" style="padding: 0;">
                        詳情  <i class="fa fa-chevron-right pull-right"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="footer"></div>
    <script>
        $("#footer").load("foot.html");
    </script>
</body>

</html>