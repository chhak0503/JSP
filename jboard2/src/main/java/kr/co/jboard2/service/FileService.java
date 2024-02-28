package kr.co.jboard2.service;

import java.util.List;

import kr.co.jboard2.dao.FileDAO;
import kr.co.jboard2.dto.FileDTO;

public class FileService {
	private static FileService instance = new FileService();
	public static FileService getInstance() {
		return instance;
	}
	private FileService() {}
	
	private FileDAO dao = FileDAO.getInstance();
	
	public void insertFile(FileDTO fileDTO) {
		dao.insertFile(fileDTO);
	} 
	
	public FileDTO selectFile(String fno) {
		return dao.selectFile(fno);
	} 
	public List<FileDTO> selectFiles() {
		return dao.selectFiles();
	} 
	public void updateFile(FileDTO fileDTO) {
		dao.updateFile(fileDTO);
	} 
	public void deleteFile(int fno) {
		dao.deleteFile(fno);
	} 
}
