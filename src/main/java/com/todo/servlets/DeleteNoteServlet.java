package com.todo.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.todo.entity.Note;
import com.todo.helper.FactoryProvider;

public class DeleteNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteNoteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			int id = Integer.parseInt(request.getParameter("note_id"));
			Session s = FactoryProvider.getFactory().openSession();	
			Note note =s.get(Note.class,id);
			Transaction tx = s.beginTransaction() ;
			s.delete(note);
			tx.commit();
			s.close();
			response.sendRedirect("all_notes.jsp?msg=deleteSuccess");
//			response.sendRedirect("addnotes.jsp");
		} catch (Exception e) {
			e.getMessage();
		}

	}

}
