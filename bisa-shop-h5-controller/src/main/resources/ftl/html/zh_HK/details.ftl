<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>所有產品</title>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <link href="/resources/ctrl/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/css/public.css" rel="stylesheet">
    <link href="/resources/ctrl/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="/resources/css/details.css" rel="stylesheet">
    <script src="/resources/js/comm/jquery.min.js"></script>
    <script src="/resources/ctrl/bootstrap/js/bootstrap.js"></script>
    <script src="/resources/js/rootFont.js"></script>
</head>

<body>
    <div class="content">
        <div class="container-full" style="background:rgba(248,248,248,1);">
            <div class="row" style="margin:0;">
                <div class="col-xs-12 return">
                    <i class="fa fa-chevron-left"></i>
                    <a href="shop.html">返回</a>
                </div>
            </div>
            <div class="row" style="margin:0;">
                <div class="col-xs-12">
                    <img class="img-responsive shopImg center-block pb-30" src="/resources/img/shop/xixin1.png">
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <p class="product_title">悉心動態心電儀</p>
                    <p class="product_Introduction">世界首創三導聯無線攜帶式心電記錄儀 </p>
                    <p class="product_price">
                        <span>￥1280</span>
                        <span>￥1800</span>
                    </p>
                    <div class="goods_num clearfix mb-10">
                        <span class="num_name  span_title ">數 量：</span>
                        <div class="gw_num">
                            <em class="less">-</em>
                            <input id="goods_count" type="text" value="1" class="num" onkeyup="value=value.replace(/[^\d]/g,'')" maxlength="3" />
                            <em class="add">+</em>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="container-full">
            <div class="row" style="background:rgba(241,241,241,1); width:100%;height:10px;margin:0;">

            </div>
            <div class="row" style="margin:0;">
                <div class="col-xs-12 buy" style="padding:13px 0px;">
                    <button class="pull-right">
                        <a  href="buy.html">
                                提交訂單
                        </a>

                    </button>
                    <button class="pull-right ">
                        <a>
                             電話咨詢
                        </a>

                    </button>
                </div>
            </div>

            <div class="row center-block">
                <img class="img-responsive" src="/resources/img/shop/ecg.png">
            </div>

        </div>

    </div>
</body>
<script type="text/javascript">
	//加號
	var num = parseInt($('#goods_count').val());
	//當購物車數量增加的時候
	$('.add').click(function() {
		num++;
		$('#goods_count').val(num);
	});
	//當購物車數量減少的時候
	$('.less').click(function() {
		if (num > 1) {
			num--;
			$('#goods_count').val(num);
		}
	});
	
	function order(){
		var goods_count=$('#goods_count').val();
		 location.href="/html/zh_CN/order.html?goods_id=10&goods_count="+goods_count;
	}
</script>
</html>