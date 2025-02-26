<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="db_connect.jsp"%>

<%
String id = request.getParameter("id");
String title = request.getParameter("title");
String contents = request.getParameter("contents");
String writer = request.getParameter("writer");

try {
	String sql = "insert into board values(null,?,?,?,?,now())";
	stmt = conn.prepareStatement(sql);
	stmt.setString(1, id);
	stmt.setString(2, title);
	stmt.setString(3, contents);
	stmt.setString(4, writer);
	stmt.executeUpdate();
	response.sendRedirect("../board_page.jsp");
} catch (Exception e) {
	e.printStackTrace();
} finally {
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
