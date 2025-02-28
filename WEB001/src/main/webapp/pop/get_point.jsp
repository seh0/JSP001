<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/mod/db_connect.jsp"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Get Point</title>
<style>
body {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
	background-color: #5a9;
	color: white;
}

.progress-container {
	width: 80%;
	height: 30px;
	background-color: #f3f3f3;
	border-radius: 15px;
	overflow: hidden;
	position: fixed;
	bottom: 10px;
	left: 10%;
}

.progress-bar {
	height: 100%;
	width: 0;
	border-radius: 5px;
	text-align: center;
	line-height: 30px;
	color: white;
	font-weight: bold;
}
</style>
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

			long rminute = 60;

			if (minute >= rminute) {
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
	int progress = (int) ((minute / (double) rminute) * 100);
	%>
	<h1><%=(rminute - minute)%>분 후 획득 가능</h1>
	<div class="progress-container">
		<div id="progress-bar" class="progress-bar" style="width: <%=progress%>%; background-color: 
			<%=progress > 66 ? "green" : (progress > 33 ? "orange" : "red")%>;">
			<%=progress%>%
		</div>
	</div>
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