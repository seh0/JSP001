<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="db_connect.jsp"%>
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("ac_id");
String pwd = request.getParameter("ac_pwd");
String name = request.getParameter("ac_name");
String gender = request.getParameter("ac_gender");
String s_age = request.getParameter("ac_age");
int age = Integer.parseInt(s_age);

try {
	String sql = "insert into account values(?,?,?,?,?,0,date(now()),now());";
	stmt = conn.prepareStatement(sql);
	stmt.setString(1, id);
	stmt.setString(2, pwd);
	stmt.setString(3, name);
	stmt.setString(4, gender);
	stmt.setInt(5, age);
	stmt.executeUpdate();
	response.sendRedirect("../sign_page.jsp");
} catch (Exception e) {
%>
<script type="text/javascript">
	alert('중복된 아이디 입니다');
	window.location.href = "../join_page.jsp";
</script>
<%
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