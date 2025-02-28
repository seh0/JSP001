<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/mod/db_connect.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SHOW</title>
<style>
body {
	background-color: #5a9;
	margin: 0;
	padding: 0;
}

h1 {
	color: #fff;
	font-size: 2em;
	margin-left: 30px;
	margin-bottom: 10px;
}

.content {
	background-color: #fff;
	min-height: 60vh;
	padding: 20px;
	margin: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	color: #555;
	padding: 20px;
}

.container {
	max-width: 800px;
	margin: 0 auto;
	padding: 20px;
}
</style>
</head>
<body>

	<div class="container">
		<%
		String sql = "select * from board where no=?";
		String b_no = request.getParameter("no");
		int no = Integer.parseInt(b_no);
		String cont = null;

		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, no);
			rset = stmt.executeQuery();

			while (rset.next()) {
				cont = rset.getString("cont");
				cont = cont.replace("\n", "<br>");
		%>
		<h1><%=rset.getString("title")%></h1>
		<div class="content">
			<%=cont%>
		</div>
		<%
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
	</div>

</body>
</html>