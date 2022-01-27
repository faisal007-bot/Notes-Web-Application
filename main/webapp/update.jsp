<%@page import="com.notes.entities.Note"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="com.notes.provider.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="header.jsp" %>
<title>Update Note</title>
</head>
<body>
	<%@include file="navbar.jsp" %>
	<%
		int id = Integer.parseInt(request.getParameter("id").trim());
		Session s = FactoryProvider.getFactory().openSession();
		Transaction tx = s.beginTransaction();
		Note note = s.get(Note.class, id);
		tx.commit();
	%>
	
	
	<div class="container mt-5">
		<form action="updateservlet" method="post">
			<div class="mb-3 p-4 text-center">
				<input type="hidden" value="<%= note.getId() %>" name="id"/>
				<label for="exampleInputEmail1" class="form-label text-bold">Enter
					The Title Of The Note</label> <input required="required" type="text"
					class="form-control" id="exampleInputEmail1" value="<%= note.getTitle() %>"
					aria-describedby="emailHelp" placeholder="Enter The Title"
					name="title">
			</div>
			<div class="container">
				<div class="mb-3 text-center">
					<label for="exampleFormControlTextarea1" class="form-label">Enter
						The Content Of The Note</label>
					<textarea required="required" class="form-control"
						id="exampleFormControlTextarea1" rows="18"
						placeholder="Enter Here" name="content" ><%= note.getContent() %></textarea>
				</div>
			</div>
			<div class="text-center p-2">
				<button type="submit" class="btn btn-primary">Update Note</button>
			</div>
		</form>
	</div>
	
	
	<%
		s.close();
		FactoryProvider.closeConnection();
	%>
</body>
</html>