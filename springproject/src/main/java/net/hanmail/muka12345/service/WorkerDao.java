package net.hanmail.muka12345.service;

import java.util.ArrayList;

import net.hanmail.muka12345.entities.AttenList;
import net.hanmail.muka12345.entities.Attendance;
import net.hanmail.muka12345.entities.Attendancelog;
import net.hanmail.muka12345.entities.Memberinsert;
import net.hanmail.muka12345.entities.WorkerList;

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
