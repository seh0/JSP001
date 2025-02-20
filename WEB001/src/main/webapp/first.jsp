<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.page {
	min-height: 100vh;
	display: flex;
	flex-direction: column;
	margin: 15vh 10vh;
}

.banner {
	background-image: url('imgs/sky.png');
	height: 40vh;
	border-radius: 20px;
	background-repeat: no-repeat;
	background-size: cover;
}

.box {
	margin-top: 5vh;
	display: flex;
	flex-direction: row;
	height: 40vh;
}

.box div {
	background-color: #f2f2f2;
	flex: 1;
	margin: 15px;
	padding-top: 30px;
	border-radius: 20px;
	display: flex;
	flex-direction: column;
	cursor: pointer;
	align-items: center;
	transition: all.3s;
}

.box div:hover {
	transform: scale(0.9);
}

.list {
	margin-top: 5vh;
	height: 40vh;
	display: flex;
	flex-direction: column;
}

img {
	width: 150px;
	height: 150px;
}
</style>
</head>
<body>
	<%@ include file="layout/header.jsp"%>
	<div class="page">
		<div class="banner"></div>
		<h1>LINK</h1>
		<div class="box">
			<div onclick="location.href='list_page.jsp'">
				<img alt="write" src="imgs/write.png">
				<h1>LIST</h1>
			</div>
			<div onclick="window.open('https://github.com/seh0')">
				<img alt="github" src="imgs/github.png">
				<h1>GitHub</h1>
			</div>
			<div onclick="window.open('https://velog.io/@seh0/posts')">
				<img alt="Velog" src="imgs/velog.png">
				<h1>VeLog</h1>
			</div>
		</div>
		<h1>LIST</h1>
		<div class="list">
			<%@ include file="s_list.jsp"%>
		</div>
	</div>
	<%@ include file="layout/footer.jsp"%>
</body>
</html>