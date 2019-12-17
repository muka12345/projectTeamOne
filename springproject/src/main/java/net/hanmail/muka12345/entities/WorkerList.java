package net.hanmail.muka12345.entities;

import org.springframework.stereotype.Component;

@Component
public class WorkerList {
	Memberinsert memberinsert;
	Part part;
	Facility facility;
	Company company;

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

	public Facility getFacility() {
		return facility;
	}

	public void setFacility(Facility facility) {
		this.facility = facility;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

}
