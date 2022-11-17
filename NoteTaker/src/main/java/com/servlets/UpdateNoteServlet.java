package com.servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entity.Note;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class UpdateNoteServlet
 */
public class UpdateNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateNoteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			int id = Integer.parseInt(request.getParameter("note_id").trim());
			Session s = FactoryProvider.getSessionFactory().openSession();
			Transaction tx = s.beginTransaction();
			
			Note note = (Note) s.get(Note.class, id);
			note.setTitle(title);
			note.setContent(content);
			note.setAddDate(new Date());
			
			tx.commit();
			s.close();
			response.sendRedirect("all_note.jsp");
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
