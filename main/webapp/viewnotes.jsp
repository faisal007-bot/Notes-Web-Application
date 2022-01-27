<%@page import="java.util.ArrayList"%>
<%@page import="com.notes.entities.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.notes.provider.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="header.jsp" %>
<title>View Notes</title>
</head>
<body>
	<%@include file="navbar.jsp" %>
	
	
	<%
		SessionFactory factory = FactoryProvider.getFactory();
		Session session2 = factory.openSession();
		Transaction tx = session2.beginTransaction();
		Query q = session2.createQuery("from Note");
		List<Note> notes = q.list();
		for(Note note:notes){ 
	%>
	
	
	<div class="container pt-4 m2-4">
	<div class="card">
		<div class="card-body">
			<h5 class="card-title"><%= note.getTitle() %></h5>
			<p class="card-text"><%= note.getContent() %></p>
			<p><b class="m-2 p-2"><%= note.getDate().toString() %></b></p>
			<div class="text-center">
				<a href='update.jsp?id=<%= note.getId() %>' class="btn btn-success mx-1">Update</a>
				<a href='deleteservlet?id=<%= note.getId() %>' class="btn btn-danger mx-1">Delete</a>
			</div>
		</div>
	</div>
	</div>
	
	
	<%
		}
		tx.commit();
		session2.close();
	%>
	
</body>
</html>