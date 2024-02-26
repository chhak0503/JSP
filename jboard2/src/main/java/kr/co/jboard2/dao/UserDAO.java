package kr.co.jboard2.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.jboard2.db.DBHelper;
import kr.co.jboard2.db.SQL;
import kr.co.jboard2.dto.UserDTO;

public class UserDAO extends DBHelper {

	private static UserDAO instance = new UserDAO();
	public static UserDAO getInstance() {
		return instance;
	}
	private UserDAO() {}
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public void insertUser(UserDTO userDTO) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.INSERT_USER);
			psmt.setString(1, userDTO.getUid());
			psmt.setString(2, userDTO.getPass());
			psmt.setString(3, userDTO.getName());
			psmt.setString(4, userDTO.getNick());
			psmt.setString(5, userDTO.getEmail());
			psmt.setString(6, userDTO.getHp());
			psmt.setString(7, userDTO.getRegip());
			psmt.setString(8, userDTO.getSms());
			logger.info("insertUser : " + psmt);
			
			psmt.executeUpdate();
			
			closeAll();
		}catch (Exception e) {
			logger.error("insertUser : " + e.getMessage());
		}
		
	}
	public UserDTO selectUser(String uid) {
		return null;
	}
	public List<UserDTO> selectUsers() {
		return null;
	}
	public void updateUser(UserDTO userDTO) {
		
	}
	public void deleteUser(String uid) {
		
	}	
}














