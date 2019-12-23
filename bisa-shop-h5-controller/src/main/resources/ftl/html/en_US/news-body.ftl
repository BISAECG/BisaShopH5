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
        $("#header").load("header.html");
    </script>
<div class="wrap clear">
    <div class="row pt-rem025">
        <div class="col-md-12">
            <div class="clear container">
                <p class="col-3f3b3c f-24 text-center line-h-30 text-overflow news-title">
                 ${title}
                </p>
              
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="clear main-details f-rem025 container pb-20 bor bor-b bor-col-e4e4e4 news-content">
           	  ${news_content}
            </div>
        </div>
    </div>
    <div class="row ">
        <div class="col-md-12">
            <div class="clear container">
  
                <p class="col-898989 f-rem025 text-right line-h-25 mt-5 mb-5">
                    <span class="col-898989">Date：${release_time}</span>
                    <span class="col-898989 mr-10 cur-new-time"> </span>
                    <span class="col-898989 ml-10">Reading：${read_quantity}</span>
                    <span class="col-898989 cur-new-total"> </span>
                </p>
            </div>
        </div>
    </div>
</div>
<div id="footer"></div>
<script>
    $("#footer").load("footer.html");
</script>
</body>
</html>