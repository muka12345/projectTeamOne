package com.daum.etic2000.service;

import java.util.ArrayList;

import com.daum.etic2000.entities.Defect;
import com.daum.etic2000.entities.Facility;
import com.daum.etic2000.entities.LotAll;
import com.daum.etic2000.entities.Lotno;
import com.daum.etic2000.entities.Memberinsert;
import com.daum.etic2000.entities.Process1;

public interface LotNoDao {

	int createLotNo(Lotno lotNo);

	ArrayList<LotAll> lotNoList();

	int lotnoDelete(String lotno);

	ArrayList<Lotno> lotNoSelct();

	ArrayList<Facility> facilitySelct();

	ArrayList<Memberinsert> memberSelct();

	ArrayList<LotAll> amountSelct();

	ArrayList<Defect> defectSelct();

	int lotNoInsert(Process1 process1);

	ArrayList<Process1> selectProcess();

}
