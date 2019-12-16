package com.naver.zbqn798.service;

import java.util.ArrayList;

import com.naver.zbqn798.entities.Pay;

public interface PayDao {

	int insertRow(Pay pay);
	
	ArrayList<Pay> selectAll();
	
	ArrayList<Pay> selectPageList(String grope);
	
	Pay selectPay(String empno);
	
	int modifyRow(Pay pay);
	
	int deleteRow(Pay pay);
	
	
}
