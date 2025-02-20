<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.header {
	background-color: black;
	color: white;
	position: fixed;
	top: 0;
	width: 100%;
	height: 10vh;
	padding-left: 7vw;
	display: flex;
	align-items: center;
}

ul {
	display: flex;
}

li {
	margin-right: 5vh;
	list-style: none;
}

.sign {
	margin-left: auto;
	margin-right: 20vh;
}

a {
	text-decoration: none;
	color: white;
}
</style>
</head>
<body>
	<div class="header">
		<h1>
			<a href="#" onclick="location.href='first.jsp'">Header</a>
		</h1>
		<nav>
			<ul>
				<li>menu1</li>
				<li>menu2</li>
				<li>menu3</li>
			</ul>
		</nav>
		<div class="sign">
			<%
			if (session.getAttribute("u_name") != null) {
			%>
			<%=session.getAttribute("u_name")%>
			<button onclick="location.href='sign_out.jsp'">sign out</button>
			<%
			} else {
			%>
			<button onclick="location.href='sign_page.jsp'">sign in</button>
			<%
			}
			%>
		</div>
	</div>
</body>
</html>