<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="db_connect.jsp"%>

<%
String contents = request.getParameter("contents");
String b_no = request.getParameter("no");
int no = Integer.parseInt(b_no);

try {
	String sql = "update board set cont=?,wdate=now() where no=?";
	stmt = conn.prepareStatement(sql);
	stmt.setString(1, contents);
	stmt.setInt(2, no);
	stmt.executeUpdate();
	response.sendRedirect("../info_page.jsp?no=" + no);
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
