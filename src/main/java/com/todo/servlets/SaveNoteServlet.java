package com.todo.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;


import com.todo.entity.Note;
import com.todo.helper.FactoryProvider;


public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SaveNoteServlet() {
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			Note note = new Note (title, content, new Date());
			
//			System.out.println("Id : " +note.getId()+" Title : "+note.getTitle()+" Content : "+note.getContent()+" Date : " +note.getAddedDate());
			Session s = FactoryProvider.getFactory().openSession();
			Transaction tx = s.beginTransaction();
			s.persist(note);
			tx.commit();
			s.close();
			response.sendRedirect("addnotes.jsp?msg=added");				
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
