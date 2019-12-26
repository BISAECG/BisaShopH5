<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Use video</title>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <link href="/resources/ctrl/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/ctrl/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="/resources/css/public.css" rel="stylesheet">
    <script src="/resources/js/comm/jquery.min.js"></script>
    <script src="/resources/ctrl/bootstrap/js/bootstrap.js"></script>
    <script src="/resources/js/rootFont.js"></script>

</head>

<body>
<div id="header"></div>
<script>
    $("#header").load("head.html");
</script>
<div class="content">
    <div class="container-full">
        <div class="row" style="margin: 0;">
            <div class="col-xs-12"  style="height:0.2rem;background:rgba(241,241,241,1);">

            </div>
        </div>
    </div>
    <div class="container-full">
        <div class="row indexVideo">
            <div class="col-xs-12" style="padding: 0;margin-top: 0.5rem;margin-bottom: 1rem;">
                <video width="100%" id="audio" controls="controls">
                    <source src="/resources/css/instructions.mp4" type="video/mp4">
                </video>
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