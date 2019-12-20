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
        $("#header").load("head.html");
    </script>
    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <img class="img-responsive center-block" src="/resources/img/index/banner-us.png"> 
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <p class="title-p">Why choose Bisa Dynamic ECG Recorder</p>
                <div class="line">
                    <p class="line-top"></p>
                    <p class="line-btm"></p>
                </div>
            </div>
            <div class="row">            
                    <img class="img-responsive center-block" src="/resources/img/index/banner1-us.png">
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <p class="title-p">Bisa video display</p>
                <div class="line">
                    <p class="line-top"></p>
                    <p class="line-btm"></p>
                </div>
            </div>
            <div class="row indexVideo">
                <div class="col-xs-12">
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <p class="title-p">Bisa Product Certificate</p>
                <div class="line">
                    <p class="line-top"></p>
                    <p class="line-btm"></p>
                </div>
            </div>
            <div class="row certificate">
                <div class=" text-center col-xs-6">
                    <img src="/resources/img/index/chanpin.png">
                    <p>Medical Device Production License</p>
                </div>
                <div class=" text-center col-xs-6">
                    <img src="/resources/img/index/chanpin1.png">
                    <p>CFDA Registration Certificate</p>
                </div>
            </div>
            <div class="row" style="margin-top: 0.38rem;">
                <img class="img-responsive center-block" src="/resources/img/index/banner2-us.png">
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <p class="title-p">Bisa News</p>
                <div class="line">
                    <p class="line-top"></p>
                    <p class="line-btm"></p>
                </div>
            </div>

            <div class="row">
                <div class="col-xs-12" style="padding: 0;">
                        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                                <!-- Indicators -->
                                <!--<ol class="carousel-indicators">-->
                                    <!--<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>-->
                                    <!--<li data-target="#carousel-example-generic" data-slide-to="1"></li>-->
                                    <!--<li data-target="#carousel-example-generic" data-slide-to="2"></li>-->
                                <!--</ol>-->
                                <!--Wrapper for slides-->
                                <div class="carousel-inner" role="listbox">
                                    <div class="item active">
                                        <div class="row indexNews">
                                            <div class="col-xs-5">
                                                <img class="img-responsive center-block" src="/resources/img/index/chanpin.png">
                                            </div>
                                            <div class="col-xs-7">
                                                <p>Hong Kong International Medical and Health Exhibition</p>
                                                <p>
                                                    Hong Kong International Medical and Hong Kong International Medical and Hong Kong International Medical and Health Exhibition Participation Successfully
                                                     Concluded Hong Kong International Medical and Health Exhibition Participation Successfully Ended Hong Kong 
                                                    International Medical and Hong Kong International Medical and Health Exhibition Participation Exhibition Participation Comes to a Successful End
                                                </p>
                                                <p>
                                                    <span>time:</span>
                                                    <span>2019-06-18 11:10:45</span>
                                                    <span>read:</span>
                                                    <span>100</span>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="item">
                                        <img src="">
                                        <div class="carousel-caption">
                                            ...
                                        </div>
                                    </div>
                                    <div class="item">
                                        <img src="">
                                        <div class="carousel-caption">
                                            ...
                                        </div>
                                    </div>
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
                    <img class="img-responsive center-block" src="/resources/img/index/offer.png">
            </div>
        </div>
    </div>
    <div id="footer"></div>
    <script>
        $("#footer").load("foot.html");
    </script>
</body>
<script>
    $('.carousel').carousel({
        interval: 1000000
    })
</script>

</html>