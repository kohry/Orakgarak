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
	        p.put("mail.smtp.starttls.enable", "true");     // gmail�� ������ true ����
	        p.put("mail.smtp.host", "smtp.gmail.com");      // smtp ���� �ּ�
	        p.put("mail.smtp.auth","true");                 // gmail�� ������ true ����
	        p.put("mail.smtp.port", "587");                 // gmail ��Ʈ
	           
	        Authenticator auth = new MyAuthentication();
	         
	        //session ���� ��  MimeMessage����
	        Session session = Session.getDefaultInstance(p, auth);
	        MimeMessage msg = new MimeMessage(session);
	         
	        try{
	            //���������ð�
	            msg.setSentDate(new Date());
	             
	            // �̸��� �߽���
	            InternetAddress from = new InternetAddress("orakgarak<orakgarak.co.kr@gmail.com>");
	            msg.setFrom(from);
	             
	            // �̸��� ������
	            InternetAddress to = new InternetAddress(user.getEmail());
	            msg.setRecipient(Message.RecipientType.TO, to);
	             
	            // �̸��� ����
	            msg.setSubject("�������� ���� ���� ����", "UTF-8");
	             
	            // �̸��� ���� 
	            //msg.setText("<a href='www.orakgarak.co.kr&authkey="+user.getAuthkey()+"'>�����Ϸ��� Ŭ���ϼ���</a>", "UTF-8");
	            msg.setText("<a href='www.orakgarak.co.kr'>�����Ϸ��� Ŭ���ϼ���</a>", "UTF-8");
	             
	            // �̸��� ��� 
	            msg.setHeader("content-Type", "text/html");
	             
	            //���Ϻ�����
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
	         
	        String id = "orakgarak.co.kr@gmail.com";       // ���� ID
	        String pw = "bluebull!";          // ���� ��й�ȣ
	 
	        // ID�� ��й�ȣ�� �Է��Ѵ�.
	        pa = new PasswordAuthentication(id, pw);
	      
	    }
	 
	    // �ý��ۿ��� ����ϴ� ��������
	    public PasswordAuthentication getPasswordAuthentication() {
	        return pa;
	    }
}
