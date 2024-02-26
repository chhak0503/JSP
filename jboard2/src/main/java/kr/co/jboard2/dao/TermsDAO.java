package kr.co.jboard2.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.jboard2.db.DBHelper;
import kr.co.jboard2.db.SQL;
import kr.co.jboard2.dto.TermsDTO;

public class TermsDAO extends DBHelper {
	
	private static TermsDAO instance = new TermsDAO();
	public static TermsDAO getInstance() {
		return instance;
	}
	private TermsDAO() {}
	
	// 로거생성
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public void insertTerms() {}
	
	public TermsDTO selectTerms() {
		
		TermsDTO termsDTO = new TermsDTO();
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(SQL.SELECT_TERMS);
			logger.info("selectTerms : " + stmt);
			
			if(rs.next()) {
				termsDTO.setTerms(rs.getString(1));
				termsDTO.setPrivacy(rs.getString(2));
				termsDTO.setSms(rs.getString(3));				
			}
			
			closeAll();
			
		}catch (Exception e) {
			logger.error("selectTerms : " + e.getMessage());
		}
		
		return termsDTO;
	}
	
	public void updateTerms() {}
	public void deleteTerms() {}

}








