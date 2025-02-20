<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sign up</h1>
	<form action="sign_up.jsp">
		id : <input type="text" name="ac_id" required> pwd : <input type="text" name="ac_pwd" required> name : <input type="text" name="ac_name" required>
		<button type="submit">sign up</button>
	</form>
	<button onclick="history.back()">back</button>
</body>
</html>