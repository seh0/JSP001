<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/mod/db_connect.jsp"%>
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
	String u_id = (String) session.getAttribute("u_id");

	Random rand = new Random();
	int p = rand.nextInt(100);

	Timestamp pdateTs = null;

	try {
		String sql = "select pdate from account where id=?";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, u_id);
		rset = stmt.executeQuery();
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
		sql = "update account set point=point+?, pdate=now() where id=?";
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, p);
		stmt.setString(2, u_id);
		stmt.executeUpdate();
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
	} catch (SQLException e) {
	}
	}
	%>
</body>
</html>