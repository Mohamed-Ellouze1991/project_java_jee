package tn.iit.glid2.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import tn.iit.glid2.model.Enseignant;
import tn.iit.glid2.model.Utilisateur;
import tn.iit.glid2.util.JDBCUtil;

public class EnseignantDAO implements IEnseignantDAO {

	@Override
	public void Save(Enseignant enseignant) {
		 String query= "insert into Enseignant values (0,'"+enseignant.getNom()+"' , '"+enseignant.getPrenom()+"' , '"+enseignant.getTelephone()+"', '"+enseignant.getEmail()+"'  )";
		
		 try {
			 
			 JDBCUtil.getStatement().executeUpdate(query);
			 
		 }
		 catch(SQLException e )
		 {
			 e.printStackTrace();
		 }
	}

	@Override
	public void Delete(Enseignant enseignant) {
		 String query= "delete from  Enseignant where id ="+enseignant.getId();			
		 try {			 
			 JDBCUtil.getStatement().executeUpdate(query);			 
		 }
		 catch(SQLException e )
		 {
			 e.printStackTrace();
		 }
		
	}

	@Override
	public void Update(Enseignant enseignant) {
		 String query= "update  from  Enseignant where id ="+enseignant.getId();
			
		 try {
			 
			 JDBCUtil.getStatement().executeUpdate(query);
			 
		 }
		 catch(SQLException e )
		 {
			 e.printStackTrace();
		 }
		
	}

	@Override
	public List<Enseignant> getAll() { 
		 String query = "select * from  Enseignant ";
		 List<Enseignant> ListRes = new ArrayList<>();
		 
		 try {			 
			ResultSet rs= JDBCUtil.getStatement().executeQuery(query);
			while (rs.next())
			{
				ListRes.add(new Enseignant(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5)) );
			}	
			 
		 }
		 catch(SQLException e )
		 {
			 e.printStackTrace();
		 }
		
			return ListRes;
	}

	@Override
	public Enseignant findByID(int id) {
		String query = "select * from  enseignant where id="+id ;
		 Enseignant res = null;
		 
		 try {
			 
			ResultSet rs= JDBCUtil.getStatement().executeQuery(query);
			if (rs.next())
			{
				res=new Enseignant(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5) );
			}
		
			 
		 }
		 catch(SQLException e )
		 {
			 e.printStackTrace();
		 }
		
			return res;
	}

	 
	
	

}
