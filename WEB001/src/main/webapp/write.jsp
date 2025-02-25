<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
String id = request.getParameter("id");
String title = request.getParameter("title");
String contents = request.getParameter("contents");
String writer = request.getParameter("writer");

String url = "jdbc:mysql://localhost:3309/spring5fs";
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = null;
try {
	conn = DriverManager.getConnection(url, "root", "1234");
	String sql = "insert into board values(null,?,?,?,?,now())";
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setString(1, id);
	stmt.setString(2, title);
	stmt.setString(3, contents);
	stmt.setString(4, writer);
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
