<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
String url = "jdbc:mysql://localhost:3309/spring5fs";
Class.forName("com.mysql.cj.jdbc.Driver");
String contents = request.getParameter("contents");
String b_no = request.getParameter("no");
Connection conn = null;
int no = Integer.parseInt(b_no);
try {
	conn = DriverManager.getConnection(url, "root", "1234");
	String sql = "update board set cont=?,wdate=now() where no=?";
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setString(1, contents);
	stmt.setInt(2, no);
	stmt.executeUpdate();
	response.sendRedirect("list_page.jsp");
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
