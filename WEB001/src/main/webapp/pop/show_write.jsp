<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/mod/db_connect.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	background-color: #e0d0f1;
}

.list {
	background-color: white;
	margin: 20px;
	padding: 20px;
	display: flex;
	flex-direction: column;
	border-radius: 10px;
	min-height: 80vh;
	box-shadow: 10px 10px 10px 10px #3C3C8C;
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
	background: #f2f2f2;
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
				<th>내용</th>
			</tr>
			<%
			request.setCharacterEncoding("UTF-8");
			String s_title = request.getParameter("s_title");
			String id = (String) session.getAttribute("u_id");
			int num = 1;
			try {
				String sql = "SELECT * FROM board where id=?";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, id);
				rset = stmt.executeQuery();
				while (rset.next()) {
			%>
			<tr class="hov" onclick="window.open('../layout/info.jsp?no=<%=rset.getString("no")%>', '_blank', 'width=700,height=600,top=' + (window.screenY + 100) + ',left=' + (window.screenX + 100))">
				<td><%=num++%></td>
				<td><%=rset.getString("title")%></td>
				<td><%=rset.getString("cont").length() > 5 ? rset.getString("cont").substring(0, 5)+"..." : rset.getString("cont")%></td>
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