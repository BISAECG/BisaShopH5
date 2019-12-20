<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>编辑收货地址</title>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <link href="/resources/ctrl/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/css/public.css" rel="stylesheet">
    <link href="/resources/ctrl/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="/resources/css/address.css" rel="stylesheet">
    <script src="/resources/js/comm/jquery.min.js"></script>
    <script src="/resources/js/rootFont.js"></script>
</head>

<body>
    <div class="content">
        <div class="container">
            <div class="row return">
                <div class="col-xs-1 text-center">
                    <a href="buy.html">
                        <i class="fa fa-chevron-left" ></i>
                    </a>
                </div>
                <div class="col-xs-10 text-center " >
                    <span >编辑收货地址</span>
                </div>
            </div>
        </div>
        <div class="container-full">
                <div class="row" style="height:0.2rem;background:rgba(241,241,241,1);margin: 0;">
                </div>
            </div>
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <form class="form-horizontal " action="#" method="post">
                        <div class="form-group">
                            <label for="username" class="col-xs-2">姓名</label>
                            <div class="col-xs-10">
                                <input type="text" class="form-control" id="username" placeholder="请输入收货人姓名">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="phone" class="col-xs-2">电话</label>
                            <div class="col-xs-10">
                                <input type="text" class="form-control" id="phone" placeholder="请输入手机号">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="area" class="col-xs-3 col-sm-2  areaOne">所在地区</label>
                            <div class="col-xs-9 col-sm-10 area">
                                <!-- <input type="text" class="form-control" id="area" placeholder="请选择所在地区"> -->
                                <label class="checkbox-inline" >
                                    <input hidden type="checkbox" id="inlineCheckbox1" checked value="香港"> 香港
                                </label>
                                <label class="checkbox-inline">
                                    <input hidden type="checkbox" id="inlineCheckbox2" value="台湾"> 台湾
                                </label>
                                <label class="checkbox-inline">
                                    <input hidden type="checkbox" id="inlineCheckbox3" value="澳门"> 澳门
                                </label>
                                <label class="checkbox-inline">
                                    <input hidden type="checkbox" id="inlineCheckbox4" value="新加坡"> 新加坡
                                </label>
                                <label class="checkbox-inline">
                                    <input hidden type="checkbox" id="inlineCheckbox5" value="中国大陆"> 中国大陆
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="address" class="col-xs-3 col-sm-2">详细地址</label>
                            <div class="col-xs-9 col-sm-10">
                                <input type="text" class="form-control" id="address" placeholder="请输入详细地址">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-12">
                                <button type="submit" class="btn full-w text-center register_submit">
                                    <a href="buy.html">提交并保存</a>
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>

</html>