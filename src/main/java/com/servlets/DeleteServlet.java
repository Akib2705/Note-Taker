package com.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.util.FactoryProvider;

public class DeleteServlet extends HttpServlet {
	public DeleteServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int noteId = Integer.parseInt(request.getParameter("note_id"));
			
			Session session = FactoryProvider.getSessionFactory().openSession();
			Transaction transaction = session.beginTransaction();

			Note note = session.get(Note.class, noteId);
			session.delete(note);
			transaction.commit();

			response.sendRedirect("allNotes.jsp");

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
