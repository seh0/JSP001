<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
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

.hov:hover {
	background: #dcdcdc;
	cursor: pointer;
}

.b_box {
	display: flex;
	flex-direction: row;
	margin-left: auto;
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
			<table>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
				<%
				String url = "jdbc:mysql://localhost:3309/spring5fs";
				Class.forName("com.mysql.cj.jdbc.Driver");
				String sql = "select * from list";
				int num = 1;
				try {
					Connection conn = DriverManager.getConnection(url, "root", "1234");
					PreparedStatement stmt = conn.prepareStatement(sql);
					ResultSet rset = stmt.executeQuery();
					while (rset.next()) {
				%>
				<tr class="hov" onclick="location.href='info_list.jsp?no=<%=rset.getString("no")%>'">
					<td><%=num++%></td>
					<td><%=rset.getString("title")%></td>
					<td><%=rset.getString("writer")%></td>
					<td><%=rset.getString("wdate")%></td>
				</tr>
				<%
				}
				} catch (Exception e) {
				e.printStackTrace();
				}
				%>
			</table>
		</div>
	</div>
	<%@ include file="layout/footer.jsp"%>
</body>
</html>