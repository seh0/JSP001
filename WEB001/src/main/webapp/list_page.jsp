<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
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

.list {
	margin-top: 30px;
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

.hov:hover {
	background: #dcdcdc;
	cursor: pointer;
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
			<button type="button" onclick="location.href='write_list.jsp'">글 작성</button>
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
				request.setCharacterEncoding("UTF-8");
				String s_title = request.getParameter("s_title");
				String url = "jdbc:mysql://localhost:3309/spring5fs";
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection conn = null;
				String sql = null;
				PreparedStatement stmt = null;
				ResultSet rset = null;
				int num = 1;
				try {
					conn = DriverManager.getConnection(url, "root", "1234");

					if ("search".equals(request.getParameter("action")) && s_title != null && !s_title.isEmpty()) {
						sql = "SELECT * FROM board WHERE title LIKE ?";
						stmt = conn.prepareStatement(sql);
						stmt.setString(1, "%" + s_title + "%");
					} else {
						sql = "SELECT * FROM board";
						stmt = conn.prepareStatement(sql);
					}

					rset = stmt.executeQuery();
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
				} finally {
				if (conn != null)
				try {
					conn.close();
				} catch (Exception e) {
				}
				}
				%>
			</table>
		</div>
	</div>
	<%@ include file="layout/footer.jsp"%>
</body>
</html>