package kr.co.jboard2.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.jboard2.dao.TermsDAO;
import kr.co.jboard2.dto.TermsDTO;

public class TermsService {

	// Singleton
	private static TermsService instance = new TermsService();
	public static TermsService getInstance() {
		return instance;
	}
	private TermsService() {}
	
	// Logger
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// DAO
	private TermsDAO dao = TermsDAO.getInstance();
	
	public void insertTerms() {
		dao.insertTerms();
	}
	public TermsDTO selectTerms() {
		return dao.selectTerms();
	}
	public void updateTerms() {
		dao.updateTerms();
	}
	public void deleteTerms() {
		dao.deleteTerms();
	}	
	
}
