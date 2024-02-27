package kr.co.jboard2.dao;

import java.sql.Statement;
import java.util.ArrayList;
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
	public List<ArticleDTO> selectArticles(int start) {
		List<ArticleDTO> articles = new ArrayList<>();
		
		// 아직 검색 기능은 없기 때문에 ORDER_LIMIT 바로 문자열 연결처리
		try{
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_ARTICLES + SQL.SELECT_ARTICLES_ORDER_LIMIT);
			psmt.setInt(1, start);
			
			rs = psmt.executeQuery();
			
			while(rs.next()){
				ArticleDTO article = new ArticleDTO();
				article.setNo(rs.getInt(1));
				article.setParent(rs.getInt(2));
				article.setComment(rs.getInt(3));
				article.setCate(rs.getString(4));
				article.setTitle(rs.getString(5));
				article.setContent(rs.getString(6));
				article.setFile(rs.getInt(7));
				article.setHit(rs.getInt(8));
				article.setWriter(rs.getString(9));
				article.setRegip(rs.getString(10));
				article.setRdate(rs.getString(11));
				article.setNick(rs.getString(12));
				articles.add(article);			
			}
			closeAll();
		}catch(Exception e){
			e.printStackTrace();
		}
		return articles;
	}
	
	public int selectCountTotal() {
		
		int total = 0;
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_COUNT_TOTAL);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				total = rs.getInt(1);
			}
			closeAll();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return total;
	}

	public void updateArticle(ArticleDTO articleDTO) {
		
	}
	public void deleteArticle(int no) {
		
	}

}
