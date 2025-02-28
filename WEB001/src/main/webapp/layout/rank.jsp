<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/mod/db_connect.jsp"%>
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
		String sql = "select concat(substring(id,1,1),repeat('*',length(id)-2),substring(id,-1)) as id,name,point from account order by point desc";
		int cnt = 1;
		int p = 0;
		try {
			stmt = conn.prepareStatement(sql);
			rset = stmt.executeQuery();
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
		sql = "select point from account where id=?";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, u_id);
		ResultSet rset2 = stmt.executeQuery();
		if (rset2.next()) {
			p = rset2.getInt("point");
		}
		if (rset2 != null)
			try {
				rset2.close();
			} catch (SQLException e) {
			}
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
</body>
</html>