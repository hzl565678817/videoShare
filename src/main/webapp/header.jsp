<%@ page import="com.cdu.videoshare.model.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title></title>
    <script type="text/javascript" src="lib/layui/layui.all.js"></script>
    <!--图标库-->
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.1/css/all.min.css">
    <!--主要样式-->
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <script src="js/jquery-3.4.1.js" ></script>
    <script>
        $(document).ready(function(){
            //点击链接的时候调用
            $("#search").click(function(){
                //得到input的值
                var title = $("#title").val();
                if (title == null || title == ""){
                    window.location.href="/index";
                }else {
                    //设置search的href的值
                    $("#search").attr("href","index/search/"+title);
                }

            });
        });
    </script>

    <script>
        $(document).ready(function(){
            var user = "${sessionScope.user}"
            //点击链接的时候调用
            $("#publicVideo").click(function () {
                if (user == null || user == "") {
                    layer.confirm('您需要登录后才能发布视频，是否前往登录？', {
                        btn: ['登录', '取消'], //按钮
                        cancel: function(index){
                            layer.close(index);
                        },title:'发布提示',
                    }, function () {
                        window.location.href = "/user/login";
                    }, function (index) {
                        layer.close(index);
                    });
                }else {
                    window.location.href = "/video/add";
                }
            });
        });
    </script>



<script>
    function over(){
        var aul = document.getElementById("dl");
        aul.style.visibility='visible';
    }
</script>

    <script>
    function out(){
        var aul = document.getElementById("dl");
        aul.style.visibility='hidden';
    }
</script>

</head>
<body>
<div class="v3-app-layout__header">
    <div class="siteHeader">
        <div class="siteHeader__inner">
            <div class="v3-app-layout__logo-wrap">
                <a class="logo" href="/" title="首页"></a>
            </div>
            <div class="search-wrap">
                <input type="text" class="input" id="title" placeholder="请输入视频标题"/>
                <div class="SearchPreset show" style="height: 33px; margin: 4px 0">
                    <ul></ul>
                </div>
                <a id="search" class="search-btn"><i class="icon-search btn__search"></i><span>搜索</span></a>
                <div class="SearchList">
                    <div class="SearchList__history" style="display: none">
                        <h5 class="SearchList__history__title">搜索历史</h5>
                        <a class="SearchList__history__clear">清空历史</a>
                    </div>
                </div>
            </div>
            <div class="right-wrap">
                <ul class="nav-list">
                    <li class="">
                        <a id="publicVideo"  target="_blank" rel="nofollow">
                        <div>
                            <i class="icon-publish-video"></i>
                        </div>
                        发布视频</a>
                    </li>
                </ul>
                <div class="BU-Component-Header-Avatar">
                    <div class="BU-Component-Header-Avatar__container">
                        <c:if test="${not empty sessionScope.user}">
                        <ul>
                            <li>
                                <a   href="" target="_blank" data-disable_default="true">
                                    <div onmousemove="over()" onmouseout="out()" class="BU-Component-Header-Avatar__image"
                                        style="display: inline-block; width: 44px; height: 44px; border-radius: 22px; background-size: 100%; background-image: url(${pageContext.request.contextPath }/photo/${sessionScope.user.photoUrl}); cursor: pointer">
                                        <ul id="dl" style="visibility: hidden" class="mainMenu">
                                            <li class="item" id="account">
                                                <a href="/home/index" class="btn"><i class="fas fa-user-circle"></i>我的帐户</a>
                                            </li>
                                            <li class="item">
                                                <a href="/admin/logout" class="btn"><i class="fas fa-sign-out-alt"></i>退出登录</a>
                                            </li>
                                        </ul>
                                    </div>
                                </a>
                            </li>
                        </ul>
                        </c:if>
                        <c:if test="${empty sessionScope.user}">
                            <a href="user/login" target="_blank" data-disable_default="true"><div class="loginButton">
                                <div class="avatar-logo"></div>
                                <span>登录</span>
                            </div></a>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>