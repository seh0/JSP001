<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
<style>
body {
	background-color: #e0d0f1;
}

.page {
	min-height: 70vh;
	display: flex;
	flex-direction: row;
	margin: 15vh 10vh;
	padding: 30px;
	display: flex;
}

.info {
	border-radius: 5%;
	width: 100%;
	padding: 30px;
	background-color: white;
	box-shadow: 10px 10px 10px 10px #3C3C8C;
}

.updt {
	border-radius: 5%;
	margin-left: 20px;
	width: 20vw;
	padding: 30px;
	background-color: white;
	box-shadow: 10px 10px 10px 10px #3C3C8C;
	display: none;
}

.info button {
	height: 30px;
}

.info form {
	display: flex;
	flex-direction: column;
}

img {
	width: 150px;
	height: 150px;
	margin-bottom: 15px;
}
</style>
</head>
<body>
	<%@ include file="/layout/header.jsp"%>
	<div class="page">
		<div class="info">
			<img alt="user" src="imgs/user.png">
			<%@ include file="/layout/user_info.jsp"%>
		</div>
		<div class="updt" id="update">
			<form method="post">
				<input type="hidden" name="action" value="update">
				<h2>이름</h2>
				<input type="text" name="name" id="update_name" required>
				<h2>나이</h2>
				<input type="number" name="age" id="update_age" required>
				<h2>성별</h2>
				<div>
					<label for="gen_m">남</label>
					<input type="radio" id="gen_m" name="gender" value="man" required>
					<label for="gen_w">여</label>
					<input type="radio" id="gen_w" name="gender" value="woman" required>
					<label for="gen_prv">비공개</label>
					<input type="radio" id="gen_prv" name="gender" value="prv" required checked>
				</div>
				<hr>
				<input type="submit" value="확인">
			</form>
			<button onclick="hideUpdate()">취소</button>
		</div>
		<script>
			function showUpdate(name, age) {
				document.getElementById('update').style.display = 'block';
				document.getElementById('update_name').value = name;
				document.getElementById('update_age').value = age;
			}
			function hideUpdate() {
				document.getElementById('update').style.display = 'none';
			}
		</script>
	</div>
	<%@ include file="/layout/footer.jsp"%>
</body>
</html>