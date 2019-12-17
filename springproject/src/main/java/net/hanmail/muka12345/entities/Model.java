package net.hanmail.muka12345.entities;

import org.springframework.stereotype.Component;

@Component
/*
 * CREATE TABLE `model` ( `modelcode` varchar(10) NOT NULL, `modelname`
 * varchar(10) NOT NULL DEFAULT '0', PRIMARY KEY (`modelcode`) ) ENGINE=InnoDB
 * DEFAULT CHARSET=utf8
 */
public class Model {
	private String modelcode;
	private String modelname;
	private String cuscode;
	private String productcode;
	private String quantity;
	private String amount;

	public String getModelcode() {
		return modelcode;
	}

	public void setModelcode(String modelcode) {
		this.modelcode = modelcode;
	}

	public String getModelname() {
		return modelname;
	}

	public void setModelname(String modelname) {
		this.modelname = modelname;
	}

	public String getCuscode() {
		return cuscode;
	}

	public void setCuscode(String cuscode) {
		this.cuscode = cuscode;
	}

	public String getProductcode() {
		return productcode;
	}

	public void setProductcode(String productcode) {
		this.productcode = productcode;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

}
