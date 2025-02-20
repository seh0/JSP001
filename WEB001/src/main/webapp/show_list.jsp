<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
	<hr>
	<%=rset.getString("contents")%>
	<%
	}
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>
</body>
</html>