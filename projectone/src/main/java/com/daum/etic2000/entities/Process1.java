package com.daum.etic2000.entities;

import org.springframework.stereotype.Component;

//CREATE TABLE `process1` (
//		  `lotno` varchar(15) NOT NULL DEFAULT '0',
//		  `facilityname` varchar(45) NOT NULL DEFAULT '0',
//		  `membername` varchar(45) NOT NULL DEFAULT '0',
//		  `outtime` varchar(45) NOT NULL DEFAULT '0',
//		  `amount` varchar(10) NOT NULL DEFAULT '0',
//		  `input` varchar(10) NOT NULL DEFAULT '0',
//		  `output` varchar(10) NOT NULL DEFAULT '0',
//		  `processlevel` varchar(45) DEFAULT NULL,
//		  `defect1` varchar(45) DEFAULT NULL,
//		  `defectqty1` varchar(45) DEFAULT NULL,
//		  `defect2` varchar(45) DEFAULT NULL,
//		  `defectqty2` varchar(45) DEFAULT NULL,
//		  `defect3` varchar(45) DEFAULT NULL,
//		  `defectqty3` varchar(45) DEFAULT NULL,
//		  `defect4` varchar(45) DEFAULT NULL,
//		  `defectqty4` varchar(45) DEFAULT NULL,
//		  `defect5` varchar(45) DEFAULT NULL,
//		  `defectqty5` varchar(45) DEFAULT NULL,
//		  `defectsum` varchar(45) DEFAULT NULL,
//		  PRIMARY KEY (`lotno`)
//		) ENGINE=InnoDB DEFAULT CHARSET=utf8
@Component
public class Process1 {

	private String lotno;
	private String facilityname;
	private String membername;
	private String outtime;
	private String amount;
	private String input;
	private String output;
	private String processlevel;
	private String defect1;
	private String defectqty1;
	private String defect2;
	private String defectqty2;
	private String defect3;
	private String defectqty3;
	private String defect4;
	private String defectqty4;
	private String defect5;
	private String defectqty5;
	private String defectsum;

	public String getLotno() {
		return lotno;
	}

	public void setLotno(String lotno) {
		this.lotno = lotno;
	}

	public String getFacilityname() {
		return facilityname;
	}

	public void setFacilityname(String facilityname) {
		this.facilityname = facilityname;
	}

	public String getMembername() {
		return membername;
	}

	public void setMembername(String membername) {
		this.membername = membername;
	}

	public String getOuttime() {
		return outtime;
	}

	public void setOuttime(String outtime) {
		this.outtime = outtime;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String getInput() {
		return input;
	}

	public void setInput(String input) {
		this.input = input;
	}

	public String getOutput() {
		return output;
	}

	public void setOutput(String output) {
		this.output = output;
	}

	public String getProcesslevel() {
		return processlevel;
	}

	public void setProcesslevel(String processlevel) {
		this.processlevel = processlevel;
	}

	public String getDefect1() {
		return defect1;
	}

	public void setDefect1(String defect1) {
		this.defect1 = defect1;
	}

	public String getDefectqty1() {
		return defectqty1;
	}

	public void setDefectqty1(String defectqty1) {
		this.defectqty1 = defectqty1;
	}

	public String getDefect2() {
		return defect2;
	}

	public void setDefect2(String defect2) {
		this.defect2 = defect2;
	}

	public String getDefectqty2() {
		return defectqty2;
	}

	public void setDefectqty2(String defectqty2) {
		this.defectqty2 = defectqty2;
	}

	public String getDefect3() {
		return defect3;
	}

	public void setDefect3(String defect3) {
		this.defect3 = defect3;
	}

	public String getDefectqty3() {
		return defectqty3;
	}

	public void setDefectqty3(String defectqty3) {
		this.defectqty3 = defectqty3;
	}

	public String getDefect4() {
		return defect4;
	}

	public void setDefect4(String defect4) {
		this.defect4 = defect4;
	}

	public String getDefectqty4() {
		return defectqty4;
	}

	public void setDefectqty4(String defectqty4) {
		this.defectqty4 = defectqty4;
	}

	public String getDefect5() {
		return defect5;
	}

	public void setDefect5(String defect5) {
		this.defect5 = defect5;
	}

	public String getDefectqty5() {
		return defectqty5;
	}

	public void setDefectqty5(String defectqty5) {
		this.defectqty5 = defectqty5;
	}

	public String getDefectsum() {
		return defectsum;
	}

	public void setDefectsum(String defectsum) {
		this.defectsum = defectsum;
	}

}
