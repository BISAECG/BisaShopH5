<style>
    .head div:nth-child(2) {
        margin-bottom: 0.1rem;
        margin-top: 0.1rem;
    }
    .head div:nth-child(3) i {
        width: 0.36rem;
        font-size: 0.60rem;
        margin-top: 0.2rem;
    }
    .list {
        background: rgba(255,255,255,1);
        width: 50%;
        top: 0.90rem;
        height: 15.05rem;
    }
    .list ul {
        list-style: none;
        padding-left: 0.20rem;
    }
    .list ul  li a{
        color: #333333;
        font-size: 0.30rem;
        text-decoration: none;
        display: inline-block;
        width: 90%;
        border-bottom: 0.01rem solid #C2C2C2;
        padding: 0.20rem 0;

    }
    .list ul li a i {
        color: #C2C2C2;
        font-size: 0.30rem;
        line-height: 0.31rem;
        float: right;
    }
    .fixedRight{
        position:fixed;
        right: 0;
        z-index: 99;
        top: 60%;
    }
    .fixedRight ul li{
        list-style: none;
    }
    .fixedRight ul li a{
        text-align: center;
        text-decoration: none;
        display: inline-block;
        width: 0.9rem;
        height: 0.9rem;
        background: rgb(51, 122, 183);
        border-radius: 0.1rem;
        margin-bottom: 0.1rem;
        color: #fff;
    }
    .fixedRight ul li a i{
        display: block;
        font-size:0.4rem;
        line-height: 0.9rem;
    }
    #lang{     
        margin-top: 0.12rem;  
        font-size: 0.28rem; 
        height: 0.68rem;
    }
</style>
<div class="container-fluid header">
    <div class="row head">
        <div class="col-xs-2 col-sm-2">
            <a data-toggle="collapse" aria-expanded="false" role="button" href="#collapseExample" aria-controls="collapseExample">
                <img style="margin-top:0.2rem;" class="img-responsive center-block" src="/resources/img/index/nav_left.png">
            </a>
        </div>
        <div class="col-xs-4 col-xs-offset-2 col-sm-4 col-sm-offset-2">
            <a href="index.html" style="margin-top: 0.2rem;margin-bottom: 0.2rem;">
                <img class="img-responsive center-block" src="/resources/img/index/logo.png">
            </a>
        </div>
        <div class="col-xs-3 col-xs-offset-1 col-sm-2 col-sm-offset-2 text-center" style="padding-left: 0px;padding-right: 10px;">
            <select id="lang" class="form-control">
                <option value="/index?lang=zh_CN">简体</option>
                <option value="/index?lang=zh_HK" selected="selected">繁體</option>
                <option value="/index?lang=en_US">English</option>
            </select>
        </div>
    </div>
</div>
<div class="container-fluid  collapse" id="collapseExample" style="position: absolute;width: 100%;z-index: 99;">
    <div class="row">
        <div class="list">
        	<ul id="nav"  style="pandding-top: 20px;" >
           			 <#list empList as item>
           				<li><a href='${item.name}.html'>${item.column_name_HK} <i class="fa fa-angle-right " aria-hidden="true"></i></a></li> 
						 <#if (item_index == 0)>
						 	<li> <a href="news.html">新聞<i class="fa fa-angle-right " aria-hidden="true"></i> </a></li>   
		                    <li> <a href="qa.html">健康問答<i class="fa fa-angle-right " aria-hidden="true"></i> </a></li>   
						 </#if>
					</#list>
            </ul>
        </div>
    </div>
</div>
<div class="fixedRight">
    <ul>
        <li>
            <a href="instructions.html">使用視屏</a>
        </li>
        <li>
            <a href="tel:+8675526880962"><i class="fa fa-volume-control-phone"></i></a>
        </li>
        <li>
            <a href="book.html"><i class="fa fa-commenting-o" aria-hidden="true"></i></a>
        </li>
        <li class="toTop">
            <a><i class="fa fa-arrow-up" aria-hidden="true"></i></a>
        </li>
    </ul>
</div>
<script>
$(document).ready(function() {
    /*返回顶部*/
    $(".toTop").click(function() {
        if ($('html').scrollTop()) {
            $('html').animate({
                scrollTop: 0
            }, 1000);
            return false;
        }
        $('body').animate({
            scrollTop: 0
        }, 1000);
        return false;
    });
    /*返回顶部*/
    $("#lang").change(function(){
    	location.href=$(this).val();
    });
    
    $.ajax({
        url: '/isLogin',
        type: "GET",
        async: false,
        success: function (data) {
        	if(data.code=="0"){
        		$("#nav").append("<li><a href='#'>个人中心<i class='fa fa-angle-right' aria-hidden='true'></i></a></li>");
        		$("#nav").append("<li><a href='/logout'>退出<i class='fa fa-angle-right' aria-hidden='true'></i></a></li>");
        	}else{
        		$("#nav").append("<li><a href='/login'>登入<i class='fa fa-angle-right ' aria-hidden='true'></i></a></li>");
        	}
        	
        }
 	});
});
</script>
