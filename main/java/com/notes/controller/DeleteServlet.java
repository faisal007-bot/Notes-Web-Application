package com.notes.controller;

import java.io.IOException;
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
@WebServlet("/deleteservlet")
public class DeleteServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id").trim());
		
		Session session = FactoryProvider.getFactory().openSession();
		Transaction tx = session.beginTransaction();
		
		Note note = session.get(Note.class, id);
		session.delete(note);
		
		tx.commit();
		session.close();
		FactoryProvider.closeConnection();
		
		response.sendRedirect("deleted.jsp");
	}
}
