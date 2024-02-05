package kr.co.jboard1.db;

public class SQL {

	
	public static final String INSERT_USER = "INSERT INTO `User` SET "
										   + "`uid`=?,"
										   + "`pass`=?,"
										   + "`name`=?,"
										   + "`nick`=?,"
										   + "`email`=?,"
										   + "`hp`=?,"
										   + "`regip`=?,"
										   + "`rdate`=NOW()";
	
}
