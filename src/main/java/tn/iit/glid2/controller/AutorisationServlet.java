package tn.iit.glid2.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.WeekFields;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.text.DateFormatter;

import tn.iit.glid2.DAO.AutorisationDAO;
import tn.iit.glid2.DAO.EnseignantDAO;
import tn.iit.glid2.model.Autorisation;
import tn.iit.glid2.model.Enseignant;
import tn.iit.glid2.model.Utilisateur;

/**
 * Servlet implementation class RemoveServlet
 */
@WebServlet("/AutorisationServlet")
public class AutorisationServlet extends HttpServlet {
	
	int id;
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AutorisationServlet() {
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
		EnseignantDAO enseignantDao = new EnseignantDAO();
		Enseignant enseignat = enseignantDao .findByID(id);
		application.setAttribute("currentEnseigant", enseignat);
		AutorisationDAO  autorisationDAO = new AutorisationDAO();
		List<Autorisation> listAutorisation = (List<Autorisation>) application.getAttribute("listAutorisation");
		 application.setAttribute("message", "");
		
		listAutorisation=autorisationDAO.getAllByEnseignant(id); 
		int sum = 0;
		 
		for (Autorisation autorisation : listAutorisation) {
			sum+= autorisation.getNb_heure();
		} 
		
		
		 int anneeActuelle = LocalDate.now().getYear();
		 application.setAttribute("anneeActuelle", anneeActuelle);		 
		 int NbHeureRealiser = autorisationDAO.getNbHeureRestante(id, anneeActuelle);
		 
		 NbHeureRealiser= (52*4)- NbHeureRealiser;
		 
		 application.setAttribute("NbHeureRealiser", NbHeureRealiser);		 

		 System.out.println("RRRRRRRRRRRRRR");
		 System.out.println(NbHeureRealiser);
		
		
		application.setAttribute("listAutorisation", listAutorisation);
		application.setAttribute("sum", sum);
		response.sendRedirect("autorisation.jsp");
		
		 
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ServletContext application = getServletContext();
		AutorisationDAO autorisationDao = new AutorisationDAO();
	 
		
		int id = Integer.parseInt(request.getParameter("id"));
		LocalDate dateAutorisation = LocalDate.parse(request.getParameter("date"), DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		int numeroSemaine = dateAutorisation.get(WeekFields.of(Locale.getDefault()).weekOfWeekBasedYear());	 		
		 application.setAttribute("message", "");
	      
		 
		
		 
		int id_heure = Integer.parseInt(request.getParameter("nb_heure"));
		AutorisationDAO  autorisationDAO = new AutorisationDAO();
		Autorisation autorisation = new Autorisation(id,dateAutorisation,id_heure);
		
		int nbHeureRealiser = autorisationDAO.getNbHeure(id, numeroSemaine);
		
		
		
		
		if(nbHeureRealiser+id_heure > 4) {
			
			  String message = "Attention, le nombre d'heures réalisées dépasse 4 heures.";
			  application.setAttribute("message", message);
			  response.sendRedirect("autorisation.jsp");
		}
		else 
		{
			 autorisationDAO.Save(autorisation);
			 response.sendRedirect("bienvenue.jsp");
		}
		 
		
		
		/*Utilisateur updatedUser = new Utilisateur(request.getParameter("nom"),
				request.getParameter("prenom"), 
				request.getParameter("login"), 
				request.getParameter("pwd"));
		HttpSession session = request.getSession();
		int id = (Integer ) session.getAttribute("position");
		ServletContext application = getServletContext();
		List<Utilisateur> listUser = (List<Utilisateur>) application.getAttribute("listU");
		
		listUser.set(id, updatedUser);
		application.setAttribute("listU", listUser);
		response.sendRedirect("home.jsp");*/
		
	}

}
