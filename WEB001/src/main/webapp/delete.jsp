<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
String url = "jdbc:mysql://localhost:3309/spring5fs";
Class.forName("com.mysql.cj.jdbc.Driver");
String b_no = request.getParameter("no");
int no = Integer.parseInt(b_no);
Connection conn = null;
try {
	conn = DriverManager.getConnection(url, "root", "1234");
	String sql = "delete from board where no=?";
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setInt(1, no);
	stmt.executeUpdate();
} catch (Exception e) {
	e.printStackTrace();
} finally {
	if (conn != null)
		try {
	conn.close();
		} catch (Exception e) {
		}
}
response.sendRedirect("list_page.jsp");
%>
