<%@ page language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <base href="/"/>
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script type="text/javascript" src="lib/layui/layui.all.js"></script>
    <script src="js/jquery-3.4.1.js" ></script>
</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head" id="add">
        <strong><span class="icon-pencil-square-o"></span>修改密码</strong>
    </div>
    <div class="body-content">
        <form class="form-x">
            <input type="hidden" name="id" id="adminId" value="${admin.id}">
            <div class="form-group">
                <div class="label">
                    <label>原密码：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="password" value="${admin.password}"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>新密码：</label>
                </div>
                <div class="field">
                    <input type="password" class="input w50" id="password1" name="password1" value=""/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label >确认密码：</label>
                </div>
                <div class="field">
                    <input type="password" class="input w50" id="password2" name="password2" value=""/>
                    <div class="tips">${msg}</div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
                    <button class="button bg-main icon-check-square-o" onclick="modifyPwd()" type="button">
                        提交
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>

<script>
    function modifyPwd(){
        var adminId = document.getElementById("adminId").value;
        var password1 = document.getElementById("password1").value;
        var password2 = document.getElementById("password2").value;
        $.ajax({
            url: "/admin/updatepwd",
            type: "post",
            data: {
                id:adminId,
                password1: password1,
                password2:password2
            },
            success: function (data) {
                if (data.code == 200){
                    layer.confirm('修改成功，请重新登录！', {
                        btn: ['登录', '关闭'], //按钮
                        cancel: function(index){
                            layer.close(index);
                        },title:'修改提示',
                    }, function () {
                        window.open("/admin/login");
                    }, function (index) {
                        layer.close(index);
                    });
                }else if (data.code == 201){
                    layer.msg('修改失败!', {icon: 2, time: 1000});
                }
            }
        })
    }
</script>

</html>