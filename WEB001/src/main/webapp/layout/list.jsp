<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/mod/db_connect.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.list {
	margin-top: 30px;
	padding: 20px;
	display: flex;
	flex-direction: column;
	background-color: #f1fdf9;
	border-radius: 12px;
	min-height: 70vh;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
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
	background: #eaf8e3;
	cursor: pointer;
}
</style>
</head>
<body>
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
			String sql = null;
			int num = 1;
			try {
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
			<tr class="hov" onclick="location.href='info_page.jsp?no=<%=rset.getString("no")%>'">
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
			if (rset != null)
			try {
				rset.close();
			} catch (SQLException e) {
			}
			if (stmt != null)
			try {
				stmt.close();
			} catch (SQLException e) {
			}
			if (conn != null)
			try {
				conn.close();
			} catch (SQLException e) {
			}
			}
			%>
		</table>
	</div>
</body>
</html>