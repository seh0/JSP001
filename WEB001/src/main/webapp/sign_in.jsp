<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
String id = request.getParameter("u_id");
String pwd = request.getParameter("u_pwd");

String url = "jdbc:mysql://localhost:3309/spring5fs";
Class.forName("com.mysql.cj.jdbc.Driver");
try {
	Connection conn = DriverManager.getConnection(url, "root", "1234");
	String sql = "select name from account where id=? and pwd=?";
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setString(1, id);
	stmt.setString(2, pwd);
	ResultSet rset = stmt.executeQuery();
	if(rset.next()){
		session.setAttribute("u_name", rset.getString("name"));
		response.sendRedirect("first.jsp");
	} else {
		response.sendRedirect("sign_page.jsp");
	}
} catch (Exception e) {
	e.printStackTrace();
}
%>