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

.li {
	border-bottom: 1px dotted gray
}

.detail {
	background-color: white;
	border: none;
}
</style>
</head>
<body>
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
		<tr>
			<td class="li"><%=num++%></td>
			<td class="li"><%=rset.getString("title")%></td>
			<td class="li"><%=rset.getString("writer")%></td>
			<td class="li"><%=rset.getString("wdate")%></td>
			<td>
				<form action="info_list.jsp">
					<input type="hidden" name="no" value=<%=rset.getString("no")%>>
					<button class="detail" type="submit">+</button>
				</form>
			</td>
		</tr>
		<%
		}
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
	</table>
</body>
</html>