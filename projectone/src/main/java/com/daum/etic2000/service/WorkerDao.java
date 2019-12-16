package com.daum.etic2000.service;

import java.util.ArrayList;

import com.daum.etic2000.entities.AttenList;
import com.daum.etic2000.entities.Attendance;
import com.daum.etic2000.entities.Attendancelog;
import com.daum.etic2000.entities.Memberinsert;
import com.daum.etic2000.entities.WorkerList;

public interface WorkerDao {

	int insertRow(Memberinsert memberinsert);

	ArrayList<WorkerList> selectWorker();

	int workerDeleteRow(String membercode);

	int workerModifyRow(Memberinsert memberinsert);

	ArrayList<AttenList> attendanceSelect();

	ArrayList<AttenList> attendanceLog();

	int attenInsert(Attendance attendance);

	int attenDeleteRow(String workingday);

	int copyLog(Attendancelog attendancelog);
}
