package dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class MemberDAO {
	
	private static MemberDAO instance = new MemberDAO();
	public static MemberDAO getInstance() {
		return instance;
	}
	private MemberDAO() {}
	
	// 로거 생성
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	public void insertMember() {}
	public void selectMember() {}
	public void selectMembers() {
		
		try {
			
			
			
		}catch (Exception e) {
			logger.error("selectMembers() - " + e.getMessage());
		}
	}
	
	public void updateMember() {}
	
	public void deleteMember() {}	
}
