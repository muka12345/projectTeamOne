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

import com.daum.etic2000.entities.AttenList;
import com.daum.etic2000.entities.Attendance;
import com.daum.etic2000.entities.Attendancelog;
import com.daum.etic2000.entities.Memberinsert;
import com.daum.etic2000.entities.WorkerList;
import com.daum.etic2000.service.WorkerDao;

@Controller
public class WorkerController {
	@Autowired
	private SqlSession sqlsession;

	@RequestMapping(value = "/workerInsertRow", method = RequestMethod.POST)
	@ResponseBody
	public String workerInsertRow(@ModelAttribute Memberinsert memberinsert) {
		WorkerDao dao = sqlsession.getMapper(WorkerDao.class);
		int result = dao.insertRow(memberinsert);
		return result + "";
	}

	@RequestMapping(value = "/workerDeleteRow", method = RequestMethod.POST)
	@ResponseBody
	public String workerDeleteRow(@RequestParam String membercode) {
		WorkerDao dao = sqlsession.getMapper(WorkerDao.class);
		int result = dao.workerDeleteRow(membercode);
		return result + "";
	}

	@RequestMapping(value = "/workerModifyRow", method = RequestMethod.POST)
	@ResponseBody
	public String workerModifyRow(@ModelAttribute Memberinsert memberinsert) {
		WorkerDao dao = sqlsession.getMapper(WorkerDao.class);
		int result = dao.workerModifyRow(memberinsert);
		return result + "";
	}

	@RequestMapping(value = "/workerInsert", method = RequestMethod.GET)
	public String workerInsert(Model model) {
		WorkerDao dao = sqlsession.getMapper(WorkerDao.class);
		ArrayList<WorkerList> lists = dao.selectWorker();
		model.addAttribute("lists", lists);
		return "mes/worker/workerInsert";
	}

	@RequestMapping(value = "/workerAttendance", method = RequestMethod.GET)
	public String workerAttendance(Model model) {
		WorkerDao dao = sqlsession.getMapper(WorkerDao.class);
		ArrayList<AttenList> alists = dao.attendanceSelect();
		model.addAttribute("alists", alists);
		ArrayList<AttenList> alog = dao.attendanceLog();
		model.addAttribute("alog", alog);
		return "mes/worker/workerAttendance";
	}

	@RequestMapping(value = "/attenInsert", method = RequestMethod.POST)
	@ResponseBody
	public String attenInsert(@ModelAttribute Attendance attendance) {
		WorkerDao dao = sqlsession.getMapper(WorkerDao.class);
		int result = dao.attenInsert(attendance);
		return result + "";
	}

	@RequestMapping(value = "/attenDeleteRow", method = RequestMethod.POST)
	@ResponseBody
	public String attenDeleteRow(@RequestParam String workingday) {
		WorkerDao dao = sqlsession.getMapper(WorkerDao.class);
		int result = dao.attenDeleteRow(workingday);
		return result + "";
	}

	@RequestMapping(value = "/copyLog", method = RequestMethod.POST)
	@ResponseBody
	public String copyLog(@ModelAttribute Attendancelog attendancelog) {
		WorkerDao dao = sqlsession.getMapper(WorkerDao.class);
		int result = dao.copyLog(attendancelog);
		return result + "";
	}
}
