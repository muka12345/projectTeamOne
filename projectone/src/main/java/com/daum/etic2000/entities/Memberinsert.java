package com.daum.etic2000.entities;

import org.springframework.stereotype.Component;

@Component

/*
 * CREATE TABLE `memberinsert` ( `membercode` varchar(15) NOT NULL, `membername`
 * varchar(45) NOT NULL, `position` varchar(45) NOT NULL, `regular` varchar(45)
 * NOT NULL DEFAULT 'n', `memlevel` int(11) NOT NULL DEFAULT '1', `pcode`
 * varchar(10) NOT NULL, `ccode` varchar(10) NOT NULL, `fcode` varchar(10) NOT
 * NULL, `regdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP, `codedate`
 * varchar(8) NOT NULL, `codeno` int(3) unsigned zerofill NOT NULL, PRIMARY KEY
 * (`membercode`) ) ENGINE=InnoDB DEFAULT CHARSET=utf8
 */

public class Memberinsert {
	private String membercode;
	private String codedate;
	private int codeno;
	private String membername;
	private String position;
	private String regular;
	private int memlevel;
	private String pcode;
	private String ccode;
	private String fcode;
	private String regdate;

	public String getMembercode() {
		return membercode;
	}

	public void setMembercode(String membercode) {
		this.membercode = membercode;
	}

	public String getCodedate() {
		return codedate;
	}

	public void setCodedate(String codedate) {
		this.codedate = codedate;
	}

	public int getCodeno() {
		return codeno;
	}

	public void setCodeno(int codeno) {
		this.codeno = codeno;
	}

	public String getMembername() {
		return membername;
	}

	public void setMembername(String membername) {
		this.membername = membername;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getRegular() {
		return regular;
	}

	public void setRegular(String regular) {
		this.regular = regular;
	}

	public int getMemlevel() {
		return memlevel;
	}

	public void setMemlevel(int memlevel) {
		this.memlevel = memlevel;
	}

	public String getPcode() {
		return pcode;
	}

	public void setPcode(String pcode) {
		this.pcode = pcode;
	}

	public String getCcode() {
		return ccode;
	}

	public void setCcode(String ccode) {
		this.ccode = ccode;
	}

	public String getFcode() {
		return fcode;
	}

	public void setFcode(String fcode) {
		this.fcode = fcode;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

}
