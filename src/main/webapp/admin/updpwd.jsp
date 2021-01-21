<%@ page language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <base href="/"/>
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script type="text/javascript" src="js/jquery-3.4.1.js" ></script>
</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head" id="add">
        <strong><span class="icon-pencil-square-o"></span>修改密码</strong>
    </div>
    <div class="body-content">
        <form method="post" class="form-x" action="admin/updatepwd">
            <input type="hidden" name="id" value="${admin.id}">
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
                    <input type="password" class="input w50" name="password1" value=""/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label onkeyup="fun2()">确认密码：</label>
                </div>
                <div class="field">
                    <input type="password" class="input w50" name="password2" value=""/>
                </div>
                <div class="tips">${msg}</div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
                    <button class="button bg-main icon-check-square-o" type="submit">
                        提交
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>

</html>