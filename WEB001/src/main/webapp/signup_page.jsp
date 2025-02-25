<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign up</title>
<style>
body {
	background-color: #3C3C8C;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.container {
	background: white;
	padding: 7%;
	border-radius: 10px;
	width: 100%;
	max-width: 400px;
	text-align: center;
}

form {
	display: flex;
	flex-direction: column;
	gap: 20px;
}

input {
	padding: 15px;
	font-size: 20px;
	border: 1px solid gray;
	border-radius: 4px;
	width: 92%;
	outline: none;
}

label {
	text-align: left;
}

.r_btn {
    display: flex;
    align-items: center;
}

.r_btn label {
    white-space: nowrap;
}

button {
	padding: 10px;
	font-size: 20px;
	background-color: #5a9;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	width: 100%;
}

.button-container {
	margin-top: 20px;
	display: flex;
	justify-content: flex-end;
	gap: 20px;
}

.button-container button {
	width: auto;
	background-color: gray;
}
</style>
</head>
<body>
	<div class="container">
		<h1>Sign up</h1>
		<form action="sign_up.jsp" method="post">
			<label for="ac_id">ID</label>
			<input type="text" id="ac_id" name="ac_id" required>
			<label for="ac_pwd">PASSWORD</label>
			<input type="text" id="ac_pwd" name="ac_pwd" required>
			<label for="ac_name">NAME</label>
			<input type="text" id="ac_name" name="ac_name" required>
			<label for="ac_age">AGE</label>
			<input type="number" id="ac_age" name="ac_age" required min="0" max="100">
			<label for="ac_gender">GENDER</label>
			<div class="r_btn">
				<label for="gen_m">남</label>
				<input type="radio" id="gen_m" name="ac_gender" value="man" required>
				<label for="gen_w">여</label>
				<input type="radio" id="gen_w" name="ac_gender" value="woman" required>
				<label for="gen_prv">비공개</label>
				<input type="radio" id="gen_prv" name="ac_gender" value="prv" required checked>
			</div>
			<button type="submit">sign up</button>
		</form>
		<div class="button-container">
			<button onclick="history.back()">Back</button>
		</div>
	</div>
</body>
</html>