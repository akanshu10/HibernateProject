package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class SaveNoteServlet
 */
public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			String title = request.getParameter("title");
			String content = request.getParameter("content");

			Note note = new Note(title, content, new Date());
//			System.out.println(note.getId()+" "+note.getAddDate()+" "+note.getTitle());
			Session session = FactoryProvider.getSessionFactory().openSession();
			Transaction tx = session.beginTransaction();
			session.save(note);
			tx.commit();
			session.close();
//			response.setContentType("text/html");
//			PrintWriter writer = response.getWriter();
//			writer.println("<h1 style='text-align:center;'>Note is added successfully</h1>");
//			writer.println("<h1 style='text-align:center;'><a href='all_note.jsp'>View All Notes</a></h1>");
			response.sendRedirect("all_note.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
