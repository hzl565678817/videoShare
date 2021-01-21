<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>蜗牛短视频分享平台</title>
<base href="/" />
<link rel="stylesheet" href="css/index.css" />
	<script type="text/javascript" src="lib/layui/layui.all.js"></script>
	<script src="js/jquery-3.4.1.js" ></script>
	<script>
		function Favor(obj, id) {
			var user = "${sessionScope.user}"
			const param = document.getElementById("favor").innerText;
			if (user == null || user == ""){
				layer.msg("很抱歉，您还没有登录呢！",{icon: 3, time: 1000});
			}else {
				if (param=='收藏'){
					$.ajax({
						url: "/favor/add",
						type: "get",
						data: {
							id: id
						},
						success: function (data) {
							if(data.code == "200"){
								document.getElementById("favor").innerText="取消收藏";
								layer.msg('收藏成功!', {icon: 1, time: 1000});
							}

						}
					})
				}else {
					$.ajax({
						url: "/favor/delete",
						type: "get",
						data: {
							id: id
						},
						success: function (data) {
							if(data.code == "200"){
								document.getElementById("favor").innerText="收藏";
								layer.msg('取消成功', {icon: 1, time: 1000});
							}

						}
					})
				}
			}
		}
	</script>
	<script>
		function Praise(obj, id) {
			var user = "${sessionScope.user}"
			var param = document.getElementById("praise").innerText;
			if (user == null || user == ""){
				layer.msg("很抱歉，您还没有登录呢！",{icon: 3, time: 1000});
			}else {
				if (param=='点赞'){
					$.ajax({
						url: "/praise/add",
						type: "get",
						data: {
							id: id
						},
						success: function (data) {
							if(data.code == "200"){
								document.getElementById("praise").innerText="取消点赞";
								layer.msg('点赞成功!', {icon: 1, time: 1000});
							}

						}
					})
				}else {
					$.ajax({
						url: "/praise/delete",
						type: "get",
						data: {
							id: id
						},
						success: function (data) {
							if(data.code == "200"){
								document.getElementById("praise").innerText="点赞";
								layer.msg('取消成功', {icon: 1, time: 1000});
							}

						}
					})
				}
			}
		}
	</script>
</head>
<body>
	<div
		class="v3-app-layout layoutstatus-header--Normal layoutstatus-side--Hidden limitWidth header-theme--Dark">
		<jsp:include page="header.jsp"></jsp:include>
		<div class="v3-app-layout__content">
			<div class="teleplayPage__wrapper">
				<div class="teleplayPage teleplayPage--theater">
					<div class="teleplayPage__main">
						<div class="teleplayPage__playerSection">
							<div class="teleplayPage__playerSection__left">
								<div class="teleplay__playerContainer__wrapper">
									<div class="xgplayerContainer teleplay__playerContainer">
											<video src="video/${video.url}" controls="controls" class="setVideo" autoplay="autoplay" width="54%" height="50%"></video></div>
								</div>
								<div class="teleplayPage__interactionZone">
									<div class="teleplayPage__interactionZone__LeftActions">
										<div class="action-collect">
											<i class="action-collect__lottie"></i>
											<c:if test="${not empty favor}">
											<span id="favor" class="action-collect__txt" onclick="Favor(this,${video.id})">取消收藏</span>
											</c:if>
											<c:if test="${empty favor}">
											<span id="favor" class="action-collect__txt" onclick="Favor(this,${video.id})">收藏</span>
											</c:if>
										</div>
										<div class="action-collect">
											<i class="action-collect__lottie"></i>
											<c:if test="${not empty praise}">
												<span id="praise" class="action-collect__txt" onclick="Praise(this,${video.id})">取消点赞</span>
											</c:if>
											<c:if test="${empty praise}">
												<span id="praise" class="action-collect__txt" onclick="Praise(this,${video.id})">点赞</span>
											</c:if>
										</div>
										<span
											class="video_action_item action video_action_item--tirggerAnywhere"><i
											class="icon-share2"></i><span>分享</span></span>
									</div>
								</div>
							</div>
							<div class="teleplayPage__playerSection__right fold"></div>
						</div>
					</div>
				</div>
				<div class="xiguaBuddyPub xiguaBuddyPub__Lvideo"
					data-album-id="6862666133141455367"
					data-episode-id="6862904232702378503"></div>
			</div>
		</div>
	</div>
</body>
</html>