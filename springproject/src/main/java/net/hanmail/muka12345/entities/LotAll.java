package net.hanmail.muka12345.entities;

import org.springframework.stereotype.Component;

@Component
public class LotAll {
	Lotno lotno;
	Customer customer;
	Product product;
	Model model;
	Facility facility;
	Memberinsert memberinsert;
	Defect defect;

	public Lotno getLotno() {
		return lotno;
	}

	public void setLotno(Lotno lotno) {
		this.lotno = lotno;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Model getModel() {
		return model;
	}

	public void setModel(Model model) {
		this.model = model;
	}

	public Facility getFacility() {
		return facility;
	}

	public void setFacility(Facility facility) {
		this.facility = facility;
	}

	public Memberinsert getMemberinsert() {
		return memberinsert;
	}

	public void setMemberinsert(Memberinsert memberinsert) {
		this.memberinsert = memberinsert;
	}

	public Defect getDefect() {
		return defect;
	}

	public void setDefect(Defect defect) {
		this.defect = defect;
	}
}
