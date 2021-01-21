<%@ page language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <base href="/"/>
    <title></title>
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <link rel="stylesheet" href="lib/layui/css/layui.css">
    <script type="text/javascript" src="lib/laydate/laydate.js"></script>
    <script type="text/javascript" src="lib/layui/layui.all.js"></script>
    <script type="text/javascript" src="js/jquery-3.4.1.js"></script>
    <script>
        window.addEventListener("load", function () {
            document.getElementById("statusId").value = "${condition.statusId}"
            document.getElementById("pageSelete").value = "${pageInfo.pageNum }"
        })
        function goPage(pageNum) {
            document.getElementById("pageNum").value = pageNum;
            document.getElementById("queryForm").submit();
        }


        function formReset() {
            $(':input,#myform')
                .not(':button, :submit, :reset, :hidden')
                .val('')
                .removeAttr('checked')
                .removeAttr('selected');
        }
    </script>
    <script>
        function modify(userId){
            layer.confirm('请选择启用或者停用', {
                btn: ['启用', '停用','取消'], //按钮
                cancel: function(index){
                    layer.close(index);
                },title:'审核提示',
            }, function () {
                $.ajax({
                    url: "user/modify/normal",
                    type: "get",
                    data: {
                        id: userId
                    },
                    success: function (data) {
                        if(data.code == "200"){
                            setTimeout(function(){window.location.reload()},500)
                            layer.msg('启用成功!', {icon: 1, time: 500});
                        }else {
                            setTimeout(function(){window.location.reload()},500)
                            layer.msg('启用失败!', {icon: 1, time: 500});
                        }
                    }
                })
            }, function (index) {
                $.ajax({
                    url: "user/modify/ban",
                    type: "get",
                    data: {
                        id: userId
                    },
                    success: function (data) {
                        if(data.code == "200"){
                            setTimeout(function(){window.location.reload()},500)
                            layer.msg('停用成功!', {icon: 1, time: 500});
                        }else {
                            setTimeout(function(){window.location.reload()},500)
                            layer.msg('停用失败!', {icon: 1, time: 500});
                        }
                    }
                })
                layer.close(index);
            });
        }


    </script>
</head>
<body>

    <div class="panel admin-panel">
        <div class="panel-head">
            <strong class="icon-reorder">用户列表</strong>
        </div>
        <div class="padding border-bottom">
            <form method="get" action="user/list" id="queryForm">
                <input type="hidden" name="pageNum" id="pageNum">
                <ul class="search" style="padding-left:10px;">
                    <li>账号：<input type="text" placeholder="请输入"  autocomplete="off"
                                  name="account" class="input" value="${condition.account}"
                                  style="width:150px; line-height:17px;display:inline-block"/>
                    </li>
                    <li>注册时间：<input type="text" id="date1" autocomplete="off"
                                    name="startTime" class="input" value=""
                                    style="width:150px; line-height:17px;display:inline-block"/>-
                        <input type="text"  id="date2" autocomplete="off"
                               name="endTime" class="input" value=""
                               style="width:150px; line-height:17px;display:inline-block"/>
                    </li>

                    <li><select name="statusId" class="input" id="statusId"
                                style="width:200px; line-height:17px;">
                        <option value="0">不限</option>
                        <c:forEach items="${status}" var="status">
                            <option style="color: black" value="${status.id}">${status.sname}</option>
                        </c:forEach>

                    </select></li>
                    <li>
                        <button class="button border-main icon-search">搜索</button>
                    </li>

                    <li>
                        <button class="button border-main " onclick="formReset()">
                            <i class="layui-icon">&#xe669;</i> 重置
                        </button>
                    </li>
                </ul>
            </form>
        </div>
        <table class="table table-hover text-center">
            <tr>
                <th>序号</th>
                <th>账号</th>
                <th>邮箱</th>
                <th>注册时间</th>
                <th>视频数</th>
                <th>状态</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${pageInfo.list}" var="user" varStatus="s">
                <tr>
                    <td>${s.count}</td>
                    <td>${user.account}</td>
                    <td>${user.email}</td>
                    <td>${user.regTime}</td>
                    <td>${user.videoNum}</td>
                    <td>${user.status.sname}</td>
                    <td>

                            <div class="button-group">

                                <a onclick="modify(${user.id})" class="button border-main" ><span
                                        class="icon-edit"></span> 审核</a>

                                    <a class="button border-red"
                                     onclick="deleteUser(this,${user.id})" >
                                        <span class="icon-trash-o"></span> 删除
                                    </a>

                            </div>

                    </td>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="8">
                    <div class="pagelist">
                        <c:forEach begin="1" end="${pageInfo.pages}" var="p">
                            <a href="javascript:void(0)" onclick="goPage(${p})">${p}</a>
                        </c:forEach>
                        <select onchange="goPage(this.value)" id="pageSelete">
                            <c:forEach begin="1" end="${pageInfo.pages}" var="p">
                                <option>${p}</option>
                            </c:forEach>
                        </select>
                    </div>
                </td>
            </tr>
        </table>
    </div>

<script>
    //时间选择器
    laydate.render({
        elem: '#date1'
        , type: 'datetime'
    });
    laydate.render({
        elem: '#date2'
        , type: 'datetime'
    });

    function deleteUser(obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
            //发异步删除数据
            $.ajax({
                url: "/user/del",
                type: "get",
                data: {
                    id: id
                },
                success: function (data) {
                    $(obj).parents("tr").remove();
                    layer.msg('已删除!', {icon: 1, time: 700});
                }
            })
        });
    }

</script>


</body>
</html>