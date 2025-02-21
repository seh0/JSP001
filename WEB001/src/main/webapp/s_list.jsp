<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<style>
table {
	width: 100%;
	margin: 20px auto;
	border-collapse: collapse;
}

th {
	padding: 12px;
	background-color: gray;
	color: white;
	text-align: center;
	font-size: 18px;
	border-bottom: 2px solid #ddd;
}

td {
	padding: 12px;
	text-align: center;
	border-bottom: 1px solid #ddd;
	font-size: 16px;
}

tr:hover {
	background-color: #f2f2f2;
	cursor: pointer;
}
</style>
</head>
<body>
	<table>
		<tr>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
		<%
		String url = "jdbc:mysql://localhost:3309/spring5fs";
		Class.forName("com.mysql.cj.jdbc.Driver");
		String sql = "select * from list";
		int cnt = 0;
		try {
			Connection conn = DriverManager.getConnection(url, "root", "1234");
			PreparedStatement stmt = conn.prepareStatement(sql);
			ResultSet rset = stmt.executeQuery();
			while (rset.next()) {
				if (cnt == 5) {
			break;
				}
		%>
		<tr onclick="window.open('show_list.jsp?no=<%=rset.getString("no")%>', '_blank', 'width=600,height=500,top=' + (window.screenY + 100) + ',left=' + (window.screenX + 100))">
			<td><%=rset.getString("title")%></td>
			<td><%=rset.getString("writer")%></td>
			<td><%=rset.getString("wdate")%></td>
		</tr>
		<%
		cnt++;
		}
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
	</table>
</body>
</html>