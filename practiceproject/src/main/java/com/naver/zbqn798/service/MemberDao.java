package com.naver.zbqn798.service;

import java.util.ArrayList;

import com.naver.zbqn798.entities.Member;

public interface MemberDao {

	int insertRow(Member member);
	
	int confirmnumber(String empno);
	
	int updateRow(Member member);
	
	Member selectOne(String empno);
	
	int selectseq(Member member);
	
	ArrayList<Member> selectAll();
	
	int ChangeRow(Member member);
	
	int deleteRow(String empno);
	
	int updateAll(Member member);
	
	ArrayList<Member> selectPageList(String find);
	
	Member selectMember(String empno);
	
	int updateMyinfo(Member member);
	
	int workCheck(Member member);
	
	int offworkCheck(Member member);
	
	int Creatempno(Member member);
	
	
	
}
