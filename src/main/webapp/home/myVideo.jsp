<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <base href="${base}/"/>
    <title>个人中心首页</title>
    <link rel="stylesheet" href="css/index.css"/>
    <script type="text/javascript" src="lib/layui/layui.all.js"></script>
    <script src="js/jquery-3.4.1.js" ></script>
</head>

<script>
    function check(status,id){
        if (status == "2"){
            layer.msg("该视频已被禁止播放" ,{icon: 2, time: 700});
        }else {
            window.open("video/view/"+id);
        }
    }
</script>
<body>
<div
        class="v3-app-layout layoutstatus-header--Normal layoutstatus-side--Hidden limitWidth">
    <jsp:include page="../header.jsp"></jsp:include>
    <div class="v3-app-layout__content">
        <div class="UserCenter">
            <div class="UserCenter__tab">
                <h4 class="UserCenter__tab-title"> 我的视频</h4>
                <jsp:include page="left.jsp"></jsp:include>
            </div>
            <div class="UserCenter__content">
                <div class="UserCenter__setting">
                    <div class="compoent-sortTabs__container UserCenter__Setting__tab">
                        <div class="compoent-sortTabs__tabItemWrapper first">
                            <div class="compoent-sortTabs__tabItem active first">
                                <span>我的视频</span>
                                <div class="ink"></div>
                            </div>
                        </div>
                        <div class="compoent-sortTabs__appendNode"></div>
                    </div>
                    <div class="UserCenter__setting__content">
                        <div class="UserCenter__profile">
                            <div class="UserCenter__profile__content">
                                <div class="FeedContainer__itemWrapper">
                                    <c:forEach items="${videos}" var="video"  varStatus="s">
                                        <div class="VerticalFeedCard VerticalChannelBlockList__item">
                                            <a onclick="check(${video.status.id},${video.id})" class="VerticalFeedCard__coverWrapper" title=""
                                               target="_blank"
                                               data-disable_default="true">
                                                <picture>
                                                    <source srcSet="" type="image/webp"/>
                                                    <img class="BU-MagicImage"
                                                         style="width: 100%; height: 100%; transition: transform 0.3s; object-fit: cover"
                                                         src="images/${video.cover}" alt=""/></picture>
                                            </a><a class="VerticalFeedCard__title" title=""
                                                   href="video/view/${video.id}"
                                                   target="_blank" data-disable_default="true">${video.title}</a>
                                        </div>
                                    </c:forEach>
                                </div>
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