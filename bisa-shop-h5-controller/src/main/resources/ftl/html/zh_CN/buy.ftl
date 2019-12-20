<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>订单详情页</title>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <link href="/resources/ctrl/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/css/public.css" rel="stylesheet">
    <link href="/resources/ctrl/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="/resources/css/buy.css" rel="stylesheet">
    <script src="/resources/js/comm/jquery.min.js"></script>
    <script src="/resources/js/rootFont.js"></script>

</head>

<body>
    <div class="content">
        <div class="container">
            <div class="row return">
                <div class="col-xs-1 text-center">
                    <a href="details.html">
                        <i class="fa fa-chevron-left"></i>
                    </a>
                </div>
                <div class="col-xs-10  text-center">
                    <span>提交订单</span>
                </div>
            </div>
        </div>
        <div class="container-full">
            <div class="row" style="height:20px;background:rgba(241,241,241,1);margin: 0;">
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-xs-10 col-xs-offset-1 info">
                    <div class="row">
                        <div class="col-sm-10 col-sm-offset-2 col-xs-12 Personal_info">
                            <span class="default">默认</span>
                            <span class="username">胡新</span>
                            <span class="phone">13666666666</span>
                        </div>
                    </div>
                    <div class="row address">
                        <div class="col-xs-2">
                            <img class="img-responsive center-block" src="/resources/img/shop/logo.png">
                        </div>
                        <div class="col-xs-8">
                            <span>广东省深圳市宝安区全志科技园10E碧沙科技</span>
                        </div>
                        <div class="col-xs-2 text-right">
                            <a href="address.html"><i class="fa fa-chevron-right "></i></a>
                            
                        </div>

                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-10 col-xs-offset-1 info_two">
                    <div class="row">
                        <div class=" col-xs-4 col-xs-offset-1 product_img">
                            <img class="center-block img-responsive" src="/resources/img/shop/xixin.png">
                        </div>
                        <div class="col-xs-7">
                            <p class="product_title">悉心动态心电仪</p>
                            <p class="product_Introduction">世界首创三导联无线携带式心电记录仪 </p>
                            <div class="product_price">
                                <span class="col-red originalPrice">￥</span><span class="col-red originalPrice">1280</span>
                                <span class="col-666 discountedPrices">￥</span><span class="col-666 discountedPrices">1800</span>
                                <span class="col-666 quantityLeft">x</span><span class="col-666 quantityRight">1</span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-10 col-xs-offset-1 board">
                                <p>我们将尽快为您安排发货</p>
                                <p><span>买家留言:</span><input type="text" placeholder="给我们留言，最多140个字 " maxlength="140"></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-10 col-xs-offset-1 info">
                    <div class="row">
                        <div class="col-xs-10 col-xs-offset-1 pay">
                            <div class="row">
                                <span>购买数量</span>
                                <div class="goods_num clearfix pull-right">
                                    <div class="gw_num">
                                        <em class="less">-</em>
                                        <input id="goods_count" type="text" value="1" class="num" onkeyup="value=value.replace(/[^\d]/g,'')" maxlength="3" />
                                        <em class="add">+</em>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <span>邮费</span>
                                <span class="pull-right col-red">￥</span><span class="col-red pull-right">10</span>
                            </div>
                            <div class="row">
                                <span>优惠券</span>
                                <input class="pull-right" type="text" placeholder="请输入兑换码">
                            </div>
                            <div class="row">
                                <span>总价</span>
                                <span class="pull-right col-red">￥</span><span class="pull-right col-red">1220</span>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <div class="row">
                <div class="col-xs-11 col-xs-offset-1">                  
                        <div class="col-xs-12 buy">
                            <button class="pull-right">
                                <a href="order.html">
                                   立即下单
                                </a>
                            </button>
                            <button class=" pull-right">
                                <a href="#">
                                    电话咨询
                                </a>
                            </button>
                        </div>
               
                </div>
            </div>
        </div>


    </div>
</body>
<script type="text/javascript">
	//加号
	var num = parseInt($('#goods_count').val());
	//当购物车数量增加的时候
	$('.add').click(function() {
		num++;
		$('#goods_count').val(num);
	});
	//当购物车数量减少的时候
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