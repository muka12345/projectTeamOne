package net.hanmail.muka12345.entities;

import org.springframework.stereotype.Component;

@Component
public class AttenList {
	Attendance attendance;
	Attendancelog attendancelog;
	Memberinsert memberinsert;
	Part part;

	public Attendance getAttendance() {
		return attendance;
	}

	public void setAttendance(Attendance attendance) {
		this.attendance = attendance;
	}

	public Attendancelog getAttendancelog() {
		return attendancelog;
	}

	public void setAttendancelog(Attendancelog attendancelog) {
		this.attendancelog = attendancelog;
	}

	public Memberinsert getMemberinsert() {
		return memberinsert;
	}

	public void setMemberinsert(Memberinsert memberinsert) {
		this.memberinsert = memberinsert;
	}

	public Part getPart() {
		return part;
	}

	public void setPart(Part part) {
		this.part = part;
	}

}
