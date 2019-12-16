package com.naver.zbqn798;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.naver.zbqn798.entities.Member;
import com.naver.zbqn798.service.MemberDao;

@Controller
public class LoginController {
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	// 로그인페이지 진입
	@RequestMapping(value = "/LoginForm", method = RequestMethod.GET)
	public String test(Model model, @ModelAttribute Member member) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);

		return "login/login_insert";
	}

	// 로그인 실패시 진입
	@RequestMapping(value = "/LoginFailform", method = RequestMethod.GET)
	public String LoginFailform(Model model) {

		return "login/login_fail";
	}

	// 로그아웃
	@RequestMapping(value = "/Logout", method = RequestMethod.GET)
	public String Logout(HttpSession session) {
		session.invalidate();

		return "result_page";
	}

	// 로그인 버튼 누를시
	@RequestMapping(value = "/Login", method = RequestMethod.POST)
	public String login(@ModelAttribute Member member, HttpSession session) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		Member data = dao.selectOne(member.getEmpno());
		try {
			boolean passchk = BCrypt.checkpw(member.getPassword(), data.getPassword());
			if (passchk) {
				session.setAttribute("sessionempno", data.getEmpno());
				session.setAttribute("sessionimage", data.getImagepath());
				session.setAttribute("sessionpassword", data.getPassword());
				session.setAttribute("sessionlevel", data.getLevel());
				session.setAttribute("sessionname", data.getName());
				session.setAttribute("sessiondepart", data.getDepart());
				session.setAttribute("sessionposition", data.getPosition());
				session.setAttribute("sessionemail", data.getEmail());
				return "result_page";
			} else {
				return "login/login_fail";
			}
		} catch (Exception e) {
			return "login/login_fail";
		}
	}
}