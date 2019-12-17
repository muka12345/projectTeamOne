package net.hanmail.muka12345;

import java.util.ArrayList;

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

import net.hanmail.muka12345.entities.Pay;
import net.hanmail.muka12345.service.PayDao;

@Controller
public class PayController {
	@Autowired
	private SqlSession sqlSession;

	// 급여상여 명세서(사원용) 진입
	@RequestMapping(value = "/payCheck", method = RequestMethod.GET)
	public String payCheck(Model model, HttpSession session) {
		PayDao dao = sqlSession.getMapper(PayDao.class);
		Pay pays = dao.selectPay(session.getAttribute("sessionempno").toString());
		model.addAttribute("pays", pays);

		return "pay/paycheck";
	}

	// 급여상여 명세서 입력(인사부) 진입
	@RequestMapping(value = "/payCheckForm", method = RequestMethod.GET)
	public String payCheckForm(Model model) {

		return "pay/paycheck_personnel";
	}

	// 급여관리테이블(인사부) 진입
	@RequestMapping(value = "/payDatatable", method = RequestMethod.GET)
	public String payDatatable(Model model) {
		PayDao dao = sqlSession.getMapper(PayDao.class);
		ArrayList<Pay> pays = dao.selectAll();
		model.addAttribute("pays", pays);

		return "pay/pay_datatable";
	}

	// 급여상여 명세서 저장
	@RequestMapping(value = "/payInsert", method = RequestMethod.POST)
	public String payInsert(Model model, @ModelAttribute Pay pay) {
		PayDao dao = sqlSession.getMapper(PayDao.class);
		int result = dao.insertRow(pay);
		if (result > 0) {
			return "result_page";
		} else {
			String msg = "저장되지 않았습니다 다시 시도하여주세요";
			return "pay/paycheck_personnel";
		}
	}

	// 급여관리테이블(인사부) 검색기능
	@RequestMapping(value = "/payDataselect", method = RequestMethod.GET)
	public String payDataselect(Model model, @ModelAttribute Pay pay, @RequestParam String grope) {
		PayDao dao = sqlSession.getMapper(PayDao.class);
		ArrayList<Pay> pays = dao.selectPageList(grope);
		model.addAttribute("pays", pays);

		return "pay/pay_datatable";
	}

	// 급여명세서 테이블 수정버튼 ajax
	@ResponseBody
	@RequestMapping(value = "/payUpdate", method = RequestMethod.POST)
	public String paybtnUpdate(@ModelAttribute Pay pay, Model model) {
		PayDao dao = sqlSession.getMapper(PayDao.class);
		int result = dao.modifyRow(pay);
		return result + "";
	}

	// 급여명세서 테이블 삭제버튼 ajax
	@ResponseBody
	@RequestMapping(value = "/payDelete", method = RequestMethod.POST)
	public String payDelete(@ModelAttribute Pay pay, Model model) {
		PayDao dao = sqlSession.getMapper(PayDao.class);
		int result = dao.deleteRow(pay);
		return result + "";
		
	}

}
