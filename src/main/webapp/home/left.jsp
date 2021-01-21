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
<script>
    $(document).ready(function (){
        $(".compoent-sortTabs__tabItem a").each(function(){
            $this = $(this);
            if($this[0].href==String(window.location)){
                $(".compoent-sortTabs__tabItem").removeClass("active");
                $this.parent().parent().addClass("active");
            }
        })
    })
</script>


<body>
<div class="compoent-sortTabs__container">
    <div class="compoent-sortTabs__tabItemWrapper">
        <div id="accountSet" class="compoent-sortTabs__tabItem active">
            <i class="icon-person2"></i><span><a href="home/updview" id="id1" target="_parent">账号设置</a></span>
            <div class="ink"></div>
        </div>
    </div>
    <div class="compoent-sortTabs__tabItemWrapper">
            <div id="pubVideo" class="compoent-sortTabs__tabItem ">
            <i class="icon-vip"></i><span><a href="video/add">发布视频</a></span>
            <div class="ink"></div>
        </div>
    </div>
    <div class="compoent-sortTabs__tabItemWrapper">
        <div id="myVideo" class="compoent-sortTabs__tabItem" >
            <i class="icon-vip"></i><span><a href="view/myvideo">我的视频</a></span>
            <div class="ink"></div>
        </div>
    </div>
   <div class="compoent-sortTabs__tabItemWrapper">
        <div id="myCollection" class="compoent-sortTabs__tabItem">
            <i class="icon-vip"></i><span> <a href="view/collection">我的收藏</a></span>
            <div class="ink"></div>
        </div>
    </div>
    <div class="compoent-sortTabs__tabItemWrapper">
        <div class="compoent-sortTabs__tabItem">
            <i class="icon-vip"></i><span><a href="view/history">历史记录</a></span>
            <div class="ink"></div>
        </div>
    </div>
    <div class="compoent-sortTabs__tabItemWrapper">
        <div class="compoent-sortTabs__tabItem">
            <i class="icon-vip"></i><span><a href="/view/praise">点赞视频</a></span>
            <div class="ink"></div>
        </div>
    </div>
    <div class="compoent-sortTabs__appendNode"></div>
</div>
</body>

</html>