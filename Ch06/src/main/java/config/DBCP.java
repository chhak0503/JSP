package config;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBCP {

	private static DataSource ds = null;
	
	
	public static Connection getConnection(String name) throws NamingException, SQLException {
		if(ds == null) {
			ds = (DataSource) new InitialContext().lookup("java:comp/env/"+name);
		}
		return ds.getConnection();
	}
}
