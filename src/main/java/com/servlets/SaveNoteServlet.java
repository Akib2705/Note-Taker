package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entities.Note;
import com.util.FactoryProvider;

@WebServlet("/Save")
public class SaveNoteServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		try {
			String title = request.getParameter("title");
			String content = request.getParameter("content");

			Note note = new Note(title, content, new Date());

			SessionFactory sessionFactory = FactoryProvider.getSessionFactory();
			Session session = sessionFactory.openSession();
			Transaction transaction = session.beginTransaction();
			session.save(note);
			transaction.commit();

			session.close();

			out.println("<h1 style='text-align:center'>Note is added successfully</h1>");
			out.println("<h1 style='text-align:center'><a href='allNotes.jsp'>View All Notes</a></h1>");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
