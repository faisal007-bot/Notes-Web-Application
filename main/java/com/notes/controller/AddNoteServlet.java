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

@WebServlet("/addNoteServlet")
@SuppressWarnings("serial")
public class AddNoteServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		resp.setContentType("text/html");
		
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		Note note = new Note(title,content,new Date());
		
		Session session = FactoryProvider.getFactory().openSession();
		Transaction tx = session.beginTransaction();
		
		session.save(note);
		
		tx.commit();
		session.close();
		FactoryProvider.closeConnection();
		
		resp.sendRedirect("success.jsp");
	}
}
