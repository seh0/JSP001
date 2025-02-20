<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
String url = "jdbc:mysql://localhost:3309/spring5fs";
Class.forName("com.mysql.cj.jdbc.Driver");
String l_no = request.getParameter("no");
int no = Integer.parseInt(l_no);
try {
	Connection conn = DriverManager.getConnection(url, "root", "1234");
	String sql = "delete from list where no=?";
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setInt(1, no);
	stmt.executeUpdate();
} catch (Exception e) {
	e.printStackTrace();
}
response.sendRedirect("list_page.jsp");
%>
