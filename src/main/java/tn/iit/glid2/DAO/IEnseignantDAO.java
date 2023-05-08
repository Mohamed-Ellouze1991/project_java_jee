package tn.iit.glid2.DAO;

import java.util.List;

import tn.iit.glid2.model.Enseignant;
 

public interface IEnseignantDAO {
	
	void Save(Enseignant enseignant );
	void Delete(Enseignant enseignant );
	void Update(Enseignant enseignant );
    List<Enseignant> getAll();
    Enseignant findByID(int id );
	

}
