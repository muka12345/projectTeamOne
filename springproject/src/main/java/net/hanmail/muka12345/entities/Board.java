package net.hanmail.muka12345.entities;

import org.springframework.stereotype.Component;

@Component

/*
 * CREATE TABLE `board` ( `bno` int(11) NOT NULL, `regdate` datetime NOT NULL,
 * `title` varchar(100) NOT NULL, `content` varchar(10000) DEFAULT NULL, `name`
 * varchar(45) NOT NULL, `hit` int(11) NOT NULL DEFAULT '0', PRIMARY KEY (`bno`)
 * ) ENGINE=InnoDB DEFAULT CHARSET=utf8
 */
 
public class Board {

	private int bno;
	private java.sql.Timestamp regdate;
	private String title;
	private String content;
	private String name;
	private int hit;

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public java.sql.Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(java.sql.Timestamp regdate) {
		this.regdate = regdate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

}
