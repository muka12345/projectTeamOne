package net.hanmail.muka12345.entities;

import org.springframework.stereotype.Component;

@Component

/*
 * CREATE TABLE `part` ( `partcode` varchar(10) NOT NULL, `partname` varchar(45)
 * NOT NULL, PRIMARY KEY (`partcode`) ) ENGINE=InnoDB DEFAULT CHARSET=utf8
 */
public class Part {
	private String partcode;
	private String partname;

	public String getPartcode() {
		return partcode;
	}

	public void setPartcode(String partcode) {
		this.partcode = partcode;
	}

	public String getPartname() {
		return partname;
	}

	public void setPartname(String partname) {
		this.partname = partname;
	}
}
