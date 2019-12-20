<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>登录</title>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <link href="/resources/ctrl/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/css/comm/base.css" rel="stylesheet">
    <link href="/resources/css/index/comm.css" rel="stylesheet">
    <link href="/resources/ctrl/font-awesome-4.7.0/css/font-awesome.css" rel="stylesheet">
    <link href="/resources/css/index/HK_Reg.css" rel="stylesheet">
    <link href="/resources/css/static/login.css" rel="stylesheet">
    <script src="/resources/js/comm/jquery.min.js"></script>
    <script src="/resources/ctrl/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <script src="/resources/js/arealist.js"></script>
</head>
<style>
        .head div {
        margin-bottom: 1rem;
        margin-top: 1rem;
    }
</style>
<body>
    <div id="header"></div>
    <script>
        $("#header").load("head.html");
    </script>
    <div class="content">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="main">
                        <div class="login-div">
                            <div class="clear">
                                <div class="login-title pt-20 ">
                                    <div class=" login-tabcontrolv2 col-xs-6 text-right">
                                        <span>账户登录</span>
                                    </div>
                                    <div class=" login-tabcontrolv1 col-xs-6 text-left">
                                        <span>免密登录</span>
                                    </div>
                                </div>
                                <div class="clear pl-35 msg-wrap mt-20">
                                    <div class="msg-error ">
                                        <b></b><span></span>
                                    </div>
                                </div>

                                <!-- 账户登录 -->
                                <div class="login-tabcontentv2 ">
                                    <form class="login-main-formpwd form-horizontal clear" method="post">
                                        <div class="clear  form-group ">
                                            <div class="clear input-group mb-20 col-xs-12">
                                                <div class="clear  login_input text-center col-xs-12  pull-left mr-0 ml-0 radius-0 pos-r ">
                                                    <input
                                                        class="form-control full-wh  usernemeinput"
                                                        type="text" name="username" maxlength="36"
                                                        placeholder="请输入您的手机号/邮箱">
                                                    <span  class="usernamemsg  clear dis-b text-left pull-left"></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class=" form-group">
                                            <div class="clear input-group mb-20 col-xs-12">
                                                <div
                                                    class="clear login_input text-center col-xs-12  pull-left mr-0 ml-0 radius-0 pos-r">
                                                    <input
                                                        class="form-control  full-wh  userpwdinput pull-left"
                                                        type="password" name="password" maxlength="12"
                                                        placeholder="请输入您的密码">
                                                    <span
                                                        class="userpwdmsg  clear dis-b text-left pull-left"></span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="clear h-30 line-h-30">
                                            <!-- 自动登录 值为0时候未选中，为一的时候为选中 -->
                                            <div class="ml-0 mr-10 clear pull-left pos-r i-check">
                                                <input name="rememberMe" id="rememberMe" type="checkbox" value="0">
                                                <label></label>
                                            </div>
                                            <label class="col-999 pull-left  line-h-30">下次自动登录</label>
                                            <a class="ml-0 mr-5 clear pull-right pos-r  t-nonehove hovecol-5cb85c-bold"
                                                href="findPassword.html" style="color:rgba(45,110,153,1);">
                                                忘记密码?
                                            </a>
                                        </div>
                                        <!--<%&#45;&#45;登入按钮&#45;&#45;%>-->
                                        <div class="clear mt-20 mb-20">
                                            <button type="submit" class="btn full-w text-center " id="pwd-btn">
                                                登录
                                            </button>
                                        </div>
                                    </form>
                                </div>

                                <!--  免密登录 -->

                                <div class=" login-tabcontentv1  dis-n">
                                    <form class="login-main-formphone form-horizontal" method="post">
                                        <div class="clear h-50 form-group  phonecode-box"
                                            style="margin-left: 0px;margin-right: 0px;">
                                            <div class="input-group mt-10 mb-20 col-xs-12 pos-r">
                                                <div class="clear text-center col-xs-3   input-group-addon bg-white bor-c radius-3" style="padding: 0px;">
                                                    <select
                                                        class="form-control bor-col-white boxsha-none focu-bor-66afe9   pr-12i radius-3i sel-telphone selectpicker"
                                                        onchange="selectArea()" id="selectpicker" name="selectpicker">
                                                    </select>
                                                </div>
                                                <div
                                                    class="clear  text-center pull-left radius-0 pos-r col-xs-9  pr-0" style="padding-left: 0;">
                                                    <input  class="form-control full-wh  bor-l-none userphoneinput"
                                                        type="text" name="username" maxlength="15"
                                                        placeholder="请输入您的手机号码">
                                                    <span
                                                        class="userphonemsg clear dis-b text-left pull-left"></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clear h-50 form-group  mb-50 mt-30"
                                            style="margin-left: 0px;margin-right: 0px;">
                                            <div class="clear input-group mt-10 mb-20 col-xs-12 ">
                                                <div  class="clear  text-center   mr-0 ml-0  pos-r pl-0">
                                                    <input class="form-control  full-wh "  type="text" name="icode" maxlength="4" placeholder="请输入动态密码">
                                                    <button type="button"  class="pos-a  r-0 t-0 z-99  btn  text-center min-w-120 sendMessagebtn">
                                                        获取动态密码
                                                    </button>
                                                    <span
                                                        class="usercodemsg clear dis-b text-left"></span>
                                                </div>
                                            </div>
                                        </div>

                                        <div style="margin-top: 4rem;">
                                            <button type="submit" class="full-w text-center btn" id="nopwd-btn">
                                                登录
                                            </button>
                                        </div>
                                    </form>
                                </div>
                                <div class="clear h-20 line-h-20 f-14 col-666 pl-20  text-right mt-20 mb-5">
                                    <a class="hovecol-5cb85c-bold t-nonehove mr-5 dis-ib" href="reg.html">
                                        立即注册
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
    $(document).ready(function () {

        show_msg(); //显示异常信息

        loadAreaList(); //加载地区、区号相关数据，function位于areaList.js

        /*发送短信验证码*/
        $(".sendMessagebtn").click(function () { //发送短信
            sendMessage();
        });

        /*免密登录表单验证*/
        $(".login-main-formphone").bootstrapValidator({
            submitHandler: function (valiadtor, loginForm, submitButton) {
                valiadtor.defaultSubmit();
            },
            fields: {
                username: {
                    container: '.userphonemsg',
                    validators: {
                        notEmpty: {
                            message: '手机号码不能为空值' //'手机号码不能为空值.'
                        },
                        stringLength: {
                            min: 6,
                            max: 15,
                            message: '手机号码不能小于6或者大于15' //'手机号码不能小于6或者大于15.'
                        },
                        regexp: {
                            regexp: /^[0-9-]+$/,
                            message: '手机号码只能包含数字和连接符' //'手机号码只能包含数字和连接符.'
                        },
                    }
                },
                icode: {
                    container: '.usercodemsg',
                    validators: {
                        notEmpty: {
                            message: '动态密码不能为空值' //'动态密码不能为空值.'
                        },
                        digits: {
                            message: '只能是数字' //'只能是数字！'
                        },
                        stringLength: {
                            min: 4,
                            max: 4,
                            message: '必须是4位数字' //'必须是4位数字!'
                        }
                    }
                }
            }
        });

        /*账号密码登录校验*/
        $(".login-main-formpwd").bootstrapValidator({
            message: '请输入用户名/密码', //'请输入用户名/密码',
            submitHandler: function (valiadtor, loginForm, submitButton) {
                rememberMe($("input[name='rememberMe']").is(":checked"));
                valiadtor.defaultSubmit();
            },
            fields: {
                username: {
                    container: '.usernamemsg',
                    validators: {
                        notEmpty: {
                            message: '用户名不能为空值' //'用户名不能为空值.'
                        },
                        stringLength: {
                            max: 12,
                            message: '用户名不能大于12位' //'用户名不能大于12位.'
                        },
                    },
                },
                userpwd: {
                    container: '.userpwdmsg',
                    validators: {
                        notEmpty: {
                            message: '密码不能为空值' //'密码不能为空值.'
                        },
                        different: {
                            field: 'username',
                            message: '密码和用户名不能一样' //'密码和用户名不能一样'
                        },
                        regexp: {
                            regexp: /^[a-zA-Z0-9_]+$/,
                            message: '密码只能包含大写和小写数字和下划线' //'密码只能包含大写、小写、数字和下划线'
                        },
                        stringLength: {
                            min: 8,
                            message: '密码长度不能小于8位' //'密码长度不能小于8位.'
                        }
                    }
                },
            },
        });

        $(".show-weixinlogin").on("click", function (event) {
            event.stopPropagation();
            var target = event.target;
            if (!$(target).closest(".weixinlogin-content").length > 0 || $(target).attr("class")
                .indexOf("close-mod") != -1) {
                $(".weixinlogin-content").removeClass("ani-weixin-logoin");
                $(".weixinlogin-content").addClass("ani-weixin-logoout");
                $(".show-weixinlogin").fadeOut();
            };
        });

        /*下次自动登录*/
        $('#rememberMe').click(function () {
            if ($(this).prop("checked")) {
                $(this).val(1);
            } else {
                $(this).val(0);
            }
        });
    });

    //----------------------------------发送验证码---------------------------
    function sendMessage() {
        var InterValObj; //timer变量，控制时间
        var count = 90; //间隔函数，1秒执行
        var curCount; //当前剩余秒数
        var code = ""; //验证码
        var codeLength = 4; //验证码长度
        var curCount = count;
        var phoneNumber = $(".userphoneinput").val(); //拿到当前输入的手机号码
        var passverify = $(".phonecode-box").hasClass("has-success");
        var select = $("#selectpicker").val();

        if (passverify) { //验证手机号
            //产生验证码 ,向用户手机发送验证码由后台实现,前台实现了倒计时
            //向后台发送处理数据
            $.ajax({ //当点击发送验证码时,可能向后台执行的ajax事件
                type: "GET", //用POST方式传输
                dataType: "text", //数据格式:text
                url: http_request + "/web/call/icode?phone=" + phoneNumber + "&selectpicker=" + select,
                success: function (msg) {
                    if (msg == "200") {
                        //设置button效果，开始计时
                        $(".sendMessagebtn").attr("disabled", "true"); //禁用重新发送按钮
                        $(".sendMessagebtn").css("color", "#666"); //修改按钮值颜色
                        $(".sendMessagebtn").text(curCount + "s" + '重新发送'); //按钮值修改为 '倒计时' + '重新发送'
                        InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次
                    } else {
                        msg = getMessage(msg);
                        showMessage(msg);
                    }
                }
            });
        } else {
            $(".userphonemsg").find("small:visible").text('请输入正确的手机号码'); //"请输入正确的手机号码！"
            $(".userphoneinput").focus(); //获取手机号输入框input焦点
            return false;
        }

        //timer处理函数
        function SetRemainTime() {
            if (curCount == 0) { //当倒计时等于0时
                window.clearInterval(InterValObj); //停止计时器
                $(".sendMessagebtn").removeAttr("disabled"); //启用重新发送按钮
                $(".sendMessagebtn").css("background-color", "#D7DCDE");
                $(".sendMessagebtn").css("border-color", "#D7DCDE");
                $(".sendMessagebtn").css("color", "#868b8a"); //修改按钮值颜色
                $(".sendMessagebtn").text('重新发送'); //按钮值修改为	重新发送
                code = ""; //清除验证码。如果不清除，过时间后，输入收到的验证码依然有效
            } else {
                curCount--; //当倒计时不等于0时
                $(".sendMessagebtn").text(curCount + "s" + '重新发送'); //倒计时执行计数
            }
        };
    }

    //--------------------选项卡切换------------------------------------
    function clickLoginTab(pre_type) {
        if (pre_type == "2") {
            clickCodeLogin();
        } else if (pre_type == "1") {
            clickPwdLogin();
        }
    }

    //点击选项卡切换
    $(".login-tabcontrolv1").click(function () {
        clickPwdLogin();
        hideMessage(); //清空异常消息栏
    });
    $(".login-tabcontrolv2").click(function () {
        clickCodeLogin();
        hideMessage(); //清空异常消息栏
    });

    //密码登录  选项卡
    function clickPwdLogin() {
        $(".login-tabcontrolv2").find("span").css("color", "#333333"); // 先删除所有元素的selected样式
        $(".login-tabcontrolv1").find("span").css("color", "#2D6E99"); // 然后为被点击元素添加selected样式

        $(".login-tabcontentv2").hide();
        $(".login-tabcontentv1").show();
    }

    //免密登录  选项卡
    function clickCodeLogin() {
        $(".login-tabcontrolv1").find("span").css("color", "#333333"); // 先删除所有元素的selected样式
        $(".login-tabcontrolv2").find("span").css("color", "#2D6E99"); // 然后为被点击元素添加selected样式
        $(".login-tabcontentv1").hide();
        $(".login-tabcontentv2").show();
    }

    //------------------------异常消息显示-------------------------------------
    function show_msg() {
        var pre_type = type;
        clickLoginTab(pre_type); //切换选项卡
        if (message != null && message != '' && message != 'null' && message != 'unfine') {
            message = getMessage(message);
            showMessage(message);
        } else {
            //从url中获得message参数的值
            var param = window.location.search;
            var msg = getURLArg(param, "msg");
            if (msg != null && msg != "") {
                msg = getMessage(msg);
                showMessage(msg);
            }
        }
    }

    /*异常信息*/
    function showMessage(msg) {
        msg = "<b></b>" + msg;
        $(".msg-error").html(msg);
        $(".msg-error").css("display", "block");
    }

    //隐藏异常信息框
    function hideMessage() {
        msg = "";
        $(".msg-error").html(msg);
        $(".msg-error").css("display", "none");
    }

    /*根据消息代码显示异常信息*/
    function getMessage(msg) {
        if (msg == "200") {
            return '请登录';
        } //请登录!
        if (msg == "1001") {
            return '手机号不能为空';
        } //手机号不能为空！
        if (msg == "1002") {
            return '账号未注册,请注册新账号';
        } //账号未注册，请注册新账号！
        if (msg == "1004") {
            return '操作失败';
        } //操作失败！
        if (msg == "1005") {
            return '验证码错误';
        } //验证码错误！
        if (msg == "1007") {
            return '地区有误';
        } //地区有误！
        if (msg == "1008") {
            return '用户名或密码错误';
        } //用户名或密码错误！
        if (msg == "1009") {
            return '账号锁定';
        } //账号锁定！
        if (msg == "1010") {
            var pre_type = type;
            if (pre_type == 2) {
                return '用户名或验证码错误'; //用户名或验证码错误！
            } else {
                return '用户名或密码错误'; //用户名或密码错误！
            }
        }
        if (msg == "1011") {
            return '尝试登录失败超过5次账号锁定8小时';
        } //尝试登录失败超过5次，账号锁定8小时！
    }

    // /**
    //  * 获取url参数
    //  * @param url 目标url
    //  * @param arg 目标参数名
    //  * @returns
    //  */
    function getURLArg(params, arg) {
        var reg = new RegExp("(^|&)" + arg + "=([^&]*)(&|$)");
        var r = params.substr(1).match(reg);
        if (r != null)
            return unescape(r[2]);
        return null;
    }
</script>

</html>