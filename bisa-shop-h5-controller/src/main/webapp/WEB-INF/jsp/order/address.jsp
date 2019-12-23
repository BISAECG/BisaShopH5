<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
                    <span >ç¼è¾æ¶è´§å°å</span>
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
                            <label for="username" class="col-xs-2">å§å</label>
                            <div class="col-xs-10">
                                <input type="text" class="form-control" id="username" placeholder="è¯·è¾å¥æ¶è´§äººå§å">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="phone" class="col-xs-2">çµè¯</label>
                            <div class="col-xs-10">
                                <input type="text" class="form-control" id="phone" placeholder="è¯·è¾å¥ææºå·">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="area" class="col-xs-3 col-sm-2  areaOne">æå¨å°åº</label>
                            <div class="col-xs-9 col-sm-10 area">
                                <!-- <input type="text" class="form-control" id="area" placeholder="è¯·éæ©æå¨å°åº"> -->
                                <label class="checkbox-inline" >
                                    <input hidden type="checkbox" id="inlineCheckbox1" checked value="é¦æ¸¯"> é¦æ¸¯
                                </label>
                                <label class="checkbox-inline">
                                    <input hidden type="checkbox" id="inlineCheckbox2" value="å°æ¹¾"> å°æ¹¾
                                </label>
                                <label class="checkbox-inline">
                                    <input hidden type="checkbox" id="inlineCheckbox3" value="æ¾³é¨"> æ¾³é¨
                                </label>
                                <label class="checkbox-inline">
                                    <input hidden type="checkbox" id="inlineCheckbox4" value="æ°å å¡"> æ°å å¡
                                </label>
                                <label class="checkbox-inline">
                                    <input hidden type="checkbox" id="inlineCheckbox5" value="ä¸­å½å¤§é"> ä¸­å½å¤§é
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="address" class="col-xs-3 col-sm-2">è¯¦ç»å°å</label>
                            <div class="col-xs-9 col-sm-10">
                                <input type="text" class="form-control" id="address" placeholder="è¯·è¾å¥è¯¦ç»å°å">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-12">
                                <button type="submit" class="btn full-w text-center register_submit">
                                    <a href="buy.html">æäº¤å¹¶ä¿å­</a>
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