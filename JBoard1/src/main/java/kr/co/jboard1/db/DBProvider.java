package kr.co.jboard1.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBProvider {
	
	protected Connection conn = null;
	protected PreparedStatement psmt = null;
	protected Statement stmt = null;
	protected ResultSet rs = null;
	
	public DBProvider(){
		
		try {
			DataSource ds = (DataSource) new InitialContext().lookup("java:comp/env/dbcp_java1_board");
			conn = ds.getConnection();
			System.out.println("커넥션 생성!");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void close() {
		
		try {
			
			if(rs != null) {
				rs.close();
			}
			
			if(stmt != null) {
				stmt.close();
			}
			
			if(psmt != null) {
				psmt.close();
			}
			
			if(conn != null) {
				conn.close();
			}
			
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}
	
	
}
