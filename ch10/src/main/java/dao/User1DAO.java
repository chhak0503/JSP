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
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("INSERT INTO `User1` VALUES (?,?,?,?,?)");
			psmt.setString(1, user.getUid());
			psmt.setString(2, user.getName());
			psmt.setString(3, user.getBirth());
			psmt.setString(4, user.getHp());
			psmt.setInt(5, user.getAge());
			psmt.executeUpdate();
			closeAll();
		}catch (Exception e) {
			e.printStackTrace();
		}
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
