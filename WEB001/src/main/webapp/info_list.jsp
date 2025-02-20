<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.page {
	display: flex;
	flex-direction: column;
	margin: 15vh 10vh;
	min-height: 100vh;
}

.b_box {
	display: flex;
	flex-direction: row;
}

.b_box button {
	margin-right: 10px;
	width: 80px;
	height: 30px;
}
</style>
</head>
<body>
	<%@ include file="layout/header.jsp"%>
	<div class="page">
		<%
		String url = "jdbc:mysql://localhost:3309/spring5fs";
		Class.forName("com.mysql.cj.jdbc.Driver");
		String li_no = request.getParameter("no");
		int no = Integer.parseInt(li_no);
		try {
			Connection conn = DriverManager.getConnection(url, "root", "1234");
			String sql = "select * from list where no=?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, no);
			ResultSet rset = stmt.executeQuery();
			while (rset.next()) {
		%>
		<h1>
			제목 :
			<%=rset.getString("title")%></h1>
		<br> <br>
		<h3>
			작성자 :
			<%=rset.getString("writer")%>
			/ 작성일 :
			<%=rset.getString("wdate")%></h3>
		<h2><%=rset.getString("contents")%></h2>
		<%
		}
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
		<div class="b_box">
			<form action="update_list.jsp">
				<input type="hidden" name="no" value=<%=li_no%>>
				<button type="submit">update</button>
			</form>
			<form action="delete.jsp">
				<input type="hidden" name="no" value=<%=li_no%>>
				<button type="submit">delete</button>
			</form>
			<button type="button" onclick="history.back()">back</button>
		</div>
	</div>
	<%@ include file="layout/footer.jsp"%>
</body>
</html>