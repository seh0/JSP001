<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
th, td {
	padding: 15px;
}

th {
	border-bottom: 1px solid black;
}

td {
	text-align: center;
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
			return;
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