<%@page import="com.entity.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Note: Note taker</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<div class="container">

		<%@include file="navbar.jsp"%>
		<br>
		<h1 class="text-uppercase">All Notes</h1>

		<div class="row">

			<div class="col-12">
				<%
				Session s = FactoryProvider.getSessionFactory().openSession();
				Query q = s.createQuery("from Note");
				List<Note> list = q.list();

				for (Note n : list) {
				%>

				<div class="card mt-3">
					<img class="card-img-top pl-4 pt-4 " style="max-width: 100px;" src="img/notepad.png" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title"><%= n.getTitle() %></h5>
						<p class="card-text">
						<%= n.getContent() %>
						</p>
						<p>
						<%= n.getAddDate() %>
						</p>
						<div class="container text-right mt-2">
						<a href="edit.jsp?note_id=<%=n.getId() %>" class="btn btn-primary">Update</a>
						<a href="DeleteServlet?note_id=<%= n.getId() %>" class="btn btn-danger">Delete</a>
						</div>
					</div>
				</div>

				<%
				}
				s.clear();
				%>


			</div>

		</div>

	</div>
</body>
</html>