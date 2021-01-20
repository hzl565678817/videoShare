<%@ page language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
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
            document.getElementById("categoryId").value = "${conditionMap.categoryId}"
            document.getElementById("pageSelete").value = "${pageInfo.pageNum}"
        });
    </script>
    <script>
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
        function modify(videoId){
            layer.confirm('请选择启用或者停用', {
                btn: ['启用', '停用','取消'], //按钮
                cancel: function(index){
                    layer.close(index);
                },title:'审核提示',
            }, function () {
                $.ajax({
                    url: "video/modify/normal",
                    type: "get",
                    data: {
                        id: videoId
                    },
                    success: function (data) {
                        if(data.code == "200"){
                            setTimeout(function(){window.location.reload()},500)
                            layer.msg('启用成功!', {icon: 1, time: 500});
                        }
                    }
                })
            }, function (index) {
                $.ajax({
                    url: "video/modify/ban",
                    type: "get",
                    data: {
                        id: videoId
                    },
                    success: function (data) {
                        if(data.code == "200"){
                            setTimeout(function(){window.location.reload()},500)
                            layer.msg('停用成功!', {icon: 1, time: 500});
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
        <strong class="icon-reorder"> 视频列表</strong>
    </div>
    <div class="padding border-bottom">
        <form method="get" action="video/list" id="queryForm">
            <input type="hidden" name="pageNum" id="pageNum"/>
            <ul class="search" style="padding-left:10px;">
                <li>视频名：<input type="text"
                               name="title" class="input" value="${conditionMap.title}" autocomplete="off"
                               style="width:150px; line-height:17px;display:inline-block" placeholder="请输入"/>
                </li>
                <li>发布时间：<input type="text" id="date1" autocomplete="off"
                                name="startTime" class="input" value="${conditionMap.startTime}"
                                style="width:170px; line-height:17px;display:inline-block" placeholder="开始时间"/>
                    <input type="text" id="date2" autocomplete="off"
                           name="endTime" class="input" value="${conditionMap.endTime}"
                           style="width:170px; line-height:17px;display:inline-block" placeholder="结束时间"/>
                </li>

                <li><select name="categoryId" class="input" id="categoryId"
                            style="width:200px; line-height:17px;">
                    <option value="0">不限</option>
                    <c:forEach items="${categories}" var="category" varStatus="s">
                        <option value="${category.id}">${category.name}</option>
                    </c:forEach>
                </select></li>
                <li>
                    <button class="button border-main icon-search">搜索</button>
                </li>
                <li>
                    <button class="button border-main " onclick="formReset()">
                        <i class="layui-icon">&#xe669;</i> 刷新
                    </button>
                </li>
            </ul>
        </form>
    </div>
    <table class="table table-hover text-center">
        <tr>
            <th>序号</th>
            <th>视频名称</th>
            <th>视频地址</th>
            <th>类别</th>
            <th>作者</th>
            <th>发布时间</th>
            <th>播放数</th>
            <th>点赞数</th>
            <th>状态</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${pageInfo.list}" var="video" varStatus="s">
            <tr>
                <td>${s.count}</td>
                <td>${video.title}</td>
                <td>${video.url}</td>
                <td>${video.category.name}</td>
                <td>${video.user.account}</td>
                <td>${video.pubTime}</td>
                <td>${video.viewNum}</td>
                <td>${video.praiseNum}</td>
                <td>${video.status.sname}</td>
                <td>
                    <div class="button-group">
                        <a id="status" class="button border-main" ><span
                                class="icon-edit" onclick="modify(${video.id})" ></span>审核</a>
                        <a class="button border-red"
                           href="javascript:void(0)"
                           onclick="deleteVideo(this,${video.id})"><span
                            class="icon-trash-o"></span> 删除</a>
                    </div>
                </td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="11">
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
</body>


<script type="text/javascript" src="lib/laydate/laydate.js"></script>
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

    function deleteVideo(obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
            //发异步删除数据
            $.ajax({
                url: "/video/del",
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
</html>