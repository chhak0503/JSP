<%@page import="org.jdom2.output.Format"%>
<%@page import="org.jdom2.output.XMLOutputter"%>
<%@page import="org.jdom2.Element"%>
<%@page import="org.jdom2.Document"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="config.JDBC"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.UserBean"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/xml;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	List<UserBean> userList = new ArrayList<>();
	
	try{
		Connection conn = JDBC.getInstance().getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from `user1`");
		
		while(rs.next()){
			UserBean ub = new UserBean();
			ub.setUid(rs.getString(1));
			ub.setName(rs.getString(2));
			ub.setHp(rs.getString(3));
			ub.setAge(rs.getInt(4));
			
			userList.add(ub);
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}

	// List를 XML로 변환
	Document doc = new Document();
	Element users = new Element("users");	
	
	for(UserBean ub : userList){
		
		Element user = new Element("user");
		Element uid = new Element("uid");
		Element name = new Element("name");
		Element hp = new Element("hp");
		Element age = new Element("age");
		
		uid.setText(ub.getUid());
		name.setText(ub.getName());
		hp.setText(ub.getHp());
		age.setText(""+ub.getAge());
		
		user.addContent(uid);
		user.addContent(name);
		user.addContent(hp);
		user.addContent(age);
		
		users.addContent(user);
	}
	
	doc.setRootElement(users);

	// xml 출력서식 지정
	XMLOutputter outPutter = new XMLOutputter(Format.getPrettyFormat());
	String xml = outPutter.outputString(doc);

	out.print(xml);
%>