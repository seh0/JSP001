<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
String id = request.getParameter("u_id");
String pwd = request.getParameter("u_pwd");

String url = "jdbc:mysql://localhost:3309/spring5fs";
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = null;
try {
	conn = DriverManager.getConnection(url, "root", "1234");
	String sql = "select id,name from account where id=? and pwd=?";
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setString(1, id);
	stmt.setString(2, pwd);
	ResultSet rset = stmt.executeQuery();
	if (rset.next()) {
		session.setAttribute("u_id", rset.getString("id"));
		session.setAttribute("u_name", rset.getString("name"));
		response.sendRedirect("first.jsp");
	} else {
%>
<script type="text/javascript">
	alert('다시 확인해 주세요');
	window.location.href = "sign_page.jsp";
</script>
<%
}
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