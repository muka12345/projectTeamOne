package net.hanmail.muka12345.entities;

import org.springframework.stereotype.Component;

@Component

/*
 * CREATE TABLE `customer` ( `cuscode` varchar(10) NOT NULL, `cusname`
 * varchar(10) NOT NULL DEFAULT '0', PRIMARY KEY (`cuscode`) ) ENGINE=InnoDB
 * DEFAULT CHARSET=utf8
 */
public class Customer {
	private String cuscode;
	private String cusname;

	public String getCuscode() {
		return cuscode;
	}

	public void setCuscode(String cuscode) {
		this.cuscode = cuscode;
	}

	public String getCusname() {
		return cusname;
	}

	public void setCusname(String cusname) {
		this.cusname = cusname;
	}

}
