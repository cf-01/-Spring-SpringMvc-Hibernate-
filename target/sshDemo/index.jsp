<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>

    <link rel="stylesheet" href="https://cdn.staticfile.org/layui/2.5.6/css/layui.css">
    <script src="https://cdn.staticfile.org/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/layui/2.5.6/layui.js"></script>
    <style>
        body {
            background-color: #f2f2f2;
        }

        .login-container {
            max-width: 500px;
            margin: 100px auto;
            background-color: #fff;
            border-radius: 5px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .login-title {
            text-align: left;
            font-size: 20px;
            padding-bottom: 20px;
            border-bottom: 1px solid #e6e6e6;
        }

        .form-item {
            margin-bottom: 20px;
        }

        .form-item label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
        }

        .form-item input[type="text"],
        .form-item input[type="password"] {
            width: 100%;
            padding: 10px;
            border-radius: 3px;
            border: 1px solid #e6e6e6;
            outline: none;
        }

        .form-item .layui-btn {
            margin-right: 10px;
        }

        .header {
            text-align: center;
            padding-top: 20px;
        }

        .header h1 {
            font-size: 36px;
            font-weight: bold;
            margin: 0;
            padding: 20px;
            color: #333;
        }
    </style>
</head>
<body>

<div class="header">
    <h1>仓库管理系统</h1>
</div>

<div class="layui-container">
    <div class="layui-card" style="width: 500px; margin: 100px auto;">
        <div class="layui-card-header" style="text-align: center;font-size: 20px;">登录</div>
        <div class="layui-card-body">
            <form class="layui-form" action="login" method="post">
                <div class="layui-form-item">
                    <label class="layui-form-label">账号</label>
                    <div class="layui-input-block">
                        <input type="text" name="username" required lay-verify="required"
                               placeholder="请输入用户名"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">密码</label>
                    <div class="layui-input-block">
                        <input type="password" name="password" required lay-verify="required"
                               placeholder="请输入密码"
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
                url: 'person/toLogin', // 后端接口地址
                data: data.field, // 表单数据
                dataType: 'json',
                success: function (res) {
                    if (res.code === '200') { // 登录成功
                        if (res.role === 'admin') {
                            layer.msg('登录成功', {icon: 1, time: 500}, function () {
                                // 请求成功后，跳转到登录成功后的页面
                                window.location.href = 'toItemList';
                            });
                        }else {
                            layer.msg('登录成功', {icon: 1, time: 500}, function () {
                                // 请求成功后，跳转到登录成功后的页面
                                // 将personId存入localStorage
                                localStorage.setItem('personId', res.personId);
                                window.location.href = 'toUserItem';
                            });
                        }
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
