<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update</title>
<style>
.page {
	min-height: 100vh;
	display: flex;
	flex-direction: column;
	margin: 15vh 10vh;
}

.contents {
	width: 100%;
	height: 300px;
	padding: 10px;
	font-size: 18px;
	border: 1px solid #ddd;
	border-radius: 5px;
	margin-bottom: 20px;
	resize: none;
}

.page button {
	margin-top: 20px;
	margin-left: auto;
	padding: 10px;
	font-size: 20px;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	padding: 10px;
}

.updt {
	background-color: #5a9;
	width: 100%
}

.back {
	background-color: gray;
	width: 20vw;
}
</style>
</head>
<body>
	<%@ include file="layout/header.jsp"%>
	<div class="page">
		<form action="update.jsp">
			<h1>내용 수정</h1>
			<textarea class="contents" name="contents" required placeholder="내용을 입력하세요"></textarea>
			<input type="hidden" name="no" value=<%=request.getParameter("no")%>>
			<br>
			<button class="updt" type="submit">update</button>
		</form>
		<button class="back" type="button" onclick="history.back()">back</button>
	</div>
	<%@ include file="layout/footer.jsp"%>
</body>
</html>