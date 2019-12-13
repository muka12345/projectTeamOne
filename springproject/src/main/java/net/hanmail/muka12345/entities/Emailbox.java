package net.hanmail.muka12345.entities;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class Emailbox {
	private int m_seq;
	private String m_fromemail;
	private String m_fromname;
	private String m_toemail;
	private String m_cc;
	private String m_toname;
	private String m_title;
	private String m_content;
	private String m_attach;
	private String m_filesize;
	private String m_date;
	// y,n값만 , default n
	private String m_show;
	private String m_temporary;
	private String m_spam;
	private String m_delete;
	private String m_recvdel;
	private String m_sentdel;
	private String m_save;
	private String m_filename;

	private String find;
	private int startrow;
	private int endrow;
	private String selectfind;
	private String sessionemail;

//	CREATE TABLE `emailbox` (
//			  `m_seq` int(11) NOT NULL,
//			  `m_fromemail` varchar(45) DEFAULT NULL,
//			  `m_fromname` varchar(45) DEFAULT NULL,
//			  `m_toemail` varchar(400) DEFAULT NULL,
//			  `m_cc` varchar(45) DEFAULT NULL,
//			  `m_toname` varchar(45) DEFAULT NULL,
//			  `m_title` varchar(100) DEFAULT NULL,
//			  `m_content` varchar(4000) DEFAULT NULL,
//			  `m_attach` varchar(100) DEFAULT NULL,
//			  `m_filesize` varchar(10) DEFAULT NULL,
//			  `m_date` varchar(50) DEFAULT NULL,
//			  `m_show` varchar(1) DEFAULT 'N',
//			  `m_temporary` varchar(1) DEFAULT 'N',
//			  `m_spam` varchar(1) DEFAULT 'N',
//			  `m_delete` varchar(1) DEFAULT 'N',
//			  `m_recvdel` varchar(1) DEFAULT 'N',
//			  `m_sentdel` varchar(1) DEFAULT 'N',
//			  `m_save` varchar(1) DEFAULT 'N',
//			  PRIMARY KEY (`m_seq`)
//			) ENGINE=InnoDB DEFAULT CHARSET=utf8

}
