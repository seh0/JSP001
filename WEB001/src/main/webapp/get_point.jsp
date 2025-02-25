<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Get Point</title>
</head>
<body>
	<%
	String url = "jdbc:mysql://localhost:3309/spring5fs";
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = null;
	String u_id = (String) session.getAttribute("u_id");

	Random rand = new Random();
	int p = rand.nextInt(100);

	Timestamp pdateTs = null;

	try {
		conn = DriverManager.getConnection(url, "root", "1234");

		String sql = "select pdate from account where id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, u_id);
		ResultSet rset = stmt.executeQuery();
		if (rset.next()) {
			pdateTs = rset.getTimestamp("pdate");

		}

		if (pdateTs != null) {
			long ctime = System.currentTimeMillis();
			long ptime = pdateTs.getTime();
			long timeD = ctime - ptime;

			long minute = timeD / (1000 * 60);
			long rtime = 60 * 10;

			if (minute >= rtime) {
		String sql2 = "update account set point=point+?, pdate=now() where id=?";
		PreparedStatement stmt2 = conn.prepareStatement(sql2);
		stmt2.setInt(1, p);
		stmt2.setString(2, u_id);
		stmt2.executeUpdate();
	%>
	<h1>+ <%=p%> Point
	</h1>
	<%
	} else {
	%>
	<h1><%=(rtime - minute)%> minute left</h1>
	<%
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
</body>
</html>