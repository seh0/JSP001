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
		<form action="sign_up.jsp">
			<label for="ac_id">ID</label> <input type="text" id="ac_id" name="ac_id" required> <label for="ac_pwd">PASSWORD</label> <input type="text" id="ac_pwd" name="ac_pwd" required> <label for="ac_name">NAME</label> <input type="text" id="ac_name" name="ac_name" required>
			<button type="submit">sign up</button>
		</form>
		<div class="button-container">
			<button onclick="history.back()">Back</button>
		</div>
	</div>
</body>
</html>