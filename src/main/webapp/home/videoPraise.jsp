<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <base href="${base}/"/>
    <title>我的视频</title>
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
                <h4 class="UserCenter__tab-title">个人中心</h4>
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

                    <div class="UserCenter__profile">
                        <div class="UserCenter__profile__right">
                            <div class="categoryContent__wrapper">
                                <div class="categoryContent categoryPage_home">
                                    <div class="FeedContainer channelBlocklist channelBlocklist--narrow categoryPage_home__LvideoRecomment">
                                        <div class="FeedContainer__content">
                                            <div class="FeedContainer__items">
                                                <c:forEach items="${videos}" var="video" varStatus="s">
                                                    <div class="FeedContainer__itemWrapper">
                                                        <div class="VerticalFeedCard VerticalChannelBlockList__item">
                                                            <a onclick="check(${video.status.id},${video.id})" class="VerticalFeedCard__coverWrapper" title="${video.title}"
                                                               target="_blank" data-disable_default="true">
                                                                <picture>
                                                                    <source srcSet="" type="image/webp" />
                                                                    <img class="BU-MagicImage"
                                                                         style="width: 100%; height: 100%; transition: transform 0.3s; object-fit: cover"
                                                                         src="images/${video.cover}" alt="${video.title}" /> </picture>
                                                            </a><a class="VerticalFeedCard__title" title="${video.title}" href="video/view/${video.id}"
                                                                   target="_blank" data-disable_default="true">${video.title}</a>
                                                            <div class="VerticalFeedCard__bottomInfo"><a href="/video/del/${video.id}">删除</a></div>
                                                        </div>
                                                    </div>
                                                    <c:if test="${s.count mod 5 eq 0 }">
                                                        <br />
                                                    </c:if>
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