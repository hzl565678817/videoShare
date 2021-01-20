<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <base href="/"/>
    <link rel="stylesheet" href="css/index.css"/>
    <script src="js/jquery-3.4.1.js" ></script>
</head>

<body>
<div class="compoent-sortTabs__container">
    <div class="compoent-sortTabs__tabItemWrapper">
        <div id="accountSet" class="compoent-sortTabs__tabItem ">
            <i class="icon-person2"></i><span><a href="home/personal" target="_parent">账号设置</a></span>
            <div class="ink"></div>
        </div>
    </div>
    <div class="compoent-sortTabs__tabItemWrapper">
        <div id="pubVideo" class="compoent-sortTabs__tabItem ">
            <i class="icon-vip"></i><span><a href="video/add" target="_parent">发布视频</a></span>
            <div class="ink"></div>
        </div>
    </div>
    <div class="compoent-sortTabs__tabItemWrapper">
        <div id="myVideo" class="compoent-sortTabs__tabItem" >
            <i class="icon-vip"></i><span>我的视频</span>
            <div class="ink"></div>
        </div>
    </div>
    <div class="compoent-sortTabs__tabItemWrapper">
        <div id="myCollection" class="compoent-sortTabs__tabItem">
            <i class="icon-vip"></i><span>我的收藏</span>
            <div class="ink"></div>
        </div>
    </div>
    <div class="compoent-sortTabs__appendNode"></div>
</div>
</body>

</html>