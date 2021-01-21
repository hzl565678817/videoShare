<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户登录-蜗牛短视频分享平台</title>
<base href="/" />
<link rel="stylesheet" href="css/index.css" />
<link rel="stylesheet" href="css/login.css" />
    <link rel="stylesheet" href="lib/layui/css/layui.css">
    <script type="text/javascript" src="lib/laydate/laydate.js"></script>
    <script type="text/javascript" src="lib/layui/layui.all.js"></script>
    <script type="text/javascript" src="js/jquery-3.4.1.js"></script>
</head>
<body>
	<div
		class="v3-app-layout layoutstatus-header--Normal layoutstatus-side--Hidden limitWidth header-theme--Dark">
		<jsp:include page="header.jsp"></jsp:include>
		<div class="Dialog-container login-dialog-container" style="display: block;">
        <div class="Dialog__wrap">
            <div class="LoginDialog__container">
                <div class="LoginDialog__header">
                    <div class="title" >登录</div>
                    <div class="title"  style="margin-left: 590px"><a href="index"><img src="images/cancel.png"></a></div>
                </div>
                <div id="BD_Login_Form" class="LoginDialog__content">
                    <div class="ssosdk-container sso-xigua code_login" id="sso_container" data-pagetype="code_login">
                        <div class="page-main">
                            <div class="content-main content-main-modal">
                                <form  action="user/login" method="post" class="form-main">
                                    <div class="form-input ">
                                        <div class="input-container"><input id="account"  autocomplete="off" name="account" type="tel"
                                                class="form-input-main" placeholder="请输入账号" autocomplete="on" value="">
                                        </div>
                                    </div>
                                    <div class="form-input form-input-last"><input id="password" name="password" type="password"
                                            class="form-input-main" placeholder="请输入密码" autocomplete="off"
                                            value=""></div>
                                    <div id="show" class="error-tips show-tips">
                                        ${msg}
                                    </div>
                                    <button onclick="login()" id="sso_submit"
                                        class="form-button btn-active"
                                        style="background-color: rgb(248, 89, 89); cursor: pointer;">登录</button>
                                    <a href="user/reg" target="_self" style="float:right;color: red;text-decoration:none;">没有帐号，前去注册></a>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	</div>

</body>
</html>