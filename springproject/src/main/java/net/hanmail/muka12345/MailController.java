package net.hanmail.muka12345;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import net.hanmail.muka12345.entities.Emailbox;
import net.hanmail.muka12345.entities.Member;
import net.hanmail.muka12345.service.EmailDao;
import net.hanmail.muka12345.service.MemberDao;

@Controller
public class MailController {
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	Emailbox emailbox;
	@Autowired
	Member member;

	static String find;

//메일작성
	@RequestMapping(value = "/mailInsertForm", method = RequestMethod.GET)
	public String mailInsertForm() {
		return "mail/mail_insert";
	}

	@RequestMapping(value = "/mailInsert", method = RequestMethod.POST)
	public String mailInsert(Model model, @ModelAttribute Emailbox emailbox, @RequestParam CommonsMultipartFile m_file,
			HttpServletRequest request) {
		EmailDao dao = sqlSession.getMapper(EmailDao.class);
		String path = "D:/NCSDEEPSPRINGSOURCE/springproject/src/main/webapp/resources/upload_attachs/";
		String stremail = emailbox.getM_fromemail();
		String cutemail = stremail.substring(0, stremail.indexOf("@"));
		String realpath = "resources/upload_attachs/";
		String originalname = m_file.getOriginalFilename();

		String filename = cutemail + "_" + originalname;

		if (!originalname.equals("")) {
			try {
				byte[] bytes = m_file.getBytes();
				BufferedOutputStream output = new BufferedOutputStream(new FileOutputStream(path + filename));
				output.write(bytes);
				output.flush();
				output.close();
				emailbox.setM_attach(realpath + filename);
			} catch (Exception e) {
				System.out.println(e.getMessage());

			}
		} else if (originalname.equals("")) {
			emailbox.setM_attach("N");
			emailbox.setM_filesize("0");
		}
		SimpleDateFormat df = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분 ss초");
		Date date = new Date();
		String today = df.format(date);
		emailbox.setM_date(today);
		int sqlresult = dao.emailsend(emailbox);
		String msg = "발송되지 않았습니다.";
		if (sqlresult > 0) {
			msg = "발송되었습니다";
			model.addAttribute("title", "메일 발송 결과");
			model.addAttribute("msg", msg);
		} else {
			model.addAttribute("title", "메일 발송 실패");
			model.addAttribute("msg", msg);
		}

		return "mail/mail_window_result";

	}

	// 임시저장
	@RequestMapping(value = "/temporaryMailInsert", method = RequestMethod.POST)
	public String temporaryMailInsert(Model model, @ModelAttribute Emailbox emailbox,
			@RequestParam CommonsMultipartFile m_file, HttpServletRequest request) {
		EmailDao dao = sqlSession.getMapper(EmailDao.class);
		String path = "D:/NCSDEEPSPRINGSOURCE/springproject/src/main/webapp/resources/upload_attachs/";
		String stremail = emailbox.getM_fromemail();
		String cutemail = stremail.substring(0, stremail.indexOf("@"));
		String realpath = "resources/upload_attachs/";
		String originalname = m_file.getOriginalFilename();

		String filename = cutemail + "_" + originalname;

		if (!originalname.equals("")) {
			try {
				byte[] bytes = m_file.getBytes();
				BufferedOutputStream output = new BufferedOutputStream(new FileOutputStream(path + filename));
				output.write(bytes);
				output.flush();
				output.close();
				emailbox.setM_attach(realpath + filename);
			} catch (Exception e) {
				System.out.println(e.getMessage());

			}
		} else if (originalname.equals("")) {
			emailbox.setM_attach("N");
			emailbox.setM_filesize("0");
		}
		SimpleDateFormat df = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분 ss초");
		Date date = new Date();
		String today = df.format(date);
		emailbox.setM_date(today);
		int sqlresult = dao.emailTemporary(emailbox);
		String msg = "메일이 저장되지 않았습니다.";
		if (sqlresult > 0) {
			msg = "임시 저장되었습니다";
			model.addAttribute("title", "임시 저장 결과");
			model.addAttribute("msg", msg);

		} else {
			model.addAttribute("title", "임시 저장 실패!");
			model.addAttribute("msg", msg);

		}

		return "mail/mail_window_result";
	}

	@RequestMapping(value = "/mailboxDownload", method = RequestMethod.GET)
	public ModelAndView mailboxDownload(@RequestParam String m_attach, HttpServletRequest request) {
		try {
			m_attach = URLDecoder.decode(m_attach, "utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		File file = new File(m_attach);
		String path = "D:/NCSDEEPSPRINGSOURCE/springproject/src/main/webapp/resources/upload_attachs/";
		String originalname = file.getName();

		File realfile = new File(path + originalname);
		return new ModelAndView("download", "downloadFile", realfile);
	}

//메일내용
	@RequestMapping(value = "/mailDetail", method = RequestMethod.GET)
	public String mailDetail(Model model, @RequestParam int m_seq, HttpSession session) {
		EmailDao dao = sqlSession.getMapper(EmailDao.class);
		Emailbox emailbox = dao.selectOne(m_seq);
		String login = (String) session.getAttribute("sessionemail");
		if (emailbox.getM_toemail().equals(login)) {
			dao.showHit(m_seq);

		}

		String attach = emailbox.getM_attach();
		if (!attach.equals("N")) {
			File file = new File(emailbox.getM_attach());
			String m_filename = file.getName();
			emailbox.setM_filename(m_filename);
		} else if (attach.equals("N")) {
			emailbox.setM_filename("0");

		}

		model.addAttribute("emailbox", emailbox);

		return "mail/mail_detail";
	}

	@RequestMapping(value = "/mailTemporaryDetail", method = RequestMethod.GET)
	public String mailTemporaryDetail(Model model, @RequestParam int m_seq, HttpSession session) {
		EmailDao dao = sqlSession.getMapper(EmailDao.class);

		Emailbox emailbox = dao.selectOne(m_seq);
		if (emailbox.getM_fromemail().equals(session.getAttribute("sessionemail"))) {
			dao.showHit(m_seq);

		}
//		String attach = emailbox.getM_attach();
//		if (!attach.equals("N")) {
//			File file = new File(emailbox.getM_attach());
//			String m_filename = file.getName();
//			emailbox.setM_filename(m_filename);
//		} else if (attach.equals("N")) {
//			emailbox.setM_filename("0");
//
//		}
		model.addAttribute("emailbox", emailbox);

		return "mail/mail_temporary_detail";
	}

	@RequestMapping(value = "/mailTemporarysend", method = RequestMethod.POST)
	public String mailTemporarysend(Model model, @ModelAttribute Emailbox emailbox,
			@RequestParam CommonsMultipartFile m_file, HttpServletRequest request) {
		EmailDao dao = sqlSession.getMapper(EmailDao.class);
		String path = "D:/NCSDEEPSPRINGSOURCE/springproject/src/main/webapp/resources/upload_attachs/";
		String stremail = emailbox.getM_fromemail();
		String cutemail = stremail.substring(0, stremail.indexOf("@"));
		String realpath = "resources/upload_attachs/";
		String originalname = m_file.getOriginalFilename();

		String filename = cutemail + "_" + originalname;

		if (!originalname.equals("")) {
			try {
				byte[] bytes = m_file.getBytes();
				BufferedOutputStream output = new BufferedOutputStream(new FileOutputStream(path + filename));
				output.write(bytes);
				output.flush();
				output.close();
				emailbox.setM_attach(realpath + filename);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		} else if (originalname.equals("")) {
			emailbox.setM_attach("N");
			emailbox.setM_filesize("0");
		}
//		} else {
//			if (!data.getM_attach().equals("")) {
//				data.setM_attach(data.getM_attach());
//
//			}
//		}

		SimpleDateFormat df = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분 ss초");
		Date date = new Date();
		String today = df.format(date);
		emailbox.setM_date(today);
		int sqlresult = dao.updateEmail(emailbox);

		String msg = "발송되지 않았습니다.";
		if (sqlresult > 0) {
			msg = "발송 되었습니다";
			model.addAttribute("title", "임시메일 발송 결과");
			model.addAttribute("msg", msg);

		} else {
			model.addAttribute("title", "임시메일 발송 실패!");
			model.addAttribute("msg", msg);

		}

		return "mail/mail_window_result";
	}

	@RequestMapping(value = "/temporaryUpdate", method = RequestMethod.POST)
	public String temporaryUpdate(Model model, @ModelAttribute Emailbox emailbox,
			@RequestParam CommonsMultipartFile m_file, HttpServletRequest request) {
		EmailDao dao = sqlSession.getMapper(EmailDao.class);
		String path = "D:/NCSDEEPSPRINGSOURCE/springproject/src/main/webapp/resources/upload_attachs/";
		String stremail = emailbox.getM_fromemail();
		String cutemail = stremail.substring(0, stremail.indexOf("@"));
		String realpath = "resources/upload_attachs/";
		String originalname = m_file.getOriginalFilename();

		String filename = cutemail + "_" + originalname;

		if (!originalname.equals("")) {
			try {
				byte[] bytes = m_file.getBytes();
				BufferedOutputStream output = new BufferedOutputStream(new FileOutputStream(path + filename));
				output.write(bytes);
				output.flush();
				output.close();
				emailbox.setM_attach(realpath + filename);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		} else if (originalname.equals("")) {
			emailbox.setM_attach("N");
			emailbox.setM_filesize("0");
		}
//		} else {
//			if (!data.getM_attach().equals("")) {
//				data.setM_attach(data.getM_attach());
//
//			}
//		}

		SimpleDateFormat df = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분 ss초");
		Date date = new Date();
		String today = df.format(date);
		emailbox.setM_date(today);
		int sqlresult = dao.updateTemporary(emailbox);
		String msg = "저장되지 않았습니다.";
		if (sqlresult > 0) {
			msg = "저장 되었습니다";
			model.addAttribute("title", "임시 저장 결과");
			model.addAttribute("msg", msg);

		} else {
			model.addAttribute("title", "임시 저장 실패!");
			model.addAttribute("msg", msg);
		}
		return "mail/mail_window_result";
	}

//받은메일함, 전자메일누를시 바로 뜸
	@RequestMapping(value = "/mailboxInputForm", method = RequestMethod.GET)
	public String mailboxInputForm(Model model, @RequestParam(defaultValue = "m_title") String selectfind,
			@RequestParam(defaultValue = "") String find, @RequestParam(defaultValue = "5") int pageSize,
			HttpSession session) {
		EmailDao dao = sqlSession.getMapper(EmailDao.class);

		int startrow = (1 - 1) * pageSize;
		int absPage = 1;
		String login = (String) session.getAttribute("sessionemail");

		emailbox.setSessionemail(login);
		emailbox.setSelectfind(selectfind);
		emailbox.setFind(find);
		emailbox.setStartrow(startrow);
		emailbox.setEndrow(pageSize);
		int rowCount = dao.inputMailCount(emailbox);

		ArrayList<Emailbox> emailboxs = dao.inputMailPageList(emailbox);
		if (rowCount % pageSize == 0) {
			absPage = 0;
		}
		int pageCount = rowCount / pageSize + absPage;
		int pages[] = new int[pageCount];
		for (int i = 0; i < pages.length; i++) {
			pages[i] = i + 1;
		}
		model.addAttribute("rowCount", rowCount);
		model.addAttribute("emailboxs", emailboxs);
		model.addAttribute("pages", pages);
		model.addAttribute("find", find);
		if (rowCount == 0) {
			String msg = "받은 이메일이 없습니다.";
			model.addAttribute("msg", msg);
		}

		return "mail/mail_mailbox_input";

	}

	@RequestMapping(value = "/mailboxPageSelected", method = RequestMethod.GET)
	public String mailboxPageSelected(Model model, @RequestParam(defaultValue = "all") String selectfind,
			@RequestParam int page, @RequestParam String find, @RequestParam(defaultValue = "5") int pageSize,
			HttpSession session) {
		EmailDao dao = sqlSession.getMapper(EmailDao.class);

		int startrow = (page - 1) * pageSize;
		int absPage = 1;
		String login = (String) session.getAttribute("sessionemail");
		emailbox.setSessionemail(login);
		emailbox.setSelectfind(selectfind);
		emailbox.setFind(find);
		emailbox.setStartrow(startrow);
		emailbox.setEndrow(pageSize);
		int rowCount = dao.inputMailCount(emailbox);

		ArrayList<Emailbox> emailboxs = dao.inputMailPageList(emailbox);
		if (rowCount % pageSize == 0) {
			absPage = 0;
		}
		int pageCount = rowCount / pageSize + absPage;
		int pages[] = new int[pageCount];
		for (int i = 0; i < pages.length; i++) {
			pages[i] = i + 1;
		}
		model.addAttribute("rowCount", rowCount);
		model.addAttribute("emailboxs", emailboxs);
		model.addAttribute("pages", pages);
		model.addAttribute("find", find);
		if (rowCount == 0) {
			String msg = "검색 결과가 없습니다";

			model.addAttribute("msg", msg);
		}
		return "mail/mail_mailbox_input";

	}

//발신메일함
	@RequestMapping(value = "/mailboxOutputForm", method = RequestMethod.GET)
	public String mailboxOutputForm(Model model, @RequestParam(defaultValue = "m_title") String selectfind,
			@RequestParam(defaultValue = "") String find, @RequestParam(defaultValue = "5") int pageSize,
			HttpSession session) {
		EmailDao dao = sqlSession.getMapper(EmailDao.class);

		int startrow = (1 - 1) * pageSize;
		int absPage = 1;
		String login = (String) session.getAttribute("sessionemail");
		emailbox.setSessionemail(login);
		emailbox.setSelectfind(selectfind);
		emailbox.setFind(find);
		emailbox.setStartrow(startrow);
		emailbox.setEndrow(pageSize);
		int rowCount = dao.outputMailCount(emailbox);

		ArrayList<Emailbox> emailboxs = dao.outputMailList(emailbox);

		if (rowCount % pageSize == 0) {
			absPage = 0;
		}
		int pageCount = rowCount / pageSize + absPage;
		int pages[] = new int[pageCount];
		for (int i = 0; i < pages.length; i++) {
			pages[i] = i + 1;
		}
		model.addAttribute("rowCount", rowCount);
		model.addAttribute("emailboxs", emailboxs);
		model.addAttribute("pages", pages);
		model.addAttribute("find", find);
		if (rowCount == 0) {
			String msg = "보낸 이메일이  없습니다.";
			model.addAttribute("msg", msg);
		}

		return "mail/mail_mailbox_output";
	}

	@RequestMapping(value = "/mailboxOutputSelected", method = RequestMethod.GET)
	public String mailboxOutputSelected(Model model, @RequestParam(defaultValue = "all") String selectfind,
			@RequestParam int page, @RequestParam String find, @RequestParam(defaultValue = "5") int pageSize,
			HttpSession session) {
		EmailDao dao = sqlSession.getMapper(EmailDao.class);

		int startrow = (page - 1) * pageSize;
		int absPage = 1;

		String login = (String) session.getAttribute("sessionemail");
		emailbox.setSessionemail(login);
		emailbox.setSelectfind(selectfind);
		emailbox.setFind(find);
		emailbox.setStartrow(startrow);
		emailbox.setEndrow(pageSize);
		int rowCount = dao.outputMailCount(emailbox);

		ArrayList<Emailbox> emailboxs = dao.outputMailList(emailbox);

		if (rowCount % pageSize == 0) {
			absPage = 0;
		}
		int pageCount = rowCount / pageSize + absPage;
		int pages[] = new int[pageCount];
		for (int i = 0; i < pages.length; i++) {
			pages[i] = i + 1;
		}
		model.addAttribute("rowCount", rowCount);
		model.addAttribute("emailboxs", emailboxs);
		model.addAttribute("pages", pages);
		model.addAttribute("find", find);
		if (rowCount == 0) {
			String msg = "검색 결과가 없습니다";

			model.addAttribute("msg", msg);
		}
		return "mail/mail_mailbox_output";
	}

//삭제메일함
	@RequestMapping(value = "/mailboxDeleteForm", method = RequestMethod.GET)
	public String mailboxDeleteForm(Model model, @RequestParam(defaultValue = "m_title") String selectfind,
			@RequestParam(defaultValue = "") String find, @RequestParam(defaultValue = "5") int pageSize,
			HttpSession session) {
		EmailDao dao = sqlSession.getMapper(EmailDao.class);

		int startrow = (1 - 1) * pageSize;
		int absPage = 1;

		String login = (String) session.getAttribute("sessionemail");
		emailbox.setSessionemail(login);
		emailbox.setSelectfind(selectfind);
		emailbox.setFind(find);
		emailbox.setStartrow(startrow);
		emailbox.setEndrow(pageSize);
		int rowCount = dao.deleteMailCount(emailbox);

		ArrayList<Emailbox> emailboxs = dao.deleteMailList(emailbox);
		if (rowCount % pageSize == 0) {
			absPage = 0;
		}
		int pageCount = rowCount / pageSize + absPage;
		int pages[] = new int[pageCount];
		for (int i = 0; i < pages.length; i++) {
			pages[i] = i + 1;
		}
		model.addAttribute("rowCount", rowCount);
		model.addAttribute("emailboxs", emailboxs);
		model.addAttribute("pages", pages);
		model.addAttribute("find", find);
		if (rowCount == 0) {
			String msg = "삭제한 메일이 없습니다.";
			model.addAttribute("msg", msg);

		}
		return "mail/mail_mailbox_delete";
	}

	@RequestMapping(value = "/mailboxDeleteSelected", method = RequestMethod.GET)
	public String mailboxDeleteSelected(Model model, @RequestParam(defaultValue = "all") String selectfind,
			@RequestParam int page, @RequestParam String find, @RequestParam(defaultValue = "5") int pageSize,
			HttpSession session) {
		EmailDao dao = sqlSession.getMapper(EmailDao.class);

		int startrow = (page - 1) * pageSize;
		int absPage = 1;

		String login = (String) session.getAttribute("sessionemail");
		emailbox.setSessionemail(login);
		emailbox.setSelectfind(selectfind);
		emailbox.setFind(find);
		emailbox.setStartrow(startrow);
		emailbox.setEndrow(pageSize);
		int rowCount = dao.deleteMailCount(emailbox);

		ArrayList<Emailbox> emailboxs = dao.deleteMailList(emailbox);

		if (rowCount % pageSize == 0) {
			absPage = 0;
		}
		int pageCount = rowCount / pageSize + absPage;
		int pages[] = new int[pageCount];
		for (int i = 0; i < pages.length; i++) {
			pages[i] = i + 1;
		}
		model.addAttribute("rowCount", rowCount);
		model.addAttribute("emailboxs", emailboxs);
		model.addAttribute("pages", pages);
		model.addAttribute("find", find);
		if (rowCount == 0) {
			String msg = "검색 결과가 없습니다.";

			model.addAttribute("msg", msg);
		}
		return "mail/mail_mailbox_delete";
	}

//스펨메일함
	@RequestMapping(value = "/mailboxSpamForm", method = RequestMethod.GET)
	public String mailboxSpamForm(Model model, @RequestParam(defaultValue = "m_title") String selectfind,
			@RequestParam(defaultValue = "") String find, @RequestParam(defaultValue = "5") int pageSize,
			HttpSession session) {
		EmailDao dao = sqlSession.getMapper(EmailDao.class);

		int startrow = (1 - 1) * pageSize;
		int absPage = 1;

		String login = (String) session.getAttribute("sessionemail");
		emailbox.setSessionemail(login);
		emailbox.setSelectfind(selectfind);
		emailbox.setFind(find);
		emailbox.setStartrow(startrow);
		emailbox.setEndrow(pageSize);
		int rowCount = dao.spamMailCount(emailbox);

		ArrayList<Emailbox> emailboxs = dao.spamMailList(emailbox);

		if (rowCount % pageSize == 0) {
			absPage = 0;
		}
		int pageCount = rowCount / pageSize + absPage;
		int pages[] = new int[pageCount];
		for (int i = 0; i < pages.length; i++) {
			pages[i] = i + 1;
		}
		model.addAttribute("rowCount", rowCount);
		model.addAttribute("emailboxs", emailboxs);
		model.addAttribute("pages", pages);
		model.addAttribute("find", find);
		if (rowCount == 0) {
			String msg = "스펨 메일이 없습니다.";
			model.addAttribute("msg", msg);

		}

		return "mail/mail_mailbox_spam";

	}

	@RequestMapping(value = "/mailboxSpamSelected", method = RequestMethod.GET)
	public String mailboxSpamSelected(Model model, @RequestParam(defaultValue = "all") String selectfind,
			@RequestParam int page, @RequestParam String find, @RequestParam(defaultValue = "5") int pageSize,
			HttpSession session) {
		EmailDao dao = sqlSession.getMapper(EmailDao.class);

		int startrow = (page - 1) * pageSize;
		int absPage = 1;

		String login = (String) session.getAttribute("sessionemail");
		emailbox.setSessionemail(login);
		emailbox.setSelectfind(selectfind);
		emailbox.setFind(find);
		emailbox.setStartrow(startrow);
		emailbox.setEndrow(pageSize);
		int rowCount = dao.spamMailCount(emailbox);

		ArrayList<Emailbox> emailboxs = dao.spamMailList(emailbox);

		if (rowCount % pageSize == 0) {
			absPage = 0;
		}
		int pageCount = rowCount / pageSize + absPage;
		int pages[] = new int[pageCount];
		for (int i = 0; i < pages.length; i++) {
			pages[i] = i + 1;
		}
		model.addAttribute("rowCount", rowCount);
		model.addAttribute("emailboxs", emailboxs);
		model.addAttribute("pages", pages);
		model.addAttribute("find", find);
		if (rowCount == 0) {
			String msg = "검색 결과가 없습니다";

			model.addAttribute("msg", msg);
		}
		return "mail/mail_mailbox_spam";

	}

//임시메일함
	@RequestMapping(value = "/mailboxTemporaryForm", method = RequestMethod.GET)
	public String mailboxTemporaryForm(Model model, @RequestParam(defaultValue = "m_title") String selectfind,
			@RequestParam(defaultValue = "") String find, @RequestParam(defaultValue = "5") int pageSize,
			HttpSession session) {
		EmailDao dao = sqlSession.getMapper(EmailDao.class);

		int startrow = (1 - 1) * pageSize;
		int absPage = 1;

		String login = (String) session.getAttribute("sessionemail");
		emailbox.setSessionemail(login);
		emailbox.setSelectfind(selectfind);
		emailbox.setFind(find);
		emailbox.setStartrow(startrow);
		emailbox.setEndrow(pageSize);
		int rowCount = dao.temporaryMailCount(emailbox);

		ArrayList<Emailbox> emailboxs = dao.temporaryMailList(emailbox);

		if (rowCount % pageSize == 0) {
			absPage = 0;
		}
		int pageCount = rowCount / pageSize + absPage;
		int pages[] = new int[pageCount];
		for (int i = 0; i < pages.length; i++) {
			pages[i] = i + 1;
		}
		model.addAttribute("rowCount", rowCount);
		model.addAttribute("emailboxs", emailboxs);
		model.addAttribute("pages", pages);
		model.addAttribute("find", find);
		if (rowCount == 0) {
			String msg = "임시 저장된 메일이 없습니다.";
			model.addAttribute("msg", msg);
		}
		return "mail/mail_mailbox_temporary";
	}

	@RequestMapping(value = "/mailboxTemporarySelected", method = RequestMethod.GET)
	public String mailboxTemporarySelected(Model model, @RequestParam(defaultValue = "all") String selectfind,
			@RequestParam int page, @RequestParam String find, @RequestParam(defaultValue = "5") int pageSize,
			HttpSession session) {
		EmailDao dao = sqlSession.getMapper(EmailDao.class);

		int startrow = (page - 1) * pageSize;
		int absPage = 1;

		String login = (String) session.getAttribute("sessionemail");
		emailbox.setSessionemail(login);
		emailbox.setSelectfind(selectfind);
		emailbox.setFind(find);
		emailbox.setStartrow(startrow);
		emailbox.setEndrow(pageSize);
		int rowCount = dao.temporaryMailCount(emailbox);
		ArrayList<Emailbox> emailboxs = dao.temporaryMailList(emailbox);

		if (rowCount % pageSize == 0) {
			absPage = 0;
		}
		int pageCount = rowCount / pageSize + absPage;
		int pages[] = new int[pageCount];
		for (int i = 0; i < pages.length; i++) {
			pages[i] = i + 1;
		}

		model.addAttribute("rowCount", rowCount);
		model.addAttribute("emailboxs", emailboxs);
		model.addAttribute("pages", pages);
		model.addAttribute("find", find);
		if (rowCount == 0) {
			String msg = "검색 결과가 없습니다";
			model.addAttribute("msg", msg);

		}
		return "mail/mail_mailbox_temporary";

	}

	// 중요메일함
	@RequestMapping(value = "/mailboxSaveForm", method = RequestMethod.GET)
	public String mailboxSaveForm(Model model, @RequestParam(defaultValue = "m_title") String selectfind,
			@RequestParam(defaultValue = "") String find, @RequestParam(defaultValue = "5") int pageSize,
			HttpSession session) {
		EmailDao dao = sqlSession.getMapper(EmailDao.class);

		int startrow = (1 - 1) * pageSize;
		int absPage = 1;

		String login = (String) session.getAttribute("sessionemail");
		emailbox.setSessionemail(login);
		emailbox.setSelectfind(selectfind);
		emailbox.setFind(find);
		emailbox.setStartrow(startrow);
		emailbox.setEndrow(pageSize);
		int rowCount = dao.saveMailCount(emailbox);
		ArrayList<Emailbox> emailboxs = dao.saveMailList(emailbox);

		if (rowCount % pageSize == 0) {
			absPage = 0;
		}
		int pageCount = rowCount / pageSize + absPage;
		int pages[] = new int[pageCount];
		for (int i = 0; i < pages.length; i++) {
			pages[i] = i + 1;
		}
		model.addAttribute("rowCount", rowCount);
		model.addAttribute("emailboxs", emailboxs);
		model.addAttribute("pages", pages);
		model.addAttribute("find", find);
		if (rowCount == 0) {
			String msg = "저장된 메일이 없습니다.";
			model.addAttribute("msg", msg);
		}
		return "mail/mail_mailbox_save";
	}

	@RequestMapping(value = "/mailboxSaveSelected", method = RequestMethod.GET)
	public String mailboxSaveSelected(Model model, @RequestParam(defaultValue = "all") String selectfind,
			@RequestParam int page, @RequestParam String find, @RequestParam(defaultValue = "5") int pageSize,
			HttpSession session) {
		EmailDao dao = sqlSession.getMapper(EmailDao.class);

		int startrow = (page - 1) * pageSize;
		int absPage = 1;

		String login = (String) session.getAttribute("sessionemail");
		emailbox.setSessionemail(login);
		emailbox.setSelectfind(selectfind);
		emailbox.setFind(find);
		emailbox.setStartrow(startrow);
		emailbox.setEndrow(pageSize);
		int rowCount = dao.saveMailCount(emailbox);
		ArrayList<Emailbox> emailboxs = dao.saveMailList(emailbox);

		if (rowCount % pageSize == 0) {
			absPage = 0;
		}
		int pageCount = rowCount / pageSize + absPage;
		int pages[] = new int[pageCount];
		for (int i = 0; i < pages.length; i++) {
			pages[i] = i + 1;
		}

		model.addAttribute("rowCount", rowCount);
		model.addAttribute("emailboxs", emailboxs);
		model.addAttribute("pages", pages);
		model.addAttribute("find", find);
		if (rowCount == 0) {
			String msg = "검색 결과가 없습니다";
			model.addAttribute("msg", msg);

		}
		return "mail/mail_mailbox_save";

	}

//이메일답변, 이메일끼리 종속관계가 아니므로  그냥 insert함
	@RequestMapping(value = "/mailReplyForm", method = RequestMethod.GET)
	public String mailReplyForm(Model model, @RequestParam int m_seq, HttpSession session) {
		EmailDao dao = sqlSession.getMapper(EmailDao.class);
		Emailbox emailbox = dao.selectOne(m_seq);
		String login = (String) session.getAttribute("sessionemail");
		String name = (String) session.getAttribute("sessionname");
		if (emailbox.getM_fromemail().equals(login)) {
			emailbox.setM_toemail(login);
			emailbox.setM_toname(name);
		}
		model.addAttribute("emailbox", emailbox);
		return "mail/mail_reply";
	}

	@RequestMapping(value = "/mailReply", method = RequestMethod.POST)
	public String mailReply(Model model, @ModelAttribute Emailbox emailbox, @RequestParam CommonsMultipartFile m_file,
			HttpServletRequest request) {
		EmailDao dao = sqlSession.getMapper(EmailDao.class);
		String path = "D:/NCSDEEPSPRINGSOURCE/springproject/src/main/webapp/resources/upload_attachs/";
		String stremail = emailbox.getM_fromemail();
		String cutemail = stremail.substring(0, stremail.indexOf("@"));
		String realpath = "resources/upload_attachs/";
		String originalname = m_file.getOriginalFilename();

		String filename = cutemail + "_" + originalname;

		if (!originalname.equals("")) {
			try {
				byte[] bytes = m_file.getBytes();
				BufferedOutputStream output = new BufferedOutputStream(new FileOutputStream(path + filename));
				output.write(bytes);
				output.flush();
				output.close();
				emailbox.setM_attach(realpath + filename);
			} catch (Exception e) {
				System.out.println(e.getMessage());

			}
		} else if (originalname.equals("")) {
			emailbox.setM_attach("N");
			emailbox.setM_filesize("0");
		}
		SimpleDateFormat df = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분 ss초");
		Date date = new Date();
		String today = df.format(date);
		emailbox.setM_date(today);
		int sqlresult = dao.emailsend(emailbox);
		String msg = "발송되지 않았습니다.";
		if (sqlresult > 0) {
			msg = "발송되었습니다";
			model.addAttribute("title", "답변 메일 발송");
			model.addAttribute("msg", msg);

		} else {
			model.addAttribute("title", "메일 발송 실패");
			model.addAttribute("msg", msg);

		}

		return "mail/mail_window_result";
	}

	// FW 작성하기,fw가 종속되지 않으므로 그냥 insert와 과정같음
	@RequestMapping(value = "/mailForwardForm", method = RequestMethod.GET)
	public String mailForwardForm(Model model, @RequestParam int m_seq) {
		EmailDao dao = sqlSession.getMapper(EmailDao.class);
		Emailbox emailbox = dao.selectOne(m_seq);

		model.addAttribute("emailbox", emailbox);
		return "mail/mail_forward";
	}

	@RequestMapping(value = "/mailForward", method = RequestMethod.POST)
	public String mailForward(Model model, @ModelAttribute Emailbox emailbox, @RequestParam CommonsMultipartFile m_file,
			HttpServletRequest request) {
		EmailDao dao = sqlSession.getMapper(EmailDao.class);
		String path = "D:/NCSDEEPSPRINGSOURCE/springproject/src/main/webapp/resources/upload_attachs/";
		String stremail = emailbox.getM_fromemail();
		String cutemail = stremail.substring(0, stremail.indexOf("@"));
		String realpath = "resources/upload_attachs/";
		String originalname = m_file.getOriginalFilename();

		String filename = cutemail + "_" + originalname;

		if (!originalname.equals("")) {
			try {
				byte[] bytes = m_file.getBytes();
				BufferedOutputStream output = new BufferedOutputStream(new FileOutputStream(path + filename));
				output.write(bytes);
				output.flush();
				output.close();
				emailbox.setM_attach(realpath + filename);
			} catch (Exception e) {
				System.out.println(e.getMessage());

			}
		} else if (originalname.equals("")) {
			emailbox.setM_attach("N");
			emailbox.setM_filesize("0");
		}
		SimpleDateFormat df = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분 ss초");
		Date date = new Date();
		String today = df.format(date);
		emailbox.setM_date(today);
		int sqlresult = dao.emailsend(emailbox);
		String msg = "발송되지 않았습니다.";
		if (sqlresult > 0) {
			msg = "발송되었습니다";
			model.addAttribute("title", "전달 메일 전송");
			model.addAttribute("msg", msg);

		} else {
			model.addAttribute("title", "전달 메일 발송 실패");
			model.addAttribute("msg", msg);

		}

		return "mail/mail_window_result";
	}

//받은메일함->스펨메일함 ajax
	@RequestMapping(value = "/mailSpamUpdate", method = RequestMethod.POST)
	@ResponseBody
	public void mailSpamUpdate(int m_seq) {
		EmailDao dao = sqlSession.getMapper(EmailDao.class);
		Emailbox emailbox = dao.selectOne(m_seq);
		dao.spamMailMove(emailbox);

	}

//스펨메일함->받은메일함 ajax
	@RequestMapping(value = "/mailSpamSave", method = RequestMethod.POST)
	@ResponseBody
	public void mailSpamSave(int m_seq) {
		EmailDao dao = sqlSession.getMapper(EmailDao.class);
		Emailbox emailbox = dao.selectOne(m_seq);
		dao.mailMoveSpam(emailbox);

	}

	@RequestMapping(value = "/mailSaveUpdate", method = RequestMethod.POST)
	@ResponseBody
	public void mailSaveUpdate(int m_seq) {
		EmailDao dao = sqlSession.getMapper(EmailDao.class);
		Emailbox emailbox = dao.selectOne(m_seq);
		dao.mailSaveUpdate(emailbox);
	}

	@RequestMapping(value = "/saveMailMove", method = RequestMethod.POST)
	@ResponseBody
	public void saveMailMove(int m_seq) {
		EmailDao dao = sqlSession.getMapper(EmailDao.class);
		Emailbox emailbox = dao.selectOne(m_seq);
		dao.saveMailMove(emailbox);
	}

//받은메일함 및 보낸메일함->삭제메일함 ajax
	@RequestMapping(value = "/mailDeleteUpdate", method = RequestMethod.POST)
	@ResponseBody
	public void emailDeleteMove(int m_seq) {
		EmailDao dao = sqlSession.getMapper(EmailDao.class);
		Emailbox emailbox = dao.selectOne(m_seq);
		dao.deleteMailMove(emailbox);
	}

//삭제메일함에서 보낸메일함 및 받은메일함으로 보내는 ajax
	@RequestMapping(value = "/mailDeleteSave", method = RequestMethod.POST)
	@ResponseBody
	public void emailMoveDelete(int m_seq) {
		EmailDao dao = sqlSession.getMapper(EmailDao.class);
		Emailbox emailbox = dao.selectOne(m_seq);

		dao.mailMoveDelete(emailbox);
	}

//detail에서 삭제메일함으로 이동
	@RequestMapping(value = "/mailDetailMove", method = RequestMethod.GET)
	public String mailDetailMove(Model model, @RequestParam int m_seq) {
		EmailDao dao = sqlSession.getMapper(EmailDao.class);
		Emailbox emailbox = dao.selectOne(m_seq);
		dao.deleteMailMove(emailbox);
		String title = "이메일 삭제 완료";
		String msg = "삭제 메일함으로 이동되었습니다.";
		model.addAttribute("title", title);
		model.addAttribute("msg", msg);
		return "mail/mail_mailbox_result";
	}

//임시메일은 바로 삭제 가능
	@RequestMapping(value = "/mailTemporaryDelete", method = RequestMethod.GET)
	public String mailTemporaryDelete(Model model, @RequestParam int m_seq) {
		EmailDao dao = sqlSession.getMapper(EmailDao.class);
		String msg = "삭제되지 않았습니다.";
		String title = "임시메일 삭제 실패";
		int result = dao.deleteEmail(m_seq);
		if (result > 0) {
			msg = "삭제 되었습니다.";
			title = "임시메일 삭제 완료";
		}
		model.addAttribute("title", title);
		model.addAttribute("msg", msg);
		return "mail/mail_window_result";
	}

	// 삭제메일함에서 삭제
	@RequestMapping(value = "/mailDelete", method = RequestMethod.POST)
	@ResponseBody
	public void mailDelete(int m_seq, HttpSession session) {
		EmailDao dao = sqlSession.getMapper(EmailDao.class);
		Emailbox emailbox = dao.selectOne(m_seq);
		String login = (String) session.getAttribute("sessionemail");
		if (emailbox.getM_fromemail().equals(login)) {
			dao.mailSentdel(emailbox);
			dao.mailMoveDelete(emailbox);
		} else if (emailbox.getM_toemail().equals(login) || emailbox.getM_cc().equals(login)) {
			dao.mailRecvdel(emailbox);
			dao.mailMoveDelete(emailbox);
		}
		String recvedl = emailbox.getM_recvdel();
		String sentdel = emailbox.getM_sentdel();

		if (recvedl.equals("Y") || sentdel.equals("Y")) {
			dao.deleteEmail(emailbox.getM_seq());

		}
	}

	@RequestMapping(value = "/mailDetailDelete", method = RequestMethod.GET)
	public String mailDetailDelete(int m_seq, HttpSession session, Model model) {
		EmailDao dao = sqlSession.getMapper(EmailDao.class);
		Emailbox emailbox = dao.selectOne(m_seq);
		String login = (String) session.getAttribute("sessionemail");
		if (emailbox.getM_fromemail().equals(login)) {
			dao.mailSentdel(emailbox);
			dao.mailMoveDelete(emailbox);
		} else if (emailbox.getM_toemail().equals(login) || emailbox.getM_cc().equals(login)) {
			dao.mailRecvdel(emailbox);
			dao.mailMoveDelete(emailbox);
		}
		String recvedl = emailbox.getM_recvdel();
		String sentdel = emailbox.getM_sentdel();
		if (recvedl.equals("Y") || sentdel.equals("Y")) {
			dao.deleteEmail(emailbox.getM_seq());
		}

		model.addAttribute("title", "이메일이 삭제되었습니다.");
		model.addAttribute("msg", "이메일 삭제됨");

		return "mail/mail_mailbox_result";
	}

	// 전체메일함에서 관리 중 삭제
	@RequestMapping(value = "/mailAdminDelete", method = RequestMethod.POST)
	@ResponseBody
	public void mailAdminDelete(int m_seq) {
		EmailDao dao = sqlSession.getMapper(EmailDao.class);
		Emailbox emailbox = dao.selectOne(m_seq);
		dao.deleteEmail(emailbox.getM_seq());
	}

//주소록
	@RequestMapping(value = "/mailAddressBook", method = RequestMethod.GET)
	public String mailAddressBook(Model model, @RequestParam(defaultValue = "name") String selectfind,
			@RequestParam(defaultValue = "") String find) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		int pageSize = 10;
		int startrow = (1 - 1) * pageSize;
		int absPage = 1;
		member.setSelectfind(selectfind);
		member.setFind(find);
		member.setStartrow(startrow);
		member.setEndrow(pageSize);
		int rowCount = dao.addressCount(member);
		ArrayList<Member> members = dao.addressList(member);
		if (rowCount % pageSize == 0) {
			absPage = 0;
		}
		int pageCount = rowCount / pageSize + absPage;
		int pages[] = new int[pageCount];
		for (int i = 0; i < pages.length; i++) {
			pages[i] = i + 1;
		}
		model.addAttribute("members", members);
		model.addAttribute("pages", pages);
		model.addAttribute("find", find);
		if (rowCount == 0) {
			String msg = "주소록이 없습니다.";
			model.addAttribute("msg", msg);
		}
		return "mail/mail_addressbook";
	}

	@RequestMapping(value = "/mailAddressBookSelected", method = RequestMethod.GET)
	public String mailAddressBookSelected(Model model, @RequestParam(defaultValue = "all") String selectfind,
			@RequestParam int page, @RequestParam String find) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		int pageSize = 10;
		int startrow = (page - 1) * pageSize;
		int absPage = 1;
		member.setSelectfind(selectfind);
		member.setFind(find);
		member.setStartrow(startrow);
		member.setEndrow(pageSize);
		int rowCount = dao.addressCount(member);
		ArrayList<Member> members = dao.addressList(member);
		if (rowCount % pageSize == 0) {
			absPage = 0;
		}
		int pageCount = rowCount / pageSize + absPage;
		int pages[] = new int[pageCount];
		for (int i = 0; i < pages.length; i++) {
			pages[i] = i + 1;
		}
		model.addAttribute("members", members);
		model.addAttribute("pages", pages);
		model.addAttribute("find", find);
		if (rowCount == 0) {
			String msg = "검색 결과가 없습니다";
			model.addAttribute("msg", msg);
		}
		return "mail/mail_addressbook";

	}

	@RequestMapping(value = "/memberToName", method = RequestMethod.POST)
	@ResponseBody
	public Member memberToName(@RequestParam String email) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		Member member = dao.selectOne(email);
		return member;
	}

	@RequestMapping(value = "/mailboxAllForm", method = RequestMethod.GET)
	public String mailboxAllForm(Model model, @RequestParam(defaultValue = "m_title") String selectfind,
			@RequestParam(defaultValue = "") String find, @RequestParam(defaultValue = "5") int pageSize) {
		EmailDao dao = sqlSession.getMapper(EmailDao.class);
		int startPage = (1 - 1) * pageSize;
		int absPage = 1;

		emailbox.setSelectfind(selectfind);
		emailbox.setFind(find);
		emailbox.setStartrow(startPage);
		emailbox.setEndrow(pageSize);
		int rowCount = dao.allMailCount(emailbox);

		ArrayList<Emailbox> emailboxs = dao.allMailList(emailbox);

		if (rowCount % pageSize == 0) {
			absPage = 0;
		}
		int pageCount = rowCount / pageSize + absPage;
		int pages[] = new int[pageCount];
		for (int i = 0; i < pages.length; i++) {
			pages[i] = i + 1;
		}
		model.addAttribute("rowCount", rowCount);
		model.addAttribute("emailboxs", emailboxs);
		model.addAttribute("pages", pages);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("find", find);
		if (rowCount == 0) {
			String msg = "받은 이메일이 없습니다.";
			model.addAttribute("msg", msg);

		}

		return "mail/mail_mailbox_all";

	}

	@RequestMapping(value = "/mailboxAllSelected", method = RequestMethod.GET)
	public String mailboxAllSelected(Model model, @RequestParam(defaultValue = "all") String selectfind,
			@RequestParam int page, @RequestParam String find, @RequestParam(defaultValue = "5") int pageSize) {
		EmailDao dao = sqlSession.getMapper(EmailDao.class);

		int startrow = (page - 1) * pageSize;
		int absPage = 1;

		emailbox.setSelectfind(selectfind);
		emailbox.setFind(find);
		emailbox.setStartrow(startrow);
		emailbox.setEndrow(pageSize);
		int rowCount = dao.allMailCount(emailbox);

		ArrayList<Emailbox> emailboxs = dao.allMailList(emailbox);

		if (rowCount % pageSize == 0) {
			absPage = 0;
		}
		int pageCount = rowCount / pageSize + absPage;
		int pages[] = new int[pageCount];
		for (int i = 0; i < pages.length; i++) {
			pages[i] = i + 1;
		}
		model.addAttribute("rowCount", rowCount);
		model.addAttribute("emailboxs", emailboxs);
		model.addAttribute("pages", pages);
		model.addAttribute("find", find);
		model.addAttribute("pageSize", pageSize);
		if (rowCount == 0) {
			String msg = "검색 결과가 없습니다";
			model.addAttribute("msg", msg);
		}
		return "mail/mail_mailbox_all";

	}

}
