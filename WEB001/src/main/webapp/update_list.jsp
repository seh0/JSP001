<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.page {
	min-height: 100vh;
	display: flex;
	flex-direction: column;
	margin: 15vh 10vh;
}

.btn {
	width: 5vw;
}

input {
	width: 50vh;
	height: 20vh;
	font-size: 25px;
}
</style>
</head>
<body>
	<%@ include file="layout/header.jsp"%>
	<div class="page">
		<form action="update.jsp">
			<h1>내용 수정</h1>
			<input type="text" name="contents" required> <input type="hidden" name="no" value=<%=request.getParameter("no")%>> <br>
			<button type="submit">update</button>
		</form>
		<button class="btn" type="button" onclick="history.back()">back</button>
	</div>
	<%@ include file="layout/footer.jsp"%>
</body>
</html>