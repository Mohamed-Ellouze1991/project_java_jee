package tn.iit.glid2.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tn.iit.glid2.model.Utilisateur;

/**
 * Servlet implementation class RemoveServlet
 */
@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));
		ServletContext application = getServletContext();
		List<Utilisateur> listUser = (List<Utilisateur>) application.getAttribute("listU");
		Utilisateur updatedUser = listUser.get(id);
		HttpSession session = request.getSession();
		session.setAttribute("currentUpdate", updatedUser);
		session.setAttribute("position", id);
		response.sendRedirect("modifier.jsp");
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Utilisateur updatedUser = new Utilisateur(request.getParameter("nom"),
				request.getParameter("prenom"), 
				request.getParameter("login"), 
				request.getParameter("pwd"));
		HttpSession session = request.getSession();
		int id = (Integer ) session.getAttribute("position");
		ServletContext application = getServletContext();
		List<Utilisateur> listUser = (List<Utilisateur>) application.getAttribute("listU");
		
		listUser.set(id, updatedUser);
		application.setAttribute("listU", listUser);
		response.sendRedirect("home.jsp");
		
	}

}
