<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  .wrap {
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
		<h1>LINK</h1>
		<div class="link-box">
			<div class="link-item" onclick="location.href='list_page.jsp'">
				<img alt="write" src="imgs/write.png">
				<h1>LIST</h1>
			</div>
			<div class="link-item" onclick="window.open('https://github.com/seh0')">
				<img alt="github" src="imgs/github.png">
				<h1>GitHub</h1>
			</div>
			<div class="link-item" onclick="window.open('https://velog.io/@seh0/posts')">
				<img alt="Velog" src="imgs/velog.png">
				<h1>VeLog</h1>
			</div>
		</div>
		<h1>LIST</h1>
		<div class="list-container">
			<%@ include file="s_list.jsp"%>
		</div>
	</div>
	<%@ include file="layout/footer.jsp"%>
</body>
</html>