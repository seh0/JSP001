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
	padding: 30px;
	border-radius: 20px;
}

.list {
	margin-top: 50px;
	padding: 20px;
	display: flex;
	flex-direction: column;
	background-color: #f2f2f2;
	border-radius: 10%;
	min-height: 70vh;
}

.b_box {
	display: flex;
	flex-direction: row;
}

.b_box button {
	margin-right: 10px;
	width: 80px;
	height: 30px;
}
</style>
</head>
<body>
	<%@ include file="layout/header.jsp"%>
	<div class="page">
		<div class="b_box">
			<button class="btn" type="button" onclick="location.href='write_list.jsp'">write</button>
			<button class="btn" type="button" onclick="history.back()">back</button>
		</div>
		<div class="list">
			<%@ include file="list.jsp"%>
		</div>
	</div>
	<%@ include file="layout/footer.jsp"%>
</body>
</html>