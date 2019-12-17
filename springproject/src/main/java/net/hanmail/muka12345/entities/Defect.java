package net.hanmail.muka12345.entities;

import org.springframework.stereotype.Component;

/*CREATE TABLE `defect` (
		  `defectcode` varchar(10) NOT NULL,
		  `defectname` varchar(30) NOT NULL DEFAULT '0',
		  `fcode` varchar(10) NOT NULL DEFAULT '0',
		  PRIMARY KEY (`defectcode`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8
*/

@Component
public class Defect {
	private String defectcode;
	private String defectname;
	private String fcode;

	public String getDefectcode() {
		return defectcode;
	}

	public void setDefectcode(String defectcode) {
		this.defectcode = defectcode;
	}

	public String getDefectname() {
		return defectname;
	}

	public void setDefectname(String defectname) {
		this.defectname = defectname;
	}

	public String getFcode() {
		return fcode;
	}

	public void setFcode(String fcode) {
		this.fcode = fcode;
	}
}
