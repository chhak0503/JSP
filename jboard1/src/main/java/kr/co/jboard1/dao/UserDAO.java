package kr.co.jboard1.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kr.co.jboard1.db.DBHelper;
import kr.co.jboard1.db.SQL;
import kr.co.jboard1.dto.TermsDTO;
import kr.co.jboard1.dto.UserDTO;

public class UserDAO extends DBHelper {
	
	// 싱글톤
	private static UserDAO instance = new UserDAO();
	public static UserDAO getInstance() {
		return instance;
	}
	private UserDAO() {}
	
	
	// 기본 CRUD 메서드
	public void insertUser(UserDTO user) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.INSERT_USER);
			psmt.setString(1, user.getUid());
			psmt.setString(2, user.getPass());
			psmt.setString(3, user.getName());
			psmt.setString(4, user.getNick());
			psmt.setString(5, user.getEmail());
			psmt.setString(6, user.getHp());
			psmt.setString(7, user.getRegip());
			
			psmt.executeUpdate();
			closeAll();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public UserDTO selectUser(String uid) {
		return null;
	}
	
	public List<UserDTO> selectUsers() {
		return null;
	}
	
	public void updateUser(UserDTO user) {
		
	}
	
	public void deleteUser(String uid) {
		
	}
	
	// 사용자 정의 CRUD 메서드
	public UserDTO selectUserForLogin(String uid, String pass) {
		
		UserDTO user = null;
		
		try {
			conn = getConnection();
			
			psmt = conn.prepareStatement(SQL.SELECT_USER_FOR_LOGIN);
			psmt.setString(1, uid);
			psmt.setString(2, pass);
			
			rs = psmt.executeQuery();
			
			if(rs.next()){
				user = new UserDTO();
				user.setUid(rs.getString(1));
				user.setPass(rs.getString(2));
				user.setName(rs.getString(3));
				user.setNick(rs.getString(4));
				user.setEmail(rs.getString(5));
				user.setHp(rs.getString(6));
				user.setRole(rs.getString(7));
				user.setZip(rs.getString(8));
				user.setAddr1(rs.getString(9));
				user.setAddr2(rs.getString(10));
				user.setRegip(rs.getString(11));
				user.setRdate(rs.getString(12));
				user.setLeaveDate(rs.getString(13));
			}
			
			closeAll();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return user;
	}
	
	
	public TermsDTO selectTerms() {
		
		TermsDTO terms = null;
		
		try {
			conn = getConnection();
			
			stmt = conn.createStatement();
			rs = stmt.executeQuery(SQL.SELECT_TERMS);
			
			if(rs.next()){
				terms = new TermsDTO();
				terms.setTerms(rs.getString(1));
				terms.setPrivacy(rs.getString(2));
			}
			
			closeAll();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return terms;
	}
	
}










