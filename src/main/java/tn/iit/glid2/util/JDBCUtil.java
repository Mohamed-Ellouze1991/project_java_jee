package tn.iit.glid2.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
 

public class JDBCUtil {
	 
		
		private static Statement stmt = null;
		private static Connection ctx ;
		static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			 ctx =  DriverManager.getConnection("jdbc:mysql://localhost:3306/maBase","root","");
			stmt=ctx.createStatement();
		 
			
		}
		catch(ClassNotFoundException |SQLException  e )
		{
			e.printStackTrace();
		}
		}
	 
	
	public static Statement getStatement()  
	{
		return stmt;
		
	}
	public static void  disconnect () throws SQLException
	{ 
		stmt.close();
		ctx.close();	
		
	}
	

}
