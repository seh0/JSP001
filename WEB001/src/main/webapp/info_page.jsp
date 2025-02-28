<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Detail</title>
<style>
body {
	background-color: #f1fdf9;
}

.page {
	min-height: 60vh;
	display: flex;
	flex-direction: column;
	margin: 15vh 10vw 20px;
	background-color: white;
	padding: 30px;
	border-radius: 20px;
	box-shadow: 5px 5px 5px 5px gray;
}

.page h3 {
	margin-top: auto;
	margin-left: auto;
}

.comt {
	display: flex;
	flex-direction: column;
	margin: 5vh 10vw;
	background-color: white;
	padding: 5px 20px;
	border-radius: 20px;
	box-shadow: 5px 5px 5px 5px gray;
}

.b_box {
	margin-left: auto;
	margin-top: auto;
	display: flex;
	flex-direction: row;
	gap: 30px;
}

.b_box button {
	padding: 10px;
	font-size: 20px;
	background-color: #5a9;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	width: 100%;
	padding: 10px;
}
</style>
</head>
<body>
	<%@ include file="layout/header.jsp"%>
	<div class="page">
		<%@ include file="layout/info.jsp"%>
		<div class="b_box">
			<%
			String u_id = (String) session.getAttribute("u_id");
			if (u_id != null) {
				if (u_id.equals("admin") || u_id.equals(b_id)) {
			%>
			<form action="update_page.jsp">
				<input type="hidden" name="no" value=<%=b_no%>>
				<button type="submit">update</button>
			</form>
			<form action="mod/delete.jsp">
				<input type="hidden" name="no" value=<%=b_no%>>
				<button type="submit">delete</button>
			</form>
			<%
			}
			}
			%>
			<button type="button" onclick="history.back()">back</button>
		</div>
	</div>
	<%@ include file="layout/footer.jsp"%>
</body>
</html>