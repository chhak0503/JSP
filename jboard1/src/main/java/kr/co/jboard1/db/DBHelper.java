package kr.co.jboard1.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBHelper {

	protected Connection conn = null;
	protected PreparedStatement psmt = null;
	protected PreparedStatement psmtEtc1 = null;
	protected PreparedStatement psmtEtc2 = null;
	protected Statement stmt = null;
	protected ResultSet rs = null;
	
	public Connection getConnection() throws NamingException, SQLException {
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/jboard");
		return ds.getConnection();
	}
	
	public void closeAll() throws SQLException {
		
		if(rs != null) {
			rs.close();
		}
		
		if(stmt != null) {
			stmt.close();
		}
		
		if(psmt != null) {
			psmt.close();
		}
		
		if(psmtEtc1 != null) {
			psmtEtc1.close();
		}
		
		if(psmtEtc2 != null) {
			psmtEtc2.close();
		}
		
		if(conn != null) {
			conn.close();
		}
	}
}









