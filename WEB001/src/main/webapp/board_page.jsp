<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board</title>
<style>
.page {
	min-height: 100vh;
	display: flex;
	flex-direction: column;
	margin: 15vh 10vh;
	padding: 30px;
}

.insert {
	width: 40vh;
}

.btn {
	font-size: 18px;
	background-color: #5a9;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	margin-right: 6vw;
}

.b_box {
	display: flex;
	flex-direction: row;
	justify-content: flex-end;
}

.b_box button {
	font-size: 20px;
	background-color: #5a9;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	margin-right: 6vw;
}
</style>
</head>
<body>
	<%@ include file="layout/header.jsp"%>
	<div class="page">
		<div class="b_box">
			<form>
				<input type="hidden" name="action" value="search">
				<input class="insert" type="text" name="s_title" id="s_title">
				<input class="btn " type="submit" value="검색">
			</form>
			<button type="button" onclick="location.href='write_page.jsp'">글 작성</button>
		</div>
		<%@ include file="layout/list.jsp"%>
	</div>
	<%@ include file="layout/footer.jsp"%>
</body>
</html>