<div class="container-fluid footer">
    <div class="row">
        <div class="col-xs-12">
            <ul>
            	<#list empList as item>
           				<li><a href='${item.name}.html'>${item.column_name_CN} <i class="fa fa-chevron-right pull-right" ></i></a></li> 
						 <#if (item_index == 0)>
						 	<li> <a href="news.html">新闻<i class="fa fa-chevron-right pull-right" ></i> </a></li>   
		                    <li> <a href="qa.html">健康问答<i class="fa fa-chevron-right pull-right"></i> </a></li>   
						 </#if>
				 </#list>
            </ul>
        </div>
    </div>
    <div class="row mt-20 down">
        <div class="col-xs-2 col-xs-offset-5 ">
            <img src="/resources/img/index/app_qr.png">
        </div>
    </div>
    <div class="row downName">
        <div class="col-xs-12 text-center">
            <p>悉心心电仪App</p>
        </div>
    </div>
    <div class="row text-center footInfo">
        <div class="col-xs-12 ">
            <p>
                本网站内所示之图片只供参考
            </p>
            <p>
                <span>Copyright2017.</span>${company_name}<span> All Rights Reserved.</span>
            </p>
        </div>
    </div>
</div>
<style>
.footer{
    background:rgba(43,43,49,1);
    padding-left: 0.29rem;
    padding-right: 0.29rem;
}
.footer ul{
    list-style: none;
    padding: 0;
}
.footer ul li{
    border-bottom: 0.02rem solid rgba(159, 159, 159, 1);
    padding: 0.17rem 0 0.18rem 0;
    line-height:1;
}
.footer ul li:first-of-type{
    margin-top: 0.3rem;
}
.footer ul li a{
    display: inline-block;
    width: 100%;
    font-size: 0.22rem;
    text-decoration: none;
    color: rgba(255, 255, 255, 1);
}
.footer ul li i{
    color: rgba(255, 255, 255, 1);
    font-size: 0.2rem;

    margin-top: 0.05rem;
}
.footer .down{
margin-top: 0.2rem;
}
.footer .down img{
    width: 0.86rem;
}
.footer .downName{
    padding-top: 0.11rem;
    padding-bottom: 0.27rem;
    border-bottom: 0.01rem solid  rgba(50,49,55,1);
}
.footer .downName p{
   color:rgba(224,214,214,1);
   font-size:0.2rem;
   margin-bottom: 0;
}
.footer .footInfo{
margin-top: 0.1rem;

}
.footer .footInfo p:first-of-type{
    font-size:0.16rem;
color:rgba(102,102,102,1);
}
.footer .footInfo p:last-of-type{
    font-size:0.14rem;
    color:#999999;
    padding-bottom: 0rem;
    margin-bottom: 0.28rem;
}
.footer .footInfo p:last-of-type span{
    font-weight: bold;
}
</style>