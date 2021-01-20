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
	<script type="text/javascript">
		function fun1() {
			//1、创建一个异步请求对象
			var xmlHttp = new XMLHttpRequest();
			//2、为异步请求对象身上绑定【工作状态监听器】
			xmlHttp.onreadystatechange = function () {
				if (xmlHttp.readyState == 4 && xmlHttp.status == 200){
					var data = xmlHttp.responseText;
					callBack(data);
				}
			};
			//3、初始化异步请求对象
			var param = document.getElementById("account").value;
			if (param != ""){
				xmlHttp.open("get","/user/check?account=" + param,true);
				//4、通知异步请求对象代替浏览器发送请求协议包
				xmlHttp.send();
			}
		}

		//局部刷新函数
		function callBack(param) {
			if(param == 0){
				document.getElementById("myFont").innerText="";
			} else {
				document.getElementById("myFont").style.color='red';
				document.getElementById("myFont").innerText='用户名已被占用';
			}
		}
	</script>

	<script>
		function fun2(){
			var password = document.getElementById("password").value;
			var rePwd = document.getElementById("rePwd").value;
			var myFont2 = document.getElementById("myFont2");
			if (password != rePwd){
				myFont2.innerText='两次输入密码不一致';
			}else {
				myFont2.innerText='';
			}
		}
	</script>

	<script>
		function fun3(){
			var email = document.getElementById("email").value;
			var myFont2 = document.getElementById("myFont2");
			var myReg=/^[a-zA-Z0-9_-]+@([a-zA-Z0-9]+\.)+(com|cn|net|org)$/;
			if (!myReg.test(email)){
				myFont2.innerText='邮箱格式不对';
			}else {
				myFont2.innerText='';
			}
		}
	</script>

	<script>
		function reg() {
				var account = document.getElementById("account").value;
				var password = document.getElementById("password").value;
				var email = document.getElementById("email").value;
				if (account != null && password != null && email != null)
				$.ajax({
					url: "/user/reg",
					type: "post",
					data: {
						account: account,
						password:password,
						email:email
					},
					success: function (data) {
						if (data.code === 200){
							$("input[type=reset]").trigger("click");
							layer.msg('注册成功!', {icon: 1, time: 1000});
						}else {
							$("input[type=reset]").trigger("click");
							layer.msg('注册失败!', {icon: 2, time: 1000});
						}
					}
				})
		}
	</script>


</head>
<body>
	<div
		class="v3-app-layout layoutstatus-header--Normal layoutstatus-side--Hidden limitWidth">
		<jsp:include page="header.jsp"></jsp:include>
		<div class="Dialog-container login-dialog-container"
			style="display: block;">
			<div class="Dialog__wrap">
				<div class="LoginDialog__container">
					<div class="LoginDialog__header">
						<div class="title">注册</div>
					</div>
					<div id="BD_Login_Form" class="LoginDialog__content">
						<div class="ssosdk-container sso-xigua code_login"
							id="sso_container" style="float: left" data-pagetype="code_login">
							<div class="page-main">
								<div class="content-main content-main-modal">
									<form action="" method="post" class="form-main">
										<div class="form-input ">
											<div class="input-container">
												<input name="account" id="account" type="tel" class="form-input-main"
													placeholder="请输入账号" autocomplete="on" value="" onkeyup="fun1()">
											</div>
										</div>
										<div class="form-input form-input-last">
											<input name="password" id="password" type="password" class="form-input-main"
												placeholder="请输入密码" autocomplete="off" value="">
										</div>
										<div class="form-input form-input-last">
											<input name="rePwd" id="rePwd" type="password" class="form-input-main"
												placeholder="请输入确认密码" autocomplete="off" value="" onkeyup="fun2()">
										</div>
										<div class="form-input form-input-last">
											<input name="email" id="email" type="text" class="form-input-main"
												placeholder="请输入邮箱" autocomplete="off" value="" onkeyup="fun3()">
										</div>
										<div class="error-tips show-tips">
											${msg}
											<div><font color="red" id="myFont2"></font></div>
										</div>
										<button type="button" id="sso_submit" onclick="reg()" class="form-button btn-active"
											style="background-color: rgb(248, 89, 89); cursor: pointer;">注册</button>
										<input type="reset" name="reset" style="display: none;" />
										<a href="user/login" target="_self" style="float:right;color: red;text-decoration:none;">已有帐号，直接登录></a>
									</form>
								</div>
							</div>
							<div style="float: right;margin-right: 140px;margin-top: 70px">
								<font id="myFont" style="font-size: 10px"></font>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>