<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <base href="${base}/"/>
    <title>视频分享</title>
    <link rel="stylesheet" href="css/index.css"/>
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
                                <span>视频分享</span>
                                <div class="ink"></div>
                            </div>
                        </div>
                        <div class="compoent-sortTabs__appendNode"></div>
                    </div>
                    <div class="UserCenter__setting__content">
                        <div class="UserCenter__profile">
                            <div class="UserCenter__profile__content">
                                <div class="UserCenter__profile__right">
                                    <form action="video/add" method="post" enctype="multipart/form-data">
                                        <div class="UserCenter__profile__item">
                                            <div class="UserCenter__profile__item-wrapper">
                                                <div class="UserCenter__profile__item-field">类别</div>
                                                <div class="UserCenter__profile__item-value">
                                                <span class="UserCenter__profile__item-value-inner">
                                                    <select name="category.id" id="category.id">
                                                        <c:forEach items="${categories}" var="category" varStatus="i">
                                                        <option value="${category.id}">${category.name}</option>
                                                        </c:forEach>
                                                    </select>
                                                </span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="UserCenter__profile__item">
                                            <div class="UserCenter__profile__item-wrapper">
                                                <div class="UserCenter__profile__item-field">标题</div>
                                                <div><input type="text" name="title"></div>
                                            </div>
                                        </div>
                                        <div class="UserCenter__profile__item">
                                            <div class="UserCenter__profile__item-wrapper">
                                                <div class="UserCenter__profile__item-field">封面</div>
                                                <div><input type="file" name="multipartFiles"></div>
                                            </div>
                                        </div>
                                        <div class="UserCenter__profile__item">
                                            <div class="UserCenter__profile__item-wrapper">
                                                <div class="UserCenter__profile__item-field">视频</div>
                                                <div><input type="file" name="multipartFiles"></div>
                                            </div>
                                        </div>
                                        <div class="UserCenter__profile__item">
                                            <div class="UserCenter__profile__item-wrapper">
                                                <div>
                                                    <button class="form-button btn-active">上传</button>
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