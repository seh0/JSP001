<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	margin: 0;
	padding: 0;
}

.header {
	background-color: black;
	color: white;
	position: fixed;
	top: 0;
	width: 100%;
	height: 10vh;
	display: flex;
	align-items: center;
	padding: 0 7vw;
	box-sizing: border-box;
	z-index: 1000;
}

.header h1 {
	margin: 0;
	font-size: 1.5rem;
}

.header a {
	text-decoration: none;
	color: white;
}

.header a:hover {
	color: #3C3C8C;
}

nav {
	margin-left: 10vw;
}

nav ul {
	display: flex;
	margin: 0;
	padding: 0;
}

nav li {
	margin-right: 5vw;
	list-style: none;
}

.sign {
	margin-left: auto;
	display: flex;
	align-items: center;
}

.sign button {
	background-color: #444;
	color: white;
	border: none;
	padding: 8px 16px;
	cursor: pointer;
	font-size: 1rem;
	border-radius: 5px;
	margin-left: 10px;
}

.sign button:hover {
	background-color: red;
}
</style>
</head>
<body>
	<div class="header">
		<h1><a href="first.jsp">JSP WEB</a></h1>
		<nav>
			<ul>
				<li><a href="board_page.jsp">Board</a></li>
				<li><a href="point_page.jsp">Point</a></li>
				<li><a href="my_page.jsp">My Page</a></li>
			</ul>
		</nav>
		<div class="sign">
			<%
			if (session.getAttribute("u_name") != null) {
			%>
			<h3><%=session.getAttribute("u_name")%></h3>
			<button onclick="location.href='mod/sign_out.jsp'">sign out</button>
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