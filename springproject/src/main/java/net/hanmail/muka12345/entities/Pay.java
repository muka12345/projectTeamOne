package net.hanmail.muka12345.entities;

import org.springframework.stereotype.Component;

@Component
public class Pay {
	private String name;
	private String empno;
	private String yyyy;
	private String mm;
	private String dd;
	private String depart;
	private String position;
	private String basicpay;
	private String fullattendpay;
	private String incentive;
	private String teampay;
	private String ricepay;
	private String supportpay;
	private String accurerest;
	private String monthrest;
	private String moverest;

	public String getEmpno() {
		return empno;
	}

	public void setEmpno(String empno) {
		this.empno = empno;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getYyyy() {
		return yyyy;
	}

	public void setYyyy(String yyyy) {
		this.yyyy = yyyy;
	}

	public String getMm() {
		return mm;
	}

	public void setMm(String mm) {
		this.mm = mm;
	}

	public String getDd() {
		return dd;
	}

	public void setDd(String dd) {
		this.dd = dd;
	}

	public String getDepart() {
		return depart;
	}

	public void setDepart(String depart) {
		this.depart = depart;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getBasicpay() {
		return basicpay;
	}

	public void setBasicpay(String basicpay) {
		this.basicpay = basicpay;
	}

	public String getFullattendpay() {
		return fullattendpay;
	}

	public void setFullattendpay(String fullattendpay) {
		this.fullattendpay = fullattendpay;
	}

	public String getIncentive() {
		return incentive;
	}

	public void setIncentive(String incentive) {
		this.incentive = incentive;
	}

	public String getTeampay() {
		return teampay;
	}

	public void setTeampay(String teampay) {
		this.teampay = teampay;
	}

	public String getRicepay() {
		return ricepay;
	}

	public void setRicepay(String ricepay) {
		this.ricepay = ricepay;
	}

	public String getSupportpay() {
		return supportpay;
	}

	public void setSupportpay(String supportpay) {
		this.supportpay = supportpay;
	}

	public String getAccurerest() {
		return accurerest;
	}

	public void setAccurerest(String accurerest) {
		this.accurerest = accurerest;
	}

	public String getMonthrest() {
		return monthrest;
	}

	public void setMonthrest(String monthrest) {
		this.monthrest = monthrest;
	}

	public String getMoverest() {
		return moverest;
	}

	public void setMoverest(String moverest) {
		this.moverest = moverest;
	}

}
