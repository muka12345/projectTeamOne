package net.hanmail.muka12345;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import net.hanmail.muka12345.entities.Member;
import net.hanmail.muka12345.service.MemberDao;

@Controller
public class LoginController {
	@Autowired
	Member member;
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@RequestMapping(value = "/emailAuthForm", method = RequestMethod.GET)
	public String emailAuthForm() {
		return "member/email_auth_form";
	}

	@RequestMapping(value = "/emailAuth", method = RequestMethod.POST)
	public String emailAuth(@RequestParam String email) {
		String content = "<a href=http://localhost:8089/muka1234/emailDone?email=" + email + ">[E-mail 인증]</a>";
		sendEmail(email, content);
		return "home";

	}

	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginForm() {
		return "login/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@ModelAttribute Member member, HttpSession session) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);

		Member data = dao.selectOne(member.getEmail());
		if (data != null) {
			if (member.getPassword().equals(data.getPassword())) {
				session.setAttribute("sessionemail", data.getEmail());
				session.setAttribute("sessionname", data.getName());
				session.setAttribute("sessionpassword", data.getPassword());
				session.setAttribute("sessionimage", data.getImagepath());
				session.setAttribute("sessionmemlevel", data.getLevel());
				return "home";

			} else {
				return "login/login_fall";
			}
		} else {
			return "login/login_fall";
		}
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "home";
	}

	@RequestMapping(value = "/login_Fall", method = RequestMethod.GET)
	public String login_Fall() {
		return "login/login_fall";
	}

	@RequestMapping(value = "/loginFallForm", method = RequestMethod.POST)
	public String loginFallForm(@ModelAttribute Member member, HttpSession session) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);

		Member data = dao.selectOne(member.getEmail());
		if (data != null) {
			if (member.getPassword().equals(data.getPassword())) {
				session.setAttribute("sessionemail", data.getEmail());
				session.setAttribute("sessionname", data.getName());
				session.setAttribute("sessionpassword", data.getPassword());
				session.setAttribute("sessionimage", data.getImagepath());
				session.setAttribute("sessionmemlevel", data.getLevel());
				return "home";
			} else {
				return "login/login_fall";
			}
		} else {
			return "login/login_fall";
		}
	}

	@RequestMapping(value = "/findPasswordForm", method = RequestMethod.GET)
	public String findPasswordForm() {
		return "login/find_password_form";
	}

	@RequestMapping(value = "/sendNewPassword", method = RequestMethod.GET)
	public String sendNewPassword(@RequestParam String email) {
		System.out.println("send new password........" + email);
		String temppass = randomNum();
		String content = "<a href=http://localhost:8083/cskygh/newPasswordChange?email=" + email + "&temppass="
				+ temppass + ">[New password : " + temppass + "]</a>";
		sendEmail(email, content);
		return "home";
	}

//	@RequestMapping(value = "/newPasswordChange", method = RequestMethod.GET)
//	public String newPasswordChange(@RequestParam String email, @RequestParam String temppass) {
//		MemberDao dao = sqlSession.getMapper(MemberDao.class);
//		temppass = passwordEncoder.encode(temppass);
//		HashMap hash = new HashMap();
//		hash.put("email", email);
//		hash.put("temppass", temppass);
//		dao.newPasswordChange(hash);
//		return "login/login_finish";
//	}

	private void sendEmail(String email, String content) {
		String host = "smtp.gmail.com";
		String subject = "itschool 인증번호";
		String fromName = "itschool 관리자";
		String from = "muka9875@gmail.com";
		String to1 = email;

		try {
			Properties props = new Properties();
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", host);
			props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port", "587"); // or 465
			props.put("mail.smtp.user", from);
			props.put("mail.smtp.auth", "true");

			Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("muka9875", "cbsqydceyzhvfqly"); // 위 gmail에서 생성된 비밀번호 넣는다

				}
			});
			Message msg = new MimeMessage(mailSession);
			msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName, "UTF-8", "B")));

			InternetAddress[] address1 = { new InternetAddress(to1) };
			msg.setRecipients(Message.RecipientType.TO, address1);
			msg.setSubject(subject);
			msg.setSentDate(new java.util.Date());
			msg.setContent(content, "text/html;charset=euc-kr");
			Transport.send(msg);
			System.out.println("----> success:");
		} catch (Exception e) {
			System.out.println("----> error:" + e.getMessage());
		}
	}

	String randomNum() {
		StringBuffer buffer = new StringBuffer();
		for (int i = 0; i <= 6; i++) {
			int n = (int) (Math.random() * 10);
			buffer.append(n);
		}
		return buffer.toString();
	}

}
