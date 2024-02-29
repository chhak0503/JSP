package kr.co.jboard2.dao;

import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.jboard2.db.DBHelper;
import kr.co.jboard2.db.SQL;
import kr.co.jboard2.dto.ArticleDTO;
import kr.co.jboard2.dto.FileDTO;

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
	
	public int insertComment(ArticleDTO articleDTO) {
		
		int result = 0;
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.INSERT_COMMENT);
			psmt.setInt(1, articleDTO.getParent());
			psmt.setString(2, articleDTO.getContent());
			psmt.setString(3, articleDTO.getWriter());
			psmt.setString(4, articleDTO.getRegip());
			logger.info("insertComment : " + psmt);
			
			result = psmt.executeUpdate();
			closeAll();
			
		}catch (Exception e) {
			logger.error("insertComment : " + e.getMessage());
		}
		
		return result;
	}
	
	
	public ArticleDTO selectArticle(String no) {
		
		ArticleDTO articleDTO = null;
		List<FileDTO> files = new ArrayList<>();
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_ARTICLE);
			psmt.setString(1, no);
			logger.info("selectArticle : " + psmt);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				
				// 글 하나당 파일이 여러개일 경우 글객체(ArticleDTO)는 여러개 생성할 필요가 없기 때문에 1개만 생성 되도록 조건처리
				if(articleDTO == null) {
					articleDTO = new ArticleDTO();
					articleDTO.setNo(rs.getInt(1));
					articleDTO.setParent(rs.getInt(2));
					articleDTO.setComment(rs.getInt(3));
					articleDTO.setCate(rs.getString(4));
					articleDTO.setTitle(rs.getString(5));
					articleDTO.setContent(rs.getString(6));
					articleDTO.setFile(rs.getInt(7));
					articleDTO.setHit(rs.getInt(8));
					articleDTO.setWriter(rs.getString(9));
					articleDTO.setRegip(rs.getString(10));
					articleDTO.setRdate(rs.getString(11));
				}
				
				FileDTO fileDTO = new FileDTO();
				fileDTO.setFno(rs.getInt(12));
				fileDTO.setAno(rs.getInt(13));
				fileDTO.setoName(rs.getString(14));
				fileDTO.setsName(rs.getString(15));
				fileDTO.setDownload(rs.getInt(16));
				fileDTO.setRdate(rs.getString(17));
				files.add(fileDTO);
			}
			
			articleDTO.setFileDTOs(files);
			
			closeAll();
			
		}catch (Exception e) {
			logger.error("selectArticle : " + e.getMessage());
		}
		
		return articleDTO;
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
	
	public List<ArticleDTO> selectComments(String parent) {
		
		List<ArticleDTO> comments = new ArrayList<>();
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_COMMENTS);
			psmt.setString(1, parent);
			logger.info("selectComments : " + psmt);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
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
				comments.add(article);
			}
			
			closeAll();
		}catch (Exception e) {
			logger.error("selectComments : " + e.getMessage());
		}
		
		return comments;
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
			logger.error("selectCountTotal" + e.getMessage());
		}
		
		return total;
	}

	public void updateArticle(ArticleDTO articleDTO) {
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.UPDATE_ARTICLE);
			psmt.setString(1, articleDTO.getTitle());
			psmt.setString(2, articleDTO.getContent());
			psmt.setInt(3, articleDTO.getFile());
			psmt.setInt(4, articleDTO.getNo());
			logger.info("updateArticle : " + psmt);
			
			psmt.executeUpdate();		
			closeAll();			
			
		}catch (Exception e) {
			logger.error("updateArticle : " + e.getMessage());
		}
	}
	
	public void updateArticleForFileCount(int no) {
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.UPDATE_ARTICLE_FOR_FILE_COUNT);
			psmt.setInt(1, no);
			logger.info("updateArticleForFileCount : " + psmt);
			
			psmt.executeUpdate();		
			closeAll();			
			
		}catch (Exception e) {
			logger.error("updateArticleForFileCount : " + e.getMessage());
		}
	}
	
	public void deleteArticle(int no) {
		
	}

}
