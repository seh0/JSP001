<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
String id = request.getParameter("ac_id");
String pwd = request.getParameter("ac_pwd");
String name = request.getParameter("ac_name");

String url = "jdbc:mysql://localhost:3309/spring5fs";
Class.forName("com.mysql.cj.jdbc.Driver");
try {
	Connection conn = DriverManager.getConnection(url, "root", "1234");
	String sql = "insert into account values(?,?,?)";
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setString(1, id);
	stmt.setString(2, pwd);
	stmt.setString(3, name);
	stmt.executeUpdate();
	response.sendRedirect("sign_page.jsp");
} catch (Exception e) {
%>
<script type="text/javascript">
	alert('중복된 아이디 입니다');
	window.location.href = "signup_page.jsp";
</script>
<%
}
%>