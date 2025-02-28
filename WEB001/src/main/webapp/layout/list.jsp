<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/mod/db_connect.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.list {
	margin-top: 30px;
	padding: 20px;
	display: flex;
	flex-direction: column;
	background-color: #f1fdf9;
	border-radius: 12px;
	min-height: 70vh;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	position: relative;
}

table {
	border-collapse: collapse;
}

th {
	padding: 15px;
	text-align: center;
	font-size: 18px;
	border-bottom: 2px solid black;
}

td {
	padding: 12px;
	text-align: center;
	border-bottom: 1px solid gray;
	font-size: 16px;
}

.hov:hover {
	background: #eaf8e3;
	cursor: pointer;
}

.pagination {
	display: flex;
	justify-content: center;
	margin-top: 20px;
	position: absolute;
	bottom: 20px;
	width: 100%;
}

.pagination a {
	padding: 10px;
	margin: 0 5px;
	text-decoration: none;
	border-radius: 5px;
}

</style>
</head>
<body>
	<div class="list">
		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
			<%
			request.setCharacterEncoding("UTF-8");
			String s_title = request.getParameter("s_title");
			String sql = null;
			int num = 1;

			int pageSize = 10;
			int pageNo = 1;
			String pageParam = request.getParameter("page");
			if (pageParam != null) {
				pageNo = Integer.parseInt(pageParam);
			}

			int startRow = (pageNo - 1) * pageSize;

			try {
				if ("search".equals(request.getParameter("action")) && s_title != null && !s_title.isEmpty()) {
					sql = "SELECT * FROM board WHERE title LIKE ? order by case when id = 'admin' then 0 else 1 end, wdate desc LIMIT ?, ?";
					stmt = conn.prepareStatement(sql);
					stmt.setString(1, "%" + s_title + "%");
					stmt.setInt(2, startRow);
					stmt.setInt(3, pageSize);
				} else {
					sql = "SELECT * FROM board order by case when id = 'admin' then 0 else 1 end, wdate desc LIMIT ?, ?";
					stmt = conn.prepareStatement(sql);
					stmt.setInt(1, startRow);
					stmt.setInt(2, pageSize);
				}

				rset = stmt.executeQuery();
				while (rset.next()) {
			%>
			<tr class="hov" onclick="location.href='info_page.jsp?no=<%=rset.getString("no")%>'">
				<td><%=num++%></td>
				<td><%=rset.getString("title")%></td>
				<td><%=rset.getString("writer")%></td>
				<td><%=rset.getString("wdate")%></td>
			</tr>
			<%
			}
			sql = "select count(*) from board";
			stmt = conn.prepareStatement(sql);
			ResultSet rset2 = stmt.executeQuery();
			rset2.next();
			int totalItems = rset2.getInt(1);
			int totalPages = (int) Math.ceil((double) totalItems / pageSize);
			%>
		</table>
		<div class="pagination">
			<%
            for (int i = 1; i <= totalPages; i++) {
            %>
                <a href="?page=<%= i %>"><%= i %></a>
            <%
            }
            %>
		</div>
			<%
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
	</div>
</body>
</html>