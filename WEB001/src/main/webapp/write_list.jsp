<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.page {
	min-height: 60vh;
	display: flex;
	flex-direction: column;
	margin: 15vh 10vh;
	background-color: #f2f2f2;
	padding: 30px;
	border-radius: 20px;
}

.title {
	width: 93%;
	height: 5vh;
	font-size: 30px;
}

.contents {
	width: 100%;
	height: 30vh;
	font-size: 25px;
}

.btn {
	width: 5vw;
}
</style>
</head>
<body>
	<%@ include file="layout/header.jsp"%>
	<div class="page">
		<form action="write.jsp">
			<h1>
				제목 : <input type="text" class="title" name="title" required>
			</h1>
			<input type="text" class="contents" name="contents" required><br> <br>
			<h3>
				작성자 :
				<%
			if (session.getAttribute("u_name") != null) {
			%>
				<%=session.getAttribute("u_name")%>
				<input type="hidden" name="writer" value=<%=session.getAttribute("u_name")%>>
				<%
				} else {
				%>
				<input type="text" name="writer" required>
				<%
				}
				%>
				<button type="submit">write</button>
			</h3>
		</form>
		<button class="btn" type="button" onclick="history.back()">back</button>
	</div>
	<%@ include file="layout/footer.jsp"%>
</body>
</html>