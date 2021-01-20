<%@ page language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <base href="/"/>
    <title></title>
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="lib/layui/layui.all.js"></script>
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
</head>
<body>
<form method="post" action="">
    <div class="panel admin-panel">
        <div class="panel-head">
            <strong class="icon-reorder"> 视频类别列表</strong>
        </div>
        <div class="padding border-bottom">
            <button type="button" class="button border-yellow"
                    onclick="javascript:location='/category/add'">
                <span class="icon-plus-square-o"></span>增加视频类别
            </button>
        </div>
        <table class="table table-hover text-center">
            <tr>
                <th>序号</th>
                <th>类别名称</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${categories}" var="category" varStatus="s">
                <tr>
                    <td>${s.count}</td>
                    <td>${category.name}</td>
                    <td>
                        <div class="button-group">
                            <a class="button border-main"
                               href="category/update/${category.id}"><span
                                    class="icon-edit"></span> 修改</a>
                            <a class="button border-red"
                               href="javascript:;"
                               onclick="del_message(this,${category.id})"><span
                                    class="icon-trash-o"></span> 删除</a>
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</form>
<script>
    function del_message(obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
            //发异步删除数据
            $.ajax({
                url: "/category/del",
                type: "get",
                data: {
                    id: id
                },
                success: function (data) {
                    $(obj).parents("tr").remove();
                    layer.msg('已删除!', {icon: 1, time: 1000});
                }

            })

        });
    }
</script>
</body>
</html>