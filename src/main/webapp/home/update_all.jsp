<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <base href="${base}/"/>
    <title>视频分享</title>
    <link rel="stylesheet" href="css/index.css"/>
    <script type="text/javascript" src="js/jquery-3.4.1.js" ></script>
    <script>
        function fun2(){
            var password = document.getElementById("password").value;
            var rePwd = document.getElementById("newPassword").value;
            var myFont2 = document.getElementById("myFont2");
            if (password != rePwd){
                myFont2.innerText='两次输入密码不一致';
            }else {
                myFont2.innerText='';
            }
        }
    </script>


</head>

<body>
<div
        class="v3-app-layout layoutstatus-header--Normal layoutstatus-side--Hidden limitWidth">
    <jsp:include page="../header.jsp"></jsp:include>
    <div class="v3-app-layout__content">
        <div class="UserCenter">
            <div class="UserCenter__tab">
                <h4 class="UserCenter__tab-title">个人中心</h4>
                <jsp:include page="left.jsp"></jsp:include>
            </div>
            <div class="UserCenter__content">
                <div class="UserCenter__setting">
                    <div class="compoent-sortTabs__container UserCenter__Setting__tab">
                        <div class="compoent-sortTabs__tabItemWrapper first">
                            <div class="compoent-sortTabs__tabItem active first">
                                <span>个人信息</span>
                                <div class="ink"></div>
                            </div>
                        </div>
                        <div class="compoent-sortTabs__appendNode"></div>
                    </div>
                    <div class="UserCenter__setting__content">
                        <div class="UserCenter__profile">
                            <div class="UserCenter__profile__content">
                                <div class="UserCenter__profile__right">

                                    <div class="UserCenter__profile__item-field">头像</div>
                                    <div class="UserCenter__profile__item-value">
                                        <div class="component-avatar UserCenter__profile__avatar"
                                             style="width: 48px; height: 48px; border: none;">
											<span class="component-avatar__inner"><picture>
												<source
                                                        srcset=""
                                                        type="image/webp">
												<img class="BU-MagicImage"
                                                     src="images/${user.photoUrl}"
                                                     alt=""
                                                     style="width: 100%; height: 100%; transition: transform 0.3s ease 0s; object-fit: cover;"></picture></span>
                                        </div>

                                    </div>


                                    <form action="home/update/${user.id}" method="post" >
                                        <div class="UserCenter__profile__item">
                                            <div class="UserCenter__profile__item-wrapper">
                                                <div class="UserCenter__profile__item-field">账户:${user.id}</div>
                                                <div class="UserCenter__profile__item-value">
                                                <span class="UserCenter__profile__item-value-inner">
                                                  <input type="text" name="account" value="${user.account}">
                                                </span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="UserCenter__profile__item">
                                            <div class="UserCenter__profile__item-wrapper">
                                                <div class="UserCenter__profile__item-field">email</div>
                                                <div><input type="text" name="email" value="${user.email}"></div>
                                            </div>
                                        </div>
                                        <div class="UserCenter__profile__item">
                                            <div class="UserCenter__profile__item-wrapper">
                                                <div class="UserCenter__profile__item-field">密码</div>
                                                <div><input type="text" id="password" name="password" value="${user.password}"></div>
                                            </div>
                                        </div>
                                        <div class="UserCenter__profile__item">
                                            <div class="UserCenter__profile__item-wrapper">
                                                <div class="UserCenter__profile__item-field">新密码</div>
                                                <div><input type="text"  id="newPassword"   name="newPassword"  onkeyup="fun2()" ></div>
                                            </div>
                                        </div>
                                        <div class="UserCenter__profile__item">
                                            <div class="UserCenter__profile__item-wrapper">
                                                <div>
                                                    <div><font color="red" id="myFont2"></font></div>
                                                    <button class="form-button btn-active">提交</button>
                                                </div>
                                            </div>
                                        </div>
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