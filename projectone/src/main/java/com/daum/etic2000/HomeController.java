package com.daum.etic2000;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "index";
	}

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "index";
	}

	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test() {
		return "test";
	}

	@RequestMapping(value = "/test1", method = RequestMethod.GET)
	public String test1() {
		return "test1";
	}

	@RequestMapping(value = "/test2", method = RequestMethod.GET)
	public String test2() {
		return "test2";
	}

	@RequestMapping(value = "/test3", method = RequestMethod.GET)
	public String test3() {
		return "test3";
	}

	@RequestMapping(value = "/test4", method = RequestMethod.GET)
	public String test4() {
		return "test4";
	}

	@RequestMapping(value = "/test5", method = RequestMethod.GET)
	public String test5() {
		return "test5";
	}

	@RequestMapping(value = "/test6", method = RequestMethod.GET)
	public String test6() {
		return "test6";
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
