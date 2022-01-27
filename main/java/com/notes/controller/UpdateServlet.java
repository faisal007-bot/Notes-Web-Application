package com.notes.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.notes.entities.Note;
import com.notes.provider.FactoryProvider;

@SuppressWarnings("serial")
@WebServlet("/updateservlet")
public class UpdateServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		response.setContentType("text/html");
		
		int id = Integer.parseInt(request.getParameter("id"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		Session session = FactoryProvider.getFactory().openSession();
		Transaction tx = session.beginTransaction();
		
		Note note = session.get(Note.class, id);
		
		note.setTitle(title);
		note.setContent(content);
		note.setDate(new Date());
		
		session.update(note);
		
		tx.commit();
		session.close();
		FactoryProvider.closeConnection();
		
		response.sendRedirect("updated.jsp");
	}
}
