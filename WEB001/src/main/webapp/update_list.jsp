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

.btn {
	width: 5vw;
}

</style>
</head>
<body>
	<%@ include file="layout/header.jsp"%>
	<div class="page">
		<form action="update.jsp">
			<h1>내용 수정</h1>
			<textarea class="contents" name="contents" required placeholder="내용을 입력하세요"></textarea>
			<input type="hidden" name="no" value=<%=request.getParameter("no")%>> <br>
			<button type="submit">update</button>
		</form>
		<button class="btn" type="button" onclick="history.back()">back</button>
	</div>
	<%@ include file="layout/footer.jsp"%>
</body>
</html>