package com.orakgarak.util;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.orakgarak.vo.User;

public class SendMail {
	 public static void sendMail(User user) {
         
	        Properties p = System.getProperties();
	        p.put("mail.smtp.starttls.enable", "true");     // gmail은 무조건 true 고정
	        p.put("mail.smtp.host", "smtp.gmail.com");      // smtp 서버 주소
	        p.put("mail.smtp.auth","true");                 // gmail은 무조건 true 고정
	        p.put("mail.smtp.port", "587");                 // gmail 포트
	           
	        Authenticator auth = new MyAuthentication();
	         
	        //session 생성 및  MimeMessage생성
	        Session session = Session.getDefaultInstance(p, auth);
	        MimeMessage msg = new MimeMessage(session);
	         
	        try{
	            //편지보낸시간
	            msg.setSentDate(new Date());
	             
	            // 이메일 발신자
	            InternetAddress from = new InternetAddress("orakgarak<orakgarak.co.kr@gmail.com>");
	            msg.setFrom(from);
	             
	            // 이메일 수신자
	            InternetAddress to = new InternetAddress(user.getEmail());
	            msg.setRecipient(Message.RecipientType.TO, to);
	             
	            // 이메일 제목
	            msg.setSubject("오락가락 가입 인증 메일", "UTF-8");
	             
	            // 이메일 내용 
	            //msg.setText("<a href='www.orakgarak.co.kr&authkey="+user.getAuthkey()+"'>인증하려면 클릭하세요</a>", "UTF-8");
	            msg.setText("<a href='www.orakgarak.co.kr'>인증하려면 클릭하세요</a>", "UTF-8");
	             
	            // 이메일 헤더 
	            msg.setHeader("content-Type", "text/html");
	             
	            //메일보내기
	            javax.mail.Transport.send(msg);
	             
	        }catch (AddressException addr_e) {
	            addr_e.printStackTrace();
	        }catch (MessagingException msg_e) {
	            msg_e.printStackTrace();
	        }
	    }
	 
	}
	 
	 
	class MyAuthentication extends Authenticator {
	      
	    PasswordAuthentication pa;
	    
	 
	    public MyAuthentication(){
	         
	        String id = "orakgarak.co.kr@gmail.com";       // 구글 ID
	        String pw = "bluebull!";          // 구글 비밀번호
	 
	        // ID와 비밀번호를 입력한다.
	        pa = new PasswordAuthentication(id, pw);
	      
	    }
	 
	    // 시스템에서 사용하는 인증정보
	    public PasswordAuthentication getPasswordAuthentication() {
	        return pa;
	    }
}
