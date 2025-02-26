<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="db_connect.jsp"%>

<%
String b_no = request.getParameter("no");
int no = Integer.parseInt(b_no);

try {
	String sql = "delete from board where no=?";
	stmt = conn.prepareStatement(sql);
	stmt.setInt(1, no);
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