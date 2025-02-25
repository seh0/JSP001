<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP WEB</title>
<style>
.wrap {
	min-height: 100vh;
	display: flex;
	flex-direction: column;
	margin: 15vh 10vh;
}

.banner {
	height: 40vh;
	border-radius: 20px;
	background-size: cover;
	background-position: center;
	transition: background-image 1s ease-in-out;
}

.link-box {
	margin-top: 5vh;
	display: flex;
	flex-direction: row;
	height: 40vh;
}

.link-item {
	background-color: #f2f2f2;
	flex: 1;
	margin: 15px;
	padding-top: 30px;
	border-radius: 20px;
	display: flex;
	flex-direction: column;
	cursor: pointer;
	align-items: center;
	box-shadow: 3px 3px 3px 3px gray;
}

.link-item:hover {
	background: #dcdcdc;
}

.list-container {
	margin-top: 5vh;
	height: 40vh;
	display: flex;
	flex-direction: column;
}

.link-item img {
	width: 150px;
	height: 150px;
	margin-bottom: 15px;
}

h1 {
	text-align: center;
	font-size: 2rem;
	margin-bottom: 20px;
}
</style>
</head>
<body>
	<%@ include file="layout/header.jsp"%>
	<div class="wrap">
		<div class="banner"></div>
		<div class="link-box">
			<div class="link-item" onclick="window.open('https://github.com/')">
				<img alt="github" src="imgs/github.png">
				<h1>GitHub</h1>
			</div>
			<div class="link-item" onclick="window.open('https://www.google.com/')">
				<img alt="google" src="imgs/google.png">
				<h1>Google</h1>
			</div>
			<div class="link-item" onclick="window.open('https://www.youtube.com/')">
				<img alt="youtube" src="imgs/youtube.png">
				<h1>YouTube</h1>
			</div>
		</div>
		<div class="list-container">
			<%@ include file="s_list.jsp"%>
		</div>
	</div>
	<%@ include file="layout/footer.jsp"%>
	<script>
		var images = [ 'url("imgs/img1.jpg")', 'url("imgs/img2.jpg")',
				'url("imgs/img3.jpg")' ];

		var currentIndex = 0;

		function changeImage() {
			var banner = document.querySelector('.banner');
			banner.style.backgroundImage = images[currentIndex];
			currentIndex = (currentIndex + 1) % images.length;
		}

		setInterval(changeImage, 10000);
		changeImage();
	</script>
</body>
</html>