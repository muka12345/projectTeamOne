package com.daum.etic2000;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daum.etic2000.entities.Defect;
import com.daum.etic2000.entities.Facility;
import com.daum.etic2000.entities.LotAll;
import com.daum.etic2000.entities.Lotno;
import com.daum.etic2000.entities.Memberinsert;
import com.daum.etic2000.entities.Process1;
import com.daum.etic2000.service.LotNoDao;

@Controller
public class LotNoController {
	@Autowired
	private SqlSession sqlsession;

	@RequestMapping(value = "/LotNoCreate", method = RequestMethod.GET)
	public String LotNoCreate(Model model) {
		LotNoDao dao = sqlsession.getMapper(LotNoDao.class);
		ArrayList<LotAll> lotnoa = dao.lotNoList();
		model.addAttribute("lotnoa", lotnoa);
		return "mes/lotno/LotNoCreate";
	}

	@RequestMapping(value = "/createLotNo", method = RequestMethod.POST)
	@ResponseBody
	public String createLotNo(@ModelAttribute Lotno lotNo) {
		LotNoDao dao = sqlsession.getMapper(LotNoDao.class);
		int result = dao.createLotNo(lotNo);
		return result + "";
	}

	@RequestMapping(value = "/deleteLotNo", method = RequestMethod.POST)
	@ResponseBody
	public String deleteLotNo(@RequestParam String lotno) {
		LotNoDao dao = sqlsession.getMapper(LotNoDao.class);
		int result = dao.lotnoDelete(lotno);
		return result + "";
	}

	@RequestMapping(value = "/LotNoInsert", method = RequestMethod.GET)
	public String LotNoInsert(Model model) {
		LotNoDao dao = sqlsession.getMapper(LotNoDao.class);
		ArrayList<Lotno> lotselect = dao.lotNoSelct();
		model.addAttribute("lotselect", lotselect);
		ArrayList<Facility> facilityselect = dao.facilitySelct();
		model.addAttribute("facilityselect", facilityselect);
		ArrayList<Memberinsert> memberselect = dao.memberSelct();
		model.addAttribute("memberselect", memberselect);
		ArrayList<LotAll> amountselect = dao.amountSelct();
		model.addAttribute("amountselect", amountselect);
		ArrayList<Defect> defectselect = dao.defectSelct();
		model.addAttribute("defectselect", defectselect);
		ArrayList<Process1> selectProcess = dao.selectProcess();
		model.addAttribute("selectProcess", selectProcess);
		return "mes/lotno/LotNoInsert";
	}

	@RequestMapping(value = "/lotNoInsert", method = RequestMethod.POST)
	@ResponseBody
	public String lotNoInsert(@ModelAttribute Process1 process1) {
		LotNoDao dao = sqlsession.getMapper(LotNoDao.class);
		int result = dao.lotNoInsert(process1);
		return result + "";
	}

	@RequestMapping(value = "/LotNoInfo", method = RequestMethod.GET)
	public String LotNoInfo() {
		return "mes/lotno/LotNoInfo";
	}

	@RequestMapping(value = "/defectiveDetail", method = RequestMethod.GET)
	public String defectiveDetail() {
		return "mes/defective/defectiveDetail";
	}

}
