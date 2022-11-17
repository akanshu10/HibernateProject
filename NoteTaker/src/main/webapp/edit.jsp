<%@page import="com.entity.Note"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit page</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>

	<div class="container">
		<%@include file="navbar.jsp"%>
		<h1>Edit your Notes</h1>
		<%
		int noteId = Integer.parseInt(request.getParameter("note_id").trim());
		Session s = FactoryProvider.getSessionFactory().openSession();
		Note note = (Note) s.get(Note.class, noteId);
		%>
		<form action="UpdateNoteServlet" method="post">
			<div class="form-group">
			
			<input value="<%= note.getId()%>" name="note_id" type="hidden">
			
				<label for="title">Note title</label> <input name="title"
					type="text" class="form-control" id="title" required="required"
					aria-describedby="emailHelp" placeholder="Enter here"
					value="<%= note.getTitle()%>">

			</div>
			<div class="form-group">
				<label for="content">Note Content</label>
				<textarea name="content" id="content" required="required"
					placeholder="Enter your content here" class="form-control"
					style="height: 300px">
					<%= note.getContent() %>
					</textarea>
			</div>
			<div class="container text-center">

				<button type="submit" class="btn btn-success">Save Notes</button>
			</div>
		</form>

		<%
		s.close();
		%>
	</div>
</body>
</html>