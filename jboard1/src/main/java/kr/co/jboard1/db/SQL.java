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
	
}
