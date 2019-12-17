package net.hanmail.muka12345;

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

import net.hanmail.muka12345.entities.Defect;
import net.hanmail.muka12345.entities.Facility;
import net.hanmail.muka12345.entities.LotAll;
import net.hanmail.muka12345.entities.Lotno;
import net.hanmail.muka12345.entities.Memberinsert;
import net.hanmail.muka12345.entities.Process1;
import net.hanmail.muka12345.service.LotNoDao;

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

	@RequestMapping(value = "/mesIndex", method = RequestMethod.GET)
	public String index1() {
		return "mes/mesIndex";
	}

	@RequestMapping(value = "/mesBoardListForm", method = RequestMethod.GET)
	public String mesBoardListForm() {
		return "mes/board/mesBoardList";
	}

	@RequestMapping(value = "/mesBoardInsert", method = RequestMethod.GET)
	public String mesBoardInsert() {
		return "mes/board/mesBoardInsert";
	}

	@RequestMapping(value = "/mesBoardPart1", method = RequestMethod.GET)
	public String mesBoardPart1() {
		return "mes/board/mesBoardPart1";
	}

	@RequestMapping(value = "/mesBoardPart2", method = RequestMethod.GET)
	public String mesBoardPart2() {
		return "mes/board/mesBoardPart2";
	}

	@RequestMapping(value = "/mesBoardPart3", method = RequestMethod.GET)
	public String mesBoardPart3() {
		return "mes/board/mesBoardPart3";
	}

	@RequestMapping(value = "/mesBoardPart4", method = RequestMethod.GET)
	public String mesBoardPart4() {
		return "mes/board/mesBoardPart4";
	}

	@RequestMapping(value = "/mesBoardPart5", method = RequestMethod.GET)
	public String mesBoardPart5() {
		return "mes/board/mesBoardPart5";
	}

	@RequestMapping(value = "/lineSchedule", method = RequestMethod.GET)
	public String lineSchedule() {
		return "mes/date/lineSchedule";
	}

	@RequestMapping(value = "/performanceProduction", method = RequestMethod.GET)
	public String performanceProduction() {
		return "mes/performance/production";
	}

	@RequestMapping(value = "/performanceModel", method = RequestMethod.GET)
	public String performanceModel() {
		return "mes/performance/model";
	}

	@RequestMapping(value = "/inventory", method = RequestMethod.GET)
	public String inventory() {
		return "mes/performance/inventory";
	}

	@RequestMapping(value = "/ProductionYield", method = RequestMethod.GET)
	public String ProductionYield() {
		return "mes/yield/productionYield";
	}

	@RequestMapping(value = "/modelYield", method = RequestMethod.GET)
	public String modelYield() {
		return "mes/yield/modelYield";
	}

	@RequestMapping(value = "/facilityManagement", method = RequestMethod.GET)
	public String facilityManagement() {
		return "mes/facility/facilitymanagement";
	}

}
