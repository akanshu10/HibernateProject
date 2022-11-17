<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Note</title>
<%@include file="all_js_css.jsp" %>
</head>
<body>
<div class="container">

<%@include file="navbar.jsp" %>
<h1>Please fill your Note details</h1>
<form action="SaveNoteServlet" method="post">
  <div class="form-group">
    <label for="title">Note title</label>
    <input name="title" type="text" class="form-control" id="title" required="required" aria-describedby="emailHelp" placeholder="Enter here">
   
  </div>
  <div class="form-group">
    <label for="content">Note Content</label>
    <textarea name="content" id="content" required="required" placeholder="Enter your content here" class="form-control" style="height: 300px"></textarea>
  </div>
<div class="container text-center">
  
  <button type="submit" class="btn btn-primary">Submit</button>
</div>
</form>
</div>
</body>
</html>