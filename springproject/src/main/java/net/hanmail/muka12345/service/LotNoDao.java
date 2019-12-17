package net.hanmail.muka12345.service;

import java.util.ArrayList;

import net.hanmail.muka12345.entities.Defect;
import net.hanmail.muka12345.entities.Facility;
import net.hanmail.muka12345.entities.LotAll;
import net.hanmail.muka12345.entities.Lotno;
import net.hanmail.muka12345.entities.Memberinsert;
import net.hanmail.muka12345.entities.Process1;

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
