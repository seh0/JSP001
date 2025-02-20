<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.sign {
	display: flex;
	flex-direction: row;
}

button {
	height: 5vh;
	width: 10vh;
}
</style>
</head>
<body>
	<h1>Sign In</h1>
	<div class="sign">
		<form action="sign_in.jsp">
			id : <input type="text" name="u_id" required> pwd : <input type="text" name="u_pwd" required>
			<button type="submit">sign in</button>
		</form>
		<button onclick="location.href='signup_page.jsp'">sign up</button>
		<button onclick="history.back()">back</button>
	</div>
</body>
</html>