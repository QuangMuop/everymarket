package everymarket.dwr;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import everymarket.dao.BanListDao;
import everymarket.dao.BoardReportDao;
import everymarket.dao.MemberDao;
import everymarket.model.BanList;

public class BoardReportDwr {
	private BanListDao daoBL;
	private BoardReportDao daoBR;
	private MemberDao daoM;

	public void setDaoBL(BanListDao daoBL) {
		this.daoBL = daoBL;
	}
	public void setDaoBR(BoardReportDao daoBR) {
		this.daoBR = daoBR;
	}
	public void setDaoM(MemberDao daoM) {
		this.daoM = daoM;
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=(Exception.class))
	public void reportAction(int rep_id, String actionCode)throws Exception{
		String m_id = daoBR.getBoardReportByRep_id(rep_id).getRep_memberId();
		
		BanList banList = new BanList();
		banList.setBl_id(daoBL.getMaxBl_id() + 1);
		banList.setM_id(m_id);
		banList.setRep_id(rep_id);
		banList.setJudgeTime(new Timestamp(System.currentTimeMillis()));

		/*actionCode�� ���� ���ٱ��� �Ⱓ ����*/
		switch (actionCode) {
		case "�׽�Ʈ�� : 20��": banList.setReleaseTime(new Timestamp(System.currentTimeMillis() + 86400000 / 4320)); break;
		case "1�� ����Ʈ ���� ����": banList.setReleaseTime(new Timestamp(System.currentTimeMillis() + 86400000 * 1)); break;
		case "3�� ����Ʈ ���� ����": banList.setReleaseTime(new Timestamp(System.currentTimeMillis() + 86400000 * 3)); break;
		case "5�� ����Ʈ ���� ����": banList.setReleaseTime(new Timestamp(System.currentTimeMillis() + 86400000 * 5)); break; }

		/*���ٱ�����Ͽ� ���*/
		daoBL.registerBan(banList);
		
		/*ȸ������ ���ٱ����� ����*/
		daoM.setStatus_ban(m_id);

		/*r_id�� �ش��ϴ� �Ű�� Checkó��*/
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("rep_id", rep_id);
		paramMap.put("actionCode", actionCode);
		daoBR.checkReportStatus(paramMap);
	}
}