package net.hanmail.muka12345.service;

import java.util.ArrayList;

import net.hanmail.muka12345.entities.Member;

public interface MemberDao {

	ArrayList<Member> addressList(Member member);

	int addressCount(Member member);

	Member selectOne(String email);

	ArrayList<Member> selectAll();

	ArrayList<Member> selectemail();

	ArrayList<Member> listAll2();

}
