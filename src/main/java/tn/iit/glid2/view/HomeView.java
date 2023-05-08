package tn.iit.glid2.view;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tn.iit.glid2.model.Utilisateur;

/**
 * Servlet implementation class HomeView
 */
@WebServlet("/HomeView")
public class HomeView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 
		response.setContentType("text/html");
		HttpSession session = request.getSession();
		Utilisateur currentUser = (Utilisateur) session.getAttribute("currentUser");
		response.getWriter().append("Bienvenu Mr/Mme "+currentUser.getNom() + " " + currentUser.getPrenom() +" <br>Vos paramètres sont : <br>Login : ")
		.append(request.getParameter("login"))
		.append("<br>Mot de passe : ")
		.append(request.getParameter("pwd"))
		.append("<br><a href=DisconnectController>Déconnexion</a> <br>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
