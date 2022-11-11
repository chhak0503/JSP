package dao;

import db.DBHelper;
import vo.User1Vo;

public class User1Dao extends DBHelper {

	private static User1Dao instance = new User1Dao();
	public static User1Dao getInstance() {
		return instance;
	}
	
	private User1Dao() {}
	
	public void insertUser(User1Vo vo) {
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("insert into `user1` values (?,?,?,?)");
			psmt.setString(1, vo.getUid());
			psmt.setString(2, vo.getName());
			psmt.setString(3, vo.getHp());
			psmt.setInt(4, vo.getAge());
			psmt.executeUpdate();
			close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void selectUser() {}
	public void selectUsers() {}
	public void updateUser() {}
	public void deleteUser() {}
}
