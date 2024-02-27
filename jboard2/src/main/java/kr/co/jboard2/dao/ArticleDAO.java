package kr.co.jboard2.dao;

import java.sql.Statement;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.jboard2.db.DBHelper;
import kr.co.jboard2.db.SQL;
import kr.co.jboard2.dto.ArticleDTO;

public class ArticleDAO extends DBHelper {
	
	private static ArticleDAO instance = new ArticleDAO();
	public static ArticleDAO getInstance() {
		return instance;
	}
	private ArticleDAO() {}

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public int insertArticle(ArticleDTO articleDTO) {
		
		int pk = 0;
		
		try {
			conn = getConnection();
			
			// INSERT가 실행되고 자동 생성되는 PK값을 리턴하는 옵션
			psmt = conn.prepareStatement(SQL.INSERT_ARTICLE, Statement.RETURN_GENERATED_KEYS);
			psmt.setString(1, articleDTO.getTitle());
			psmt.setString(2, articleDTO.getContent());
			psmt.setInt(3, articleDTO.getFile());
			psmt.setString(4, articleDTO.getWriter());
			psmt.setString(5, articleDTO.getRegip());
			logger.info("insertArticle : " + psmt);
			
			// INSERT 실행
			psmt.executeUpdate();
			
			// 생성된 PK 가져오기
			rs = psmt.getGeneratedKeys();
			if(rs.next()) {
				pk = rs.getInt(1);
			}
			
			closeAll();
			
		}catch (Exception e) {
			logger.error("insertArticle : " + e.getMessage());
		}
		
		return pk;
	}
	public ArticleDTO selectArticle(int no) {
		return null;
	}
	public List<ArticleDTO> selectArticles() {
		return null;
	}
	public void updateArticle(ArticleDTO articleDTO) {
		
	}
	public void deleteArticle(int no) {
		
	}

}
