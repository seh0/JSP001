<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Point</title>
<style>
.page {
	min-height: 70vh;
	display: flex;
	flex-direction: row-reverse;
	margin: 15vh 10vh;
	padding: 30px;
}

.reward {
	padding: 50px;
	display: flex;
	flex-direction: column;
	width: 40vw;
	min-height: 50vh;
	gap: 10vh;
}

.reward div {
	display: flex;
	flex-direction: column;
	border-radius: 20px;
	padding: 20px;
	background-color: #f2f2f2;
	flex-grow: 1;
	border-radius: 20px;
	align-items: center;
	box-shadow: 5px 5px 5px 5px gray;
}

.list {
	margin: 10px;
	padding: 20px;
	display: flex;
	flex-direction: column;
	background-color: #f2f2f2;
	width: 40vw;
	min-height: 50vh;
	box-shadow: inset 5px 5px 5px 5px gray;
}

table {
	border-collapse: collapse;
}

th {
	padding: 15px;
	text-align: center;
	font-size: 18px;
	border-bottom: 2px solid black;
}

td {
	padding: 12px;
	text-align: center;
	border-bottom: 1px solid gray;
	font-size: 16px;
}

img {
	width: 150px;
	height: 150px;
	margin-bottom: 15px;
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

</style>
</head>
<body>
	<%@ include file="layout/header.jsp"%>
	<div class="page">
		<div class="list">
			<%@ include file="rank.jsp"%>
		</div>
		<div class="reward">
			<div>
				<h1>Your Point</h1>
				<h2><%=p%></h2>
			</div>
			<div>
				<img alt="gift" src="imgs/gift.png">
				<%
				if (session.getAttribute("u_id") != null) {
				%>
				<button onclick="window.open('get_point.jsp', '_blank', 'width=600,height=500,top=' + (window.screenY + 100) + ',left=' + (window.screenX + 100))">get point</button>
				<%
				}
				%>
			</div>
		</div>
	</div>
	<%@ include file="layout/footer.jsp"%>
</body>
</html>