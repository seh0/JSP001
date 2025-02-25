<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Detail</title>
<style>
body {
	background-color: #f2f2f2;
}

.page {
	min-height: 60vh;
	display: flex;
	flex-direction: column;
	margin: 15vh 10vh;
	background-color: white;
	padding: 30px;
	border-radius: 20px;
	box-shadow: 5px 5px 5px 5px gray;
}

.page h3 {
	margin-top: auto;
	margin-left: auto;
}

.b_box {
	margin-left: auto;
	margin-top: auto;
	display: flex;
	flex-direction: row;
	gap: 30px;
}

.b_box button {
	padding : 10px;
	font-size: 20px;
	background-color: #5a9;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	width: 100%;
	padding: 10px;
}

</style>
</head>
<body>
	<%@ include file="layout/header.jsp"%>
	<div class="page">
		<%
		String url = "jdbc:mysql://localhost:3309/spring5fs";
		Class.forName("com.mysql.cj.jdbc.Driver");
		String b_no = request.getParameter("no");
		int no = Integer.parseInt(b_no);
		String b_id = null;
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, "root", "1234");
			String sql = "select * from board where no=?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, no);
			ResultSet rset = stmt.executeQuery();
			while (rset.next()) {
				b_id = rset.getString("id");
		%>
		<h1>제목 : <%=rset.getString("title")%></h1> <br> <br>
		<h2><%=rset.getString("cont")%></h2>
		<h3>작성자 : <%=rset.getString("writer")%><br> 작성일 : <%=rset.getString("wdate")%>
		</h3>
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
		<div class="b_box">
			<%
			String u_id = (String) session.getAttribute("u_id");
			if (u_id != null) {
				if (u_id.equals("admin") || u_id.equals(b_id)) {
			%>
			<form action="update_list.jsp">
				<input type="hidden" name="no" value=<%=b_no%>>
				<button type="submit">update</button>
			</form>
			<form action="delete.jsp">
				<input type="hidden" name="no" value=<%=b_no%>>
				<button type="submit">delete</button>
			</form>
			<%
			}
			}
			%>
			<button type="button" onclick="history.back()">back</button>
		</div>
	</div>
	<%@ include file="layout/footer.jsp"%>
</body>
</html>