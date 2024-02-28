package kr.co.jboard2.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.jboard2.db.DBHelper;
import kr.co.jboard2.db.SQL;
import kr.co.jboard2.dto.FileDTO;

public class FileDAO extends DBHelper {

	private static FileDAO instance = new FileDAO();
	public static FileDAO getInstance() {
		return instance;
	}
	private FileDAO() {}
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public void insertFile(FileDTO fileDTO) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.INSERT_FILE);
			psmt.setInt(1, fileDTO.getAno());
			psmt.setString(2, fileDTO.getoName());
			psmt.setString(3, fileDTO.getsName());
			logger.info("insertFile : " + psmt);
			
			psmt.executeUpdate();
			closeAll();
		}catch (Exception e) {
			logger.error("insertFile : " + e.getMessage());
		}
	} 
	
	public FileDTO selectFile(String fno) {
		
		FileDTO fileDTO = null;
		try {
			conn = getConnection();
			conn.setAutoCommit(false); // 트랜잭션 시작
			
			psmt = conn.prepareStatement(SQL.SELECT_FILE);
			psmt.setString(1, fno);
			logger.info("selectFile : " + psmt);
			
			psmtEtc1 = conn.prepareStatement(SQL.UPDATE_FILE_DOWNLOAD);
			psmtEtc1.setString(1, fno);
			logger.info("selectFile : " + psmtEtc1);
			
			rs = psmt.executeQuery();
			psmtEtc1.executeUpdate();
			
			conn.commit();
			
			if(rs.next()) {
				fileDTO = new FileDTO();
				fileDTO.setFno(rs.getInt(1));
				fileDTO.setAno(rs.getInt(2));
				fileDTO.setoName(rs.getString(3));
				fileDTO.setsName(rs.getString(4));
				fileDTO.setDownload(rs.getInt(5));
				fileDTO.setRdate(rs.getString(6));
			}
			closeAll();
		}catch (Exception e) {
			logger.error("selectFile : " + e.getMessage());
		}
		
		return fileDTO;
	}
	
	public List<FileDTO> selectFiles() {
		return null;
	} 
	public void updateFile(FileDTO fileDTO) {
		
	} 
	public void deleteFile(int fno) {
		
	} 
	
}
