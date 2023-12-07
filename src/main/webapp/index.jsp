<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>

    <link rel="stylesheet" href="https://cdn.staticfile.org/layui/2.5.6/css/layui.css">
    <script src="https://cdn.staticfile.org/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/layui/2.5.6/layui.js"></script>
</head>
<body>

<div class="layui-container">
    <div class="layui-card" style="width: 500px; margin: 100px auto;">
        <div class="layui-card-header" style="text-align: left;font-size: 20px;">登录</div>
        <div class="layui-card-body">
            <form class="layui-form" action="login" method="post">
                <div class="layui-form-item">
                    <label class="layui-form-label">账号</label>
                    <div class="layui-input-block">
                        <input type="text" name="username" required lay-verify="required"
                               placeholder="Enter your username"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">密码</label>
                    <div class="layui-input-block">
                        <input type="password" name="password" required lay-verify="required"
                               placeholder="Enter your password"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="login">登录</button>
                        <button type="reset" class="layui-btn layui-btn-primary">清空</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>


<script>
    layui.use(['form', 'layer'], function () {
        var form = layui.form;
        var layer = layui.layer;

        // 监听表单提交
        form.on('submit(login)', function (data) {
            // 使用 jQuery 的 AJAX 方法连接后端进行验证
            $.ajax({
                type: 'POST',
                url: 'user/toLogin', // 后端接口地址
                data: data.field, // 表单数据
                dataType: 'json',
                success: function (res) {
                    if (res.code === '200') { // 登录成功
                        layer.msg('登录成功', {icon: 1, time: 1500}, function () {
                            // 请求成功后，跳转到登录成功后的页面
                            window.location.href = 'user/toHomePage';
                        });
                    } else { // 登录失败
                        layer.msg(res.msg, {icon: 2});
                    }
                },
                error: function (err) {
                    console.error(err);
                }
            });
            return false; // 阻止表单跳转
        });
    });
</script>

</body>
</html>
