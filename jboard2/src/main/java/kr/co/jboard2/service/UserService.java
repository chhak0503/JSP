package kr.co.jboard2.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.jboard2.dao.UserDAO;
import kr.co.jboard2.dto.UserDTO;

public class UserService {
	private static UserService instance = new UserService();
	public static UserService getInstance() {
		return instance;
	}
	private UserService() {}
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private UserDAO dao = UserDAO.getInstance();
	
	public void insertUser(UserDTO userDTO) {
		dao.insertUser(userDTO);
	}
	public UserDTO selectUser(String uid) {
		return dao.selectUser(uid);
	}
	public List<UserDTO> selectUsers() {
		return dao.selectUsers();
	}
	public void updateUser(UserDTO userDTO) {
		dao.updateUser(userDTO);
	}
	public void deleteUser(String uid) {
		dao.deleteUser(uid);
	}	
	
	public int selectCountUser(String type, String value) {
		return dao.selectCountUser(type, value);
	}
	
}
















