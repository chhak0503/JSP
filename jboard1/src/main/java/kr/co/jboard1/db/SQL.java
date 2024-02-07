package kr.co.jboard1.db;

public class SQL {

	
	public static final String SELECT_TERMS = "SELECT * FROM `terms`";
	
	public static final String INSERT_USER = "INSERT INTO `User` SET "
										   + "`uid`=?,"
										   + "`pass`=SHA2(?, 256),"
										   + "`name`=?,"
										   + "`nick`=?,"
										   + "`email`=?,"
										   + "`hp`=?,"
										   + "`regip`=?,"
										   + "`rdate`=NOW()";
	
	public static final String SELECT_USER_FOR_LOGIN = "SELECT * FROM `User` WHERE `uid`=? AND `pass`=SHA2(?, 256)";
	
	
	public static final String INSERT_ARTICLE = "INSERT INTO `Article` SET "
												+ "`title`=?,"
												+ "`content`=?,"
												+ "`writer`=?,"
												+ "`regip`=?,"
												+ "`rdate`=NOW()";
	
	public static final String SELECT_COUNT_TOTAL = "SELECT COUNT(*) FROM `Article`";
	
	public static final String SELECT_ARTICLES = "SELECT a.*, b.`nick` FROM `Article` AS a "
												+ "JOIN `User` AS b ON a.writer = b.uid "
												+ "ORDER BY `no` DESC "
												+ "LIMIT ?, 10";
	
	public static final String SELECT_ARTICLE = "SELECT * FROM `Article` WHERE `no`=?";
	
}












