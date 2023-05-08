package tn.iit.glid2.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import tn.iit.glid2.model.Autorisation;
import tn.iit.glid2.model.Enseignant;
import tn.iit.glid2.util.JDBCUtil;

public class AutorisationDAO  implements IAutorisationDAO{

	@Override
	public void Save(Autorisation autorisation) {
		 String query= "insert into autorisation values (0,"+autorisation.getId_enseignant()+",'"+autorisation.getDate()+"' , "+autorisation.getNb_heure()+" )";
			
		 try {
			 
			 JDBCUtil.getStatement().executeUpdate(query);
			 
		 }
		 catch(SQLException e )
		 {
			 e.printStackTrace();
		 }
		
	}

	@Override
	public void Delete(Autorisation autorisation) {
		 String query= "delete from  autorisation where id ="+autorisation.getId();			
		 try {			 
			 JDBCUtil.getStatement().executeUpdate(query);			 
		 }
		 catch(SQLException e )
		 {
			 e.printStackTrace();
		 }
		
	}

	@Override
	public void Update(Autorisation autorisation) {
		 String query= "update  from  autorisation where id ="+autorisation.getId();
			
		 try {
			 
			 JDBCUtil.getStatement().executeUpdate(query);
			 
		 }
		 catch(SQLException e )
		 {
			 e.printStackTrace();
		 }
		
	}

	@Override
	public List<Autorisation> getAll() {
		 String query = "select * from  autorisation ";
		 List<Autorisation> ListRes = new ArrayList<>();
		 
		 try {			 
			ResultSet rs= JDBCUtil.getStatement().executeQuery(query);
			while (rs.next())
			{
				LocalDate dateAutorisation = LocalDate.parse(rs.getString(3), DateTimeFormatter.ofPattern("yyyy-MM-dd"));
				ListRes.add(new Autorisation(rs.getInt(1),rs.getInt(2),dateAutorisation,rs.getInt(4)) );
			}	
			 
		 }
		 catch(SQLException e )
		 {
			 e.printStackTrace();
		 }
		
			return ListRes;
	}

	@Override
	public List<Autorisation> getAllByEnseignant(int id_enseignant) {
		 String query = "select * from  autorisation inner join enseignant on enseignant.id=autorisation.id_enseignant  where  enseignant.id="+id_enseignant;
		 List<Autorisation> ListRes = new ArrayList<>();
		 
		 try {			 
			ResultSet rs= JDBCUtil.getStatement().executeQuery(query);
			while (rs.next())
			{
				LocalDate dateAutorisation = LocalDate.parse(rs.getString(3), DateTimeFormatter.ofPattern("yyyy-MM-dd"));
				ListRes.add(new Autorisation(rs.getInt(1),rs.getInt(2),dateAutorisation,rs.getInt(4)) );
			}	
			 
		 }
		 catch(SQLException e )
		 {
			 e.printStackTrace();
		 }
		
			return ListRes;
	}
	
	public int getNbHeure(int id_enseignant , int weekDate) {
		 String query = " SELECT sum(nb_heure) FROM autorisation WHERE id_enseignant="+id_enseignant+" AND WEEK(date)="+weekDate ;
		int res =0;
		 
		 try {			 
			ResultSet rs= JDBCUtil.getStatement().executeQuery(query);
			while (rs.next())
			{
				
				res = rs.getInt(1);
			}
			 
		 }
		 catch(SQLException e )
		 {
			 e.printStackTrace();
		 }
		
			return res;
	}
	
	public int getNbHeureRestante(int id_enseignant , int year) {
		 String query = " SELECT sum(nb_heure) FROM autorisation WHERE id_enseignant="+id_enseignant+" AND year(date)="+year ;
		int res =0;
		 
		 try {			 
			ResultSet rs= JDBCUtil.getStatement().executeQuery(query);
			while (rs.next())
			{
				
				res = rs.getInt(1);
			}
			 
		 }
		 catch(SQLException e )
		 {
			 e.printStackTrace();
		 }
		
			return res;
	}



}
