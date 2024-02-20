<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String sender   = request.getParameter("sender");
	String receiver = request.getParameter("receiver");
	String title    = request.getParameter("title");
	String content  = request.getParameter("content");
	
	// Gmail SMTP 서버 설정
	Properties props = new Properties();
	props.put("mail.smtp.host", "smtp.gmail.com");
	props.put("mail.smtp.port", "465");
	props.put("mail.smtp.auth", "true");
	props.put("mail.smtp.ssl.enable", "true");
	props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
	
	// Gmail STMP 세션 생성
	String password = "sktt tzbh lukh orvp"; // 앱 비밀번호
	
	Session gmailSession = Session.getInstance(props, new Authenticator(){
		@Override
		protected PasswordAuthentication getPasswordAuthentication(){
			return new PasswordAuthentication(sender, password);
		}
	});
	
	// 메일 객체 생성 및 설정
	Message message = new MimeMessage(gmailSession);
	message.setFrom(new InternetAddress(sender, "보내는 사람", "UTF-8"));
	message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
	message.setSubject(title);
	message.setContent(content, "text/html;charset=UTF-8");
	
	// 메일 발송
	Transport.send(message);
	
	// 다시 메일 폼 이동
	response.sendRedirect("../3.sendMailTest.jsp");
%>












