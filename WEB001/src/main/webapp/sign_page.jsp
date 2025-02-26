<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign in</title>
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
		<h1>Sign In</h1>
		<form action="mod/sign_in.jsp" method="post">
			<input type="text" name="u_id" placeholder="Enter your ID" required>
			<input type="password" name="u_pwd" placeholder="Enter your password" required>
			<button type="submit">Sign In</button>
		</form>
		<div class="button-container">
			<button onclick="location.href='join_page.jsp'">Sign Up</button>
			<button onclick="history.back()">Back</button>
		</div>
	</div>
</body>
</html>