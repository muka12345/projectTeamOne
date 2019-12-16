package com.daum.etic2000.entities;

import org.springframework.stereotype.Component;

@Component

/*
 * CREATE TABLE `facility` ( `facilitycode` varchar(10) NOT NULL, `facilityname`
 * varchar(45) NOT NULL, `partcode` varchar(10) NOT NULL, PRIMARY KEY
 * (`facilitycode`) ) ENGINE=InnoDB DEFAULT CHARSET=utf8
 */

public class Facility {
	private String facilitycode;
	private String facilityname;
	private String partcode;

	public String getFacilitycode() {
		return facilitycode;
	}

	public void setFacilitycode(String facilitycode) {
		this.facilitycode = facilitycode;
	}

	public String getFacilityname() {
		return facilityname;
	}

	public void setFacilityname(String facilityname) {
		this.facilityname = facilityname;
	}

	public String getPartcode() {
		return partcode;
	}

	public void setPartcode(String partcode) {
		this.partcode = partcode;
	}

}
