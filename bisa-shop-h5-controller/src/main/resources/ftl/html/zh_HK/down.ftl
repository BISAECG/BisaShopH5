<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"> 
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
     <meta name="keywords" content="${html_description}">
    <meta name="description" content="${html_keyWord}">
    <title>${html_title}</title>
    <link href="/resources/ctrl/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/ctrl/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="/resources/css/public.css" rel="stylesheet">
    <link href="/resources/css/download.css" rel="stylesheet">
    <script src="/resources/js/comm/jquery.min.js"></script>
    <script src="/resources/ctrl/bootstrap/js/bootstrap.js"></script>
    <script src="/resources/js/rootFont.js"></script>

</head>

<body>
    <div id="header"></div>
    <script>
        $("#header").load("header.html");
    </script>
    <div class="content">
        <div class="container-full">
            <div class="row" style="margin: 0;">
                <div class="col-xs-12"  style="height:0.2rem;background:rgba(241,241,241,1);">

                </div>
            </div>            
        </div>
        <div class="container-full">
                <div class="row down" >
                        <div class="text-center col-xs-6 col-xs-offset-3">
                                <p >碧沙康健APP</p>
                                <p >讓妳足不出戶測心電</p>
                                <p>Keep you indoors for ECG measurements</p>
                                <img  class="img-responsive center-block  downImg"  src="/resources/img/download/qr.png">
                        </div>
                    </div>
        </div>
        <div class="container-full">
                <div class="row" style="margin: 0;">
                    <div class="col-xs-12"  style="height:0.2rem;background:rgba(241,241,241,1);">
    
                    </div>
                </div>            
            </div>
            <div class="container" style="margin-bottom: 50px;">
                    <div class="row">
                        <div class="col-xs-12 downBtn">
                             <button id="downApp">
                                <span >APP下載</span>
                            </button>
                       
                        </div>
                    </div>            
            </div>

   			 </div>
    <div id="footer"></div>
    <script>
        $("#footer").load("footer.html");
    </script>
     <script type="text/javascript">
    	$('#downApp').click(function(){
    		 window.location.href = "/app/share/home";
    	});
    </script>
</body>

</html>