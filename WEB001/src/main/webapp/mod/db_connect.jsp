<%@ page import="java.sql.*"%>

<%
String url = "jdbc:mysql://localhost:3309/spring5fs";
String user = "root";
String password = "1234";
Connection conn = null;
PreparedStatement stmt = null;
ResultSet rset = null;

try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url, user, password);
} catch (Exception e) {
	e.printStackTrace();
}
%>