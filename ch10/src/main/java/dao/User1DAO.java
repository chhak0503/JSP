package dao;

import java.util.List;

import db.DBHelper;
import dto.User1DTO;

public class User1DAO extends DBHelper {

	private static User1DAO instance = new User1DAO();
	public static User1DAO getInstance() {
		return instance;
	}
	private User1DAO() {}
	
	// 기본 CRUD
	public void insertUser1(User1DTO user) {
		
	}
	
	public User1DTO selectUser1(String uid) {
		return null;
	}
	
	public List<User1DTO> selectUser1s() {
		return null;
	}
	
	public void updateUser1(User1DTO user) {
		
	}
	
	public void deleteUser1(String uid) {
		
	}
	
}
