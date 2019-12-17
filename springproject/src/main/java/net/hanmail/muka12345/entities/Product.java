package net.hanmail.muka12345.entities;

import org.springframework.stereotype.Component;

@Component

/*
 * CREATE TABLE `product` ( `productcode` varchar(10) NOT NULL, `productname`
 * varchar(10) NOT NULL DEFAULT '0', PRIMARY KEY (`prductcode`) ) ENGINE=InnoDB
 * DEFAULT CHARSET=utf8
 */

public class Product {
	private String productcode;
	private String productname;
	
	public String getProductcode() {
		return productcode;
	}
	public void setProductcode(String productcode) {
		this.productcode = productcode;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}

}
