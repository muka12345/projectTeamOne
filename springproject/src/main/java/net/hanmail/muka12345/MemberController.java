package net.hanmail.muka12345;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import net.hanmail.muka12345.entities.Member;
import net.hanmail.muka12345.service.MemberDao;

@Controller
public class MemberController {
	@Autowired
	private SqlSession sqlsession;
	@Autowired
	Member data;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	// 비밀번호변경 저장
	@RequestMapping(value = "/memberpassChange", method = RequestMethod.POST)
	public String passwordChange(Model model, @ModelAttribute Member member) {
		MemberDao dao = sqlsession.getMapper(MemberDao.class);
		String passEncode = passwordEncoder.encode(member.getPassword());
		member.setPassword(passEncode);
		int result = dao.updateRow(member);
		if (result > 0) {
			return "result_page";
		} else {
			return "redirect:index";
		}
	}

	// 비밀번호변경 진입
	@RequestMapping(value = "/memberpassForm", method = RequestMethod.GET)
	public String passwordChangeForm(Model model) {
		MemberDao dao = sqlsession.getMapper(MemberDao.class);

		return "password/password_update";
	}

	// 개인정보조회(사원용)진입,드롭박스에 있는것
	@RequestMapping(value = "/memberInfo", method = RequestMethod.GET)
	public String myInfo(Model model, HttpSession session) {
		MemberDao dao = sqlsession.getMapper(MemberDao.class);
		Member members = dao.selectMember(session.getAttribute("sessionempno").toString());
		model.addAttribute("members", members);

		return "member/member_update";
	}

	// 개인정보조회(사원용)저장,드롭박스에 있는것
	@RequestMapping(value = "/memberInfoSave", method = RequestMethod.POST)
	public String myInfoSave(Model model, @ModelAttribute Member member) {
		MemberDao dao = sqlsession.getMapper(MemberDao.class);
		int result = dao.updateMyinfo(member);
		if (result > 0) {
			return "result_page";
		} else {
			return "index";
		}
	}

	// 개인정보조회(인사과용)진입
	@RequestMapping(value = "/memberInsertper", method = RequestMethod.GET)
	public String MemberInsertper(Model model) {

		return "member/member_insert_personnel";
	}

	// 사원관리테이블(인사과용)진입
	@RequestMapping(value = "/memberDatatable", method = RequestMethod.GET)
	public String MemberDatatable(Model model, @ModelAttribute Member member) {
		MemberDao dao = sqlsession.getMapper(MemberDao.class);
		ArrayList<Member> members = dao.selectAll();
		model.addAttribute("members", members);

		return "member/member_datatable";
	}

	// 사원관리table 검색버튼
	@RequestMapping(value = "/memberSelect", method = RequestMethod.POST)
	public String memberSelect(@RequestParam String find, Model model, @ModelAttribute Member member) {
		MemberDao dao = sqlsession.getMapper(MemberDao.class);
		ArrayList<Member> members = dao.selectPageList(find);
		model.addAttribute("members", members);
		return "member/member_datatable";
	}

	// 개인정보조회(인사과용) 저장버튼시
	@RequestMapping(value = "/memberInsert", method = RequestMethod.POST)
	public String memberInsert(Model model, @ModelAttribute Member member, @RequestParam CommonsMultipartFile image) {
		String path = "D:/NCSDEEPSPRINGSOURCE/practiceproject/src/main/webapp/resources/upload_files";
		String realpath = "/resources/upload_files";
		String stremail = member.getEmail();
		String cutemail = stremail.substring(0, stremail.indexOf("@"));
		String originalname = image.getOriginalFilename();
		String imgfilename = cutemail + "_" + originalname;
		if (originalname.equals("")) {
			member.setImagepath("resources/images/noimage.png");
		} else {
			try {
				byte[] bytes = image.getBytes();
				BufferedOutputStream output = new BufferedOutputStream(new FileOutputStream(path + imgfilename));
				output.write(bytes);
				output.flush();
				output.close();
				member.setImagepath(realpath + imgfilename);
			} catch (Exception e) {

			}
		}
		MemberDao dao = sqlsession.getMapper(MemberDao.class);
		String passEncode = passwordEncoder.encode(member.getPassword());
		member.setPassword(passEncode);
		int sqlresult = dao.insertRow(member);
		String msg = "저장되지 않았습니다.";
		if (sqlresult > 0) {
			msg = "save success!";
		}
		return "result_page";
	}

	// 개인정보조회(사원용) 저장 버튼시
	@RequestMapping(value = "/memberUpdate", method = RequestMethod.POST)
	public String memberUpdate(Model model, @ModelAttribute Member member) {
		MemberDao dao = sqlsession.getMapper(MemberDao.class);
		String passEncode = passwordEncoder.encode(member.getPassword());
		member.setPassword(passEncode);
		int result = dao.updateRow(member);
		if (result > 0) {
			String msg = "저장되었어요";
		}
		return "result_page";
	}

	// 중복검사
	@ResponseBody
	@RequestMapping(value = "/memberConfirm", method = RequestMethod.POST)
	public String memberConfirm(Model model, @RequestParam String empno) {
		MemberDao dao = sqlsession.getMapper(MemberDao.class);
		int result = dao.confirmnumber(empno);
		if (result > 0) {
			return "y";
		} else {
			return "n";
		}
	}

	// 사원관리 테이블에서 수정버튼 ajax url
	@RequestMapping(value = "/memberModify", method = RequestMethod.POST)
	@ResponseBody
	public String tableModify(@ModelAttribute Member member) {
		MemberDao dao = sqlsession.getMapper(MemberDao.class);
		int result = dao.ChangeRow(member);
		return result + "";
	}

	// 사원관리 테이블에서 삭제버튼 ajax url
	@RequestMapping(value = "/memberDelete", method = RequestMethod.POST)
	@ResponseBody
	public String memberDeleteAjax(@RequestParam String empno) {
		MemberDao dao = sqlsession.getMapper(MemberDao.class);
		int result = dao.deleteRow(empno);
		return result + "";
	}
}
