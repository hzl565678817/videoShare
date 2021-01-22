
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<base href="/"/>
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


									<%--									<form action="user/update" method="post" >--%>
									<div class="UserCenter__profile__item">
										<div class="UserCenter__profile__item-wrapper">
											<div class="UserCenter__profile__item-field">UserId</div>
											<div class="UserCenter__profile__item-value">
                                                <span class="UserCenter__profile__item-value-inner">
                                                  <input type="hidden" name="id" value="${user.id}">${user.id}
                                                </span>
											</div>
										</div>
									</div>
									<div class="UserCenter__profile__item">
										<div class="UserCenter__profile__item-wrapper">
											<div class="UserCenter__profile__item-field">账户</div>
											<div><input type="hidden" name="account" value="${user.account}">${user.account}</div>
										</div>
									</div>
									<div class="UserCenter__profile__item">
										<div class="UserCenter__profile__item-wrapper">
											<div class="UserCenter__profile__item-field">email</div>
											<div><input type="hidden" name="email" value="${user.email}">${user.email}</div>
										</div>
									</div>
									<div class="UserCenter__profile__item">
										<div class="UserCenter__profile__item-wrapper">
											<div class="UserCenter__profile__item-field">密码</div>
											<div><input type="hidden" name="password" value="${user.password}">${user.password}</div>
										</div>
									</div>
									<div class="UserCenter__profile__item">
										<div class="UserCenter__profile__item-wrapper">
											<div>
												<a  href="/home/updview">  <button class="form-button btn-active">修改</button></a>
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