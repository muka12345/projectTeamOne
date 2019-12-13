package net.hanmail.muka12345.entities;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class Member {
	private String seq;
	private String name;
	private String empno;
	private String password;
	private String depart;
	private String position;
	private String level;
	private String email;
	private String addr;
	private String addr1;
	private String homeno;
	private String phoneno;
	private String officeno;
	private String imagepath;
	private String workcheck;
	private String offworkcheck;
	private String joinyyyy;
	private String joinmm;

	private String find;
	private int startrow;
	private int endrow;
	private String selectfind;

//	CREATE TABLE `member` (
//			  `seq` varchar(10) NOT NULL,
//			  `name` varchar(10) DEFAULT NULL,
//			  `empno` varchar(10) NOT NULL,
//			  `password` varchar(60) DEFAULT NULL,
//			  `depart` varchar(10) DEFAULT NULL,
//			  `position` varchar(20) DEFAULT NULL,
//			  `level` varchar(20) DEFAULT NULL,
//			  `email` varchar(40) DEFAULT NULL,
//			  `addr` varchar(100) DEFAULT NULL,
//			  `addr1` varchar(100) DEFAULT NULL,
//			  `homeno` varchar(30) DEFAULT NULL,
//			  `phoneno` varchar(30) DEFAULT NULL,
//			  `officeno` varchar(30) DEFAULT NULL,
//			  `imagepath` varchar(300) DEFAULT NULL,
//			  `workcheck` varchar(5) DEFAULT NULL,
//			  `offworkcheck` varchar(5) DEFAULT NULL,
//			  `joinyyyy` varchar(4) DEFAULT NULL,
//			  `joinmm` varchar(2) DEFAULT NULL,
//			  PRIMARY KEY (`seq`,`empno`)
//			) ENGINE=InnoDB DEFAULT CHARSET=utf8

}
