package net.hanmail.muka12345;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import net.hanmail.muka12345.entities.Emailbox;
import net.hanmail.muka12345.service.EmailDao;

@Controller
public class TestController {
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	Emailbox emailbox;

	static String find;

	// 전체 편지함(테스트용)
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

	@RequestMapping(value = "/testView", method = RequestMethod.GET)
	public String testView() {

		return "test/test_view";
	}

}
