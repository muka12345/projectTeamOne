package com.daum.etic2000.entities;

import org.springframework.stereotype.Component;

@Component
/*
 * CREATE TABLE `attendance` ( `membercode` varchar(15) NOT NULL, `workingday`
 * varchar(45) NOT NULL DEFAULT '0', `absence` int(11) NOT NULL DEFAULT '0',
 * `halfday` int(11) NOT NULL DEFAULT '0', `early` int(11) NOT NULL DEFAULT '0',
 * `late` int(11) NOT NULL DEFAULT '0', `sick` int(11) NOT NULL DEFAULT '0',
 * PRIMARY KEY (`membercode`) ) ENGINE=InnoDB DEFAULT CHARSET=utf8
 */
/*
 * create trigger insertmembercode after insert on memberinsert for each row
 * insert into attendance(membercode) select membercode from memberinsert as a
 * where a.membercode not in (select membercode from attendance)
 */
/*
 * create trigger deletemembercode after delete on memberinsert for each row
 * delete from attendance where membercode not in (select membercode from
 * memberinsert);
 */
/*
 * create trigger insertattenlist after update on attendance for each row insert
 * into attendancelog select * from attendance as a where a.workingday not in
 * (select workingday from attendancelog);
 */

public class Attendance {
	private String membercode;
	private String workingday;
	private int absence;
	private int halfday;
	private int early;
	private int late;
	private int sick;
	private String curtime;

	public String getMembercode() {
		return membercode;
	}

	public void setMembercode(String membercode) {
		this.membercode = membercode;
	}

	public String getWorkingday() {
		return workingday;
	}

	public void setWorkingday(String workingday) {
		this.workingday = workingday;
	}

	public int getAbsence() {
		return absence;
	}

	public void setAbsence(int absence) {
		this.absence = absence;
	}

	public int getHalfday() {
		return halfday;
	}

	public void setHalfday(int halfday) {
		this.halfday = halfday;
	}

	public int getEarly() {
		return early;
	}

	public void setEarly(int early) {
		this.early = early;
	}

	public int getLate() {
		return late;
	}

	public void setLate(int late) {
		this.late = late;
	}

	public int getSick() {
		return sick;
	}

	public void setSick(int sick) {
		this.sick = sick;
	}

	public String getCurtime() {
		return curtime;
	}

	public void setCurtime(String curtime) {
		this.curtime = curtime;
	}

}
