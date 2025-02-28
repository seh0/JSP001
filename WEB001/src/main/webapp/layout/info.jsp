<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/mod/db_connect.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Info</title>
</head>
<body>
	<%
	String b_no = request.getParameter("no");
	int no = Integer.parseInt(b_no);
	String b_id = null;
	String b_cont = null;
	try {
		String sql = "select * from board where no=?";
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, no);
		rset = stmt.executeQuery();
		while (rset.next()) {
			b_id = rset.getString("id");
			b_cont = rset.getString("cont");
			b_cont = b_cont.replace("\n", "<br>");
	%>
	<h1>제목 : <%=rset.getString("title")%></h1>
	<br>
	<br>
	<h2><%=b_cont%></h2>
	<h3>작성자 : <%=rset.getString("writer")%><br> 작성일 : <%=rset.getString("wdate")%>
	</h3>
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
</body>
</html>