package net.hanmail.muka12345.entities;

import org.springframework.stereotype.Component;

/*CREATE TABLE `lotno` (
		  `lotno` varchar(15) NOT NULL,
		  `cuscode` varchar(10) NOT NULL DEFAULT '0',
		  `productcode` varchar(10) NOT NULL DEFAULT '0',
		  `yy` varchar(10) NOT NULL DEFAULT '0',
		  `mm` varchar(10) NOT NULL DEFAULT '0',
		  `dd` varchar(10) NOT NULL DEFAULT '0',
		  `orderno` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
		  `modelcode` varchar(10) NOT NULL DEFAULT '0',
		  `time` varchar(10) NOT NULL DEFAULT '0',
		  PRIMARY KEY (`LotNo`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8*/
@Component
public class Lotno {
	private String lotno;
	private String cuscode;
	private String productcode;
	private String yy;
	private String mm;
	private String dd;
	private String time;
	private String orderno;
	private String modelcode;

	public String getLotno() {
		return lotno;
	}

	public void setLotno(String lotno) {
		this.lotno = lotno;
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

	public String getYy() {
		return yy;
	}

	public void setYy(String yy) {
		this.yy = yy;
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

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getOrderno() {
		return orderno;
	}

	public void setOrderno(String orderno) {
		this.orderno = orderno;
	}

	public String getModelcode() {
		return modelcode;
	}

	public void setModelcode(String modelcode) {
		this.modelcode = modelcode;
	}
}
