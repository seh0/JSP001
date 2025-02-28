<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/mod/db_connect.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user info</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String u_id = (String) session.getAttribute("u_id");
	String sql = null;
	try {
		if (request.getParameter("action") != null && request.getParameter("action").equals("delete")) {
			sql = "delete from account where id=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, u_id);
			stmt.executeUpdate();
			if (stmt != null)
		try {
			stmt.close();
		} catch (SQLException e) {
		}
			session.invalidate();
			response.sendRedirect("out_page.jsp");
		}
		if (u_id != null) {
			if (request.getParameter("action") != null && request.getParameter("action").equals("update")) {
		String name = request.getParameter("name");
		String u_age = request.getParameter("age");
		String gender = request.getParameter("gender");
		int age = Integer.parseInt(u_age);
		sql = "update account set name=?,gender=?,age=? where id=?";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, name);
		stmt.setString(2, gender);
		stmt.setInt(3, age);
		stmt.setString(4, u_id);
		stmt.executeUpdate();
		session.setAttribute("u_name", name);

			}

			sql = "select * from account where id=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, u_id);
			rset = stmt.executeQuery();
			while (rset.next()) {
	%>
	<button onclick="showUpdate('<%=rset.getString("name")%>','<%=rset.getInt("age")%>')">정보 수정</button>
	<h1>id: <%=rset.getString("id")%></h1>
	<h1>이름: <%=rset.getString("name")%></h1>
	<h1>성별: <%
	if (rset.getString("gender").equals("prv")) {
		out.print("비공개");
	} else
		out.print(rset.getString("gender"));
	%>
	</h1>
	<h1>나이: <%=rset.getInt("age")%></h1>
	<h1>포인트: <%=rset.getInt("point")%></h1>
	<h1>가입날짜: <%=rset.getString("jdate")%></h1>
	<form>
		<input type="hidden" name="action" value="delete">
		<input style="color: white; background-color: red; width: 5vw; margin-left: auto;" type="submit" value="탈퇴">
	</form>
	<%
	}
	} else {
	%>
	<h1>로그인 필요</h1>
	<%
	}
	} catch (Exception e) {
	e.printStackTrace();
	} finally {
	if (rset != null)
	try {
		rset.close();
	} catch (SQLException e) {
	}
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
</body>
</html>