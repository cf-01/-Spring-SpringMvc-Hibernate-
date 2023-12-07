<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>物品列表</title>
    <link type="text/css" rel="stylesheet" href="../../css/bootstrap.css">
    <script type="text/javascript" src="../../js/jquery.min.js"></script>
    <script type="text/javascript" src="../../js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/layui/2.5.6/css/layui.css">
    <script src="https://cdn.staticfile.org/layui/2.5.6/layui.js"></script>
    <style>
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

    <div class="container" style="padding: 20px">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <div class="page-headr">
                    <h1>
                        <small>信息列表 ———————— 库存信息</small>
                    </h1>
                    <br>
                    <span style="color:#FAF520 ;font-weight: bold">${flageMsg}</span>
                </div>
            </div>
            <div class="col-md-4 column">
                <a class="btn btn-primary" id="outItemButton">出库</a>
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/item/getAllItemForUser">显示全部信息</a>
            </div>
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <form class="form-inline" action="${pageContext.request.contextPath}/item/getItemByNameOrCategoryForUser" method="get" style="float:right">
                    <span style="color:#FAF520 ;font-weight: bold">${error}</span>
                    <input type="text" name="keyword" class="form-control" placeholder="请输入要查询物品名称或种类">
                    <input type="submit" value="查询" class="btn btn-primary">
                </form>
            </div>

        </div>

        <div class="row clearfix">
            <div class="col-md-12 column">
                <table class="table table-hover table-striped">
                    <thead>
                    <tr>
                        <th>多选</th>
                        <th>物品ID</th>
                        <th>物品名称</th>
                        <th>物品图片</th>
                        <th>物品数量</th>
                        <th>物品价格</th>
                        <th>物品类别</th>
                        <th>数量</th>
                    </tr>
                    </thead>

                    <%-- 人员从数据库中查询出来--%>
                    <tbody>
                    <c:forEach items="${itemList}" var="item">
                        <tr>
                            <td><input type="checkbox" name="id" value="${item.id}"></td>
                            <td>${item.id}</td>
                            <td>${item.name}</td>
                            <td><img src="${item.image}"></td>
                            <td>${item.quantity}</td>
                            <td>${item.price}</td>
                            <td>${item.category}</td>
                            <td><input type="number" name="quantity" id="outQuantity"></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script>
        $(function () {
            $("#outItemButton").click(function () {

                var itemDTOS = [];
                // 从localStorage中获取用户信息
                var userId = JSON.parse(localStorage.getItem("personId"));
                // 选出多选框的值
                $("input[name='id']:checked").each(function () {
                    var itemDTO = {};
                    itemDTO.itemId = $(this).val();
                    itemDTO.userId = userId;
                    itemDTO.nums = $(this).parent().parent().find("input[name='quantity']").val();
                    itemDTOS.push(itemDTO);
                });
                // 判断是否有选中的物品以及数量是否为空
                if (itemDTOS.length === 0) {
                    layui.use('layer', function () {
                        var layer = layui.layer;
                        layer.msg('请选择要出库的物品');
                    });
                    return;
                }
                for (var i = 0; i < itemDTOS.length; i++) {
                    if (itemDTOS[i].quantity === "") {
                        layui.use('layer', function () {
                            var layer = layui.layer;
                            layer.msg('请填写出库数量');
                        });
                        return;
                    }
                }

                // 发送ajax请求
                $.ajax({
                    url: "/item/outItem",
                    type: "post",
                    data: JSON.stringify({"itemDTOS": itemDTOS}),
                    dataType: "json",
                    contentType: "application/json",
                    success: function (res) {
                        if (res.code === "200") {
                            var itemList = res.itemList;
                            var content = '<table class="table table-hover table-striped">\n' +
                                '  <thead>\n' +
                                '    <tr>\n' +
                                '      <th>物品名称</th>\n' +
                                '      <th>物品图片</th>\n' +
                                '      <th>物品数量</th>\n' +
                                '      <th>物品单价</th>\n' +
                                '    </tr>\n' +
                                '  </thead>\n' +
                                '\n' +
                                '  <tbody>\n';

                            for (var i = 0; i < itemList.length; i++) {
                                var item = itemList[i];
                                content += '    <tr>\n' +
                                    '      <td>' + item.itemName + '</td>\n' +
                                    '      <td><img src="' + item.image + '"></td>\n' +
                                    '      <td>' + item.nums + '</td>\n' +
                                    '      <td>' + item.price + '</td>\n' +
                                    '    </tr>\n';
                            }

                            content += '  </tbody>\n' +
                                '</table>';

                            // 计算出库总价
                            var totalPrice = 0;
                            for (var i = 0; i < itemList.length; i++) {
                                var item = itemList[i];
                                totalPrice += item.price * item.nums;
                            }
                            content += '<h3>出库总价：' + totalPrice + '</h3>';

                            layui.use('layer', function () {
                                var layer = layui.layer;
                                layer.open({
                                    title: '出库清单',
                                    content: content,
                                    area: ['600px', '500px']
                                });
                            });
                            // 点击确定后刷新页面
                            $(".layui-layer-btn0").click(function () {
                                window.location.reload();
                            });

                        } else {
                            layui.use('layer', function () {
                                var layer = layui.layer;
                                layer.msg('出库失败');
                            });
                        }
                    }
                });
            });
        });
    </script>
</body>
</html>
