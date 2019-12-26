<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>${html_title}</title>
    <meta name="keywords" content="${html_description}">
    <meta name="description" content="${html_keyWord}">
    <link href="/resources/ctrl/layui/css/layui.css" rel="stylesheet">
    <link href="/resources/ctrl/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/ctrl/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="/resources/css/public.css" rel="stylesheet">
    <link href="/resources/css/index.css" rel="stylesheet">
    <script src="/resources/js/comm/jquery.min.js"></script>
    <script src="/resources/ctrl/layui/layui.js"></script>
    <script src="/resources/js/rootFont.js"></script>
    <script src="/resources/ctrl/bootstrap/js/bootstrap.js"></script>
</head>

<body>
<div id="header"></div>
<script>
    $("#header").load("header.html");
</script>
<div class="container">
    <div class="row contactInfo">
        <br/>
        <div class="col-md-7 boardLeft">
            <div class="col-md-10">
                <p class="leftTitle">Contact sales:</p>
                <p>
                    <span>(China):</span> <span>(86) 0755-2688 0962</span>

                </p>
                <p class="mb-20">
                    <span>(Hong kong):</span> <span>(852) 24230600</span>
                </p>
                <p class="mb-20">
                    <span>Fax:</span> <span>(852) 2423 0148</span>
                </p>
                <p class="mb-30">
                    <span>Contact the sales staff to buy immediately.</span>
                <p><span>Workday</span> <span
                        style="color: #E5481E;">9:00 AM—6:00 PM</span></p>
                </p>
            </div>
        </div>

    </div>
    <p class="boardTitle ">You can also leave a message for us</p>
</div>
<div class="container">
    <form class="layui-form" id="messageForm" action="">
        <div class="row messageThere">
            <div class="form-group col-md-3" style="">
                <label for="name" class="control-label">Name:</label> <input
                    type="text" class="form-control" required lay-verify="required"
                    name="name" id="name" lay-reqText="Name cannot be blank" placeholder="Please enter your name">
            </div>
            <div class="form-group col-md-3">
                <label for="phone" class="control-label">Tel:</label> <input
                    type="text" class="form-control" required lay-verify="required"
                    name="phone" id="phone" lay-reqText="Number cannot be blank" placeholder="Please enter your number">
            </div>
            <div class="form-group col-md-3">
                <label for="email" class="control-label">Email:</label> <input
                    type="email" class="form-control" required
                    lay-verify="required|email" name="mail" id="mail"
                    lay-reqText="Email cannot be blank" placeholder="Please enter your email">
            </div>
            <div class="form-group col-md-3">
                <label for="message_type" class="control-label">Type:</label> <select
                    class="form-control" name="message_type" lay-reqText="Please enter your type"
                    lay-verify="required" id="category">
                <option value="1">User</option>
                <option value="2">Business</option>
                <option value="3">Hospital</option>
            </select>
            </div>

        </div>
        <div class="form-group messageFour">
            <p>Message content:</p>
            <textarea class="form-control" rows="5" name="message"
                      lay-reqText="Please enter message content" lay-verify="required"
                      placeholder="Please enter message content"></textarea>
        </div>

        <div class="form-group pt-10">
            <img alt="" id="imgCode" src="/common/kaptcha">
            <div class="layui-input-inline" style="width:150px;">
                <input type="code" id="code" name="code" required
                       lay-verify="required" lay-reqText="PIN cannot be empty" placeholder="Please enter PIN"
                       autocomplete="off" class="layui-input">
            </div>


        </div>
        <div class="form-group text-center pt-10 pb-10">
            <p>
                <button class="layui-btn f-20  layui-btn-fluid" lay-submit="" lay-filter="formDemo">Submit now</button>
            </p>
            <br/>
        </div>
    </form>
</div>
<div id="footer"></div>
<script>
    $("#footer").load("footer.html");
</script>

<script type="text/javascript">
    //加载layui
    layui.use(['element', 'form'], function () {
        var layer = layui.layer, element = layui.element, form = layui.form, $ = layui.jquery;

        $('#imgCode').click(
                function () {
                    var timestamp = Date.parse(new Date());
                    $("#imgCode").attr(
                            'src',
                            '/common/kaptcha?version='
                            + timestamp);
                });

        form.on('submit(formDemo)', function (data) {
            layer.load();
            var code = $('#code').val();
            $.ajax({
                type: "POST",
                dataType: "json",
                //contentType: "application/json;charset=UTF-8",
                url: '/book/ajax/add/' + code,
                data: data.field,
                success: function (data) {
                    $('#messageForm')[0].reset();
                    layer.closeAll();
                    layer.msg(data.msg);

                }
            });
            return false;

        });
    });
</script>
</body>

</html>