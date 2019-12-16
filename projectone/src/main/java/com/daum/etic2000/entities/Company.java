package com.daum.etic2000.entities;

import org.springframework.stereotype.Component;

@Component
/*
 * CREATE TABLE `company` ( `companycode` varchar(10) NOT NULL, `companyname`
 * varchar(45) NOT NULL, PRIMARY KEY (`companycode`) ) ENGINE=InnoDB DEFAULT
 * CHARSET=utf8
 */
public class Company {
	private String companycode;
	private String companyname;

	public String getCompanycode() {
		return companycode;
	}

	public void setCompanycode(String companycode) {
		this.companycode = companycode;
	}

	public String getCompanyname() {
		return companyname;
	}

	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}

}
