<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>rank</title>
</head>
<body>
	<table>
		<tr>
			<th>No</th>
			<th>ID</th>
			<th>Name</th>
			<th>Point</th>
		</tr>
		<%
		String url = "jdbc:mysql://localhost:3309/spring5fs";
		Class.forName("com.mysql.cj.jdbc.Driver");
		String sql = "select concat(substring(id,1,1),repeat('*',length(id)-2),substring(id,-1)) as id,name,point from account order by point desc";
		Connection conn = null;
		int cnt = 1;
		int p = 0;
		try {
			conn = DriverManager.getConnection(url, "root", "1234");
			PreparedStatement stmt = conn.prepareStatement(sql);
			ResultSet rset = stmt.executeQuery();
			while (rset.next()) {
				if (cnt == 10) {
			break;
				}
		%>
		<tr>
			<td><%=cnt++%></td>
			<td><%=rset.getString("id")%></td>
			<td><%=rset.getString("name")%></td>
			<td><%=rset.getString("point")%></td>
		</tr>
		<%
		}
		String u_id = (String) session.getAttribute("u_id");
		if (u_id != null) {
		String sql2 = "select point from account where id=?";
		PreparedStatement stmt2 = conn.prepareStatement(sql2);
		stmt2.setString(1, u_id);
		ResultSet rset2 = stmt2.executeQuery();
		if (rset2.next()) {
			p = rset2.getInt("point");
		}
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
</body>
</html>