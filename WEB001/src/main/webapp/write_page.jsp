<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Write</title>
<style>
.page {
	min-height: 60vh;
	display: flex;
	flex-direction: column;
	margin: 15vh 10vh;
	background-color: #f1fdf9;
	padding: 30px;
	border-radius: 20px;
}

.title {
	width: 100%;
	padding: 10px;
	font-size: 24px;
	border: 1px solid #ddd;
	border-radius: 5px;
	margin-bottom: 20px;
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

.writer-container {
	display: flex;
	align-items: center;
	margin-bottom: 20px;
}

.writer-container label {
	margin-right: 20px;
	font-size: 18px;
}

.writer-container input {
	width: 20vh;
	padding: 10px;
	font-size: 18px;
	border: 1px solid #ddd;
	border-radius: 5px;
	background-color: #f9f9f9;
}

.b_box {
	margin-left: auto;
	margin-top: auto;
	display: flex;
	flex-direction: row;
	gap: 30px;
	justify-content: flex-end;
}

.b_box button {
	padding: 10px;
	font-size: 20px;
	background-color: #5a9;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}
</style>
</head>
<body>
	<%@ include file="layout/header.jsp"%>
	<div class="page">
		<h1>글 작성</h1>
		<form action="mod/write.jsp">
			<input type="hidden" name="id" value="<%=session.getAttribute("u_id")%>">
			<input type="text" class="title" name="title" required placeholder="제목을 입력하세요">
			<textarea class="contents" name="contents" required placeholder="내용을 입력하세요"></textarea>
			<br> <br>
			<div class="writer-container">
				<label for="writer">작성자</label>
				<%
				if (session.getAttribute("u_name") != null) {
				%>
				<%=session.getAttribute("u_name")%>
				<input type="hidden" name="writer" value="<%=session.getAttribute("u_name")%>">
				<%
				} else {
				%>
				<input type="text" id="writer" name="writer" required>
				<%
				}
				%>
			</div>
			<div class="b_box">
				<button type="submit">작성하기</button>
				<button type="button" onclick="history.back()">뒤로가기</button>
			</div>
		</form>
	</div>
	<%@ include file="layout/footer.jsp"%>
</body>
</html>