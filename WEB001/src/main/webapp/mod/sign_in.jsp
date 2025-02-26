<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="db_connect.jsp"%>
<%
String id = request.getParameter("u_id");
String pwd = request.getParameter("u_pwd");

try {
	String sql = "select id,name from account where id=? and pwd=?";
	stmt = conn.prepareStatement(sql);
	stmt.setString(1, id);
	stmt.setString(2, pwd);
	rset = stmt.executeQuery();
	if (rset.next()) {
		session.setAttribute("u_id", rset.getString("id"));
		session.setAttribute("u_name", rset.getString("name"));
		response.sendRedirect("../first.jsp");
	} else {
%>
<script type="text/javascript">
	alert('다시 확인해 주세요');
	window.location.href = "../sign_page.jsp";
</script>
<%
}
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