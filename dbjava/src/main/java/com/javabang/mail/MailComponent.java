package com.javabang.mail;

import java.io.IOException;
import java.util.Properties;
import java.util.Scanner;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Component;



import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.AddressException;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

@Component
public class MailComponent {
	@Value ("classpath:mailaccount.txt")
	private Resource mailAccount;
	
	private String host = "smtp.naver.com";
	private int port = 465;
	private String serverId = "";
	private String serverPw = "";
	
	private Properties prop = new Properties();
	
	public int sendMail(String email, String content) throws IOException {
		Scanner sc = new Scanner(mailAccount.getFile());
		while(sc.hasNextLine()) {
			String text = sc.nextLine();
			serverId = text.split("/")[0];
			serverPw = text.split("/")[1];
			
		}
		sc.close();
		
		prop.put("mail.smtp.host", host);
		prop.put("mail.smtp.port", port);
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.trust",host);
		
		Session mailSession = Session.getDefaultInstance(prop, new Authenticator() {
			String un = serverId;
			String pw = serverPw;
			
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(un, pw);
			}
			
		});
		mailSession.setDebug(true);
		
		Message mimeMessage = new MimeMessage(mailSession);
		try {
			mimeMessage.setFrom(new InternetAddress(serverId + "@naver.com"));
			mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(email));
			mimeMessage.setSubject("JavaBang 비밀번호 재설정 메일입니다");
			
			String tag = "<pre style=\"%s\">%s</pre>"; 
			String style = "";
			style += "border:1px solid black;";
			style += "padding :10px;";
			style += "font-size:20px;";
			content = String.format(tag,style, content);
			
			mimeMessage.setContent(content,"text/html;charset=utf-8");
			
			Transport.send(mimeMessage);
			return 1;
		} catch(AddressException e) {
			System.out.println("잘못된 주소입니다 !");
			return -1;
		}
		
		catch (MessagingException e) {
			System.out.println("메일전송에 문제가 발생했습니다 !");
			return -2;
		}
	
		
		
	}
}
