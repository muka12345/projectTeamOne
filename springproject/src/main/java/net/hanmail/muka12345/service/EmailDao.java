package net.hanmail.muka12345.service;

import java.util.ArrayList;

import net.hanmail.muka12345.entities.Emailbox;

public interface EmailDao {

	int emailsend(Emailbox emailbox);

	int emailTemporary(Emailbox emailbox);

	int deleteEmail(int m_seq);

	int updateEmail(Emailbox emailbox);

	int updateTemporary(Emailbox emailbox);

	ArrayList<Emailbox> inputMailPageList(Emailbox emailbox);

	ArrayList<Emailbox> outputMailList(Emailbox emailbox);

	ArrayList<Emailbox> temporaryMailList(Emailbox emailbox);

	ArrayList<Emailbox> deleteMailList(Emailbox emailbox);

	ArrayList<Emailbox> spamMailList(Emailbox emailbox);

	ArrayList<Emailbox> saveMailList(Emailbox emailbox);

	ArrayList<Emailbox> allMailList(Emailbox emailbox);

	Emailbox selectOne(int m_seq);

	void showHit(int m_seq);

	int mailRecvdel(Emailbox emailbox);

	int mailSentdel(Emailbox emailbox);

	int deleteMailMove(Emailbox emailbox);

	int mailMoveDelete(Emailbox emailbox);

	int spamMailMove(Emailbox emailbox);

	int mailMoveSpam(Emailbox emailbox);

	int mailSaveUpdate(Emailbox emailbox);

	int saveMailMove(Emailbox emailbox);

	int inputMailCount(Emailbox emailbox);

	int temporaryMailCount(Emailbox emailbox);

	int saveMailCount(Emailbox emailbox);

	int outputMailCount(Emailbox emailbox);

	int spamMailCount(Emailbox emailbox);

	int deleteMailCount(Emailbox emailbox);

	int allMailCount(Emailbox emailbox);

}
