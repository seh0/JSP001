<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
String title = request.getParameter("title");
String contents = request.getParameter("contents");
String writer = request.getParameter("writer");

String url = "jdbc:mysql://localhost:3309/spring5fs";
Class.forName("com.mysql.cj.jdbc.Driver");
try {
	Connection conn = DriverManager.getConnection(url, "root", "1234");
	String sql = "insert into list values(null,?,?,?,now())";
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setString(1, title);
	stmt.setString(2, contents);
	stmt.setString(3, writer);
	stmt.executeUpdate();
} catch (Exception e) {
	e.printStackTrace();
}

response.sendRedirect("list_page.jsp");
%>
