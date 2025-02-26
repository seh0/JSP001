<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/mod/db_connect.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
<style>
table {
	width: 100%;
	margin: 20px auto;
	border-collapse: collapse;
}

th {
	padding: 12px;
	background-color: #5a9;
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
		String sql = "select * from board order by wdate desc";
		int cnt = 0;
		try {
			stmt = conn.prepareStatement(sql);
			rset = stmt.executeQuery();
			while (rset.next()) {
				if (cnt == 5) {
			break;
				}
		%>
		<tr onclick="window.open('pop/show_list.jsp?no=<%=rset.getString("no")%>', '_blank', 'width=600,height=500,top=' + (window.screenY + 100) + ',left=' + (window.screenX + 100))">
			<td><%=rset.getString("title")%></td>
			<td><%=rset.getString("writer")%></td>
			<td><%=rset.getString("wdate")%></td>
		</tr>
		<%
		cnt++;
		}
		} catch (Exception e) {
		e.printStackTrace();
		} finally {
		if (stmt != null)
		try {
			stmt.close();
		} catch (SQLException e) {
		}
		if (rset != null)
		try {
			rset.close();
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