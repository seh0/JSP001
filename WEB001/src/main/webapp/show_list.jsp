<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
}

h1 {
	color: #333;
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
		String url = "jdbc:mysql://localhost:3309/spring5fs";
		Class.forName("com.mysql.cj.jdbc.Driver");
		String sql = "select * from list where no=?";
		String li_no = request.getParameter("no");
		int no = Integer.parseInt(li_no);

		try {
			Connection conn = DriverManager.getConnection(url, "root", "1234");
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, no);
			ResultSet rset = stmt.executeQuery();

			while (rset.next()) {
		%>
		<h1><%=rset.getString("title")%></h1>
		<div class="content">
			<%=rset.getString("contents")%>
		</div>
		<%
		}
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
	</div>

</body>
</html>