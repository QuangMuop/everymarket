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
		int banTime = 0;
		switch (actionCode) {
		case "�׽�Ʈ�� : 20��": banTime = 86400000 / 4320; break;
		case "1�� ����Ʈ ���� ����": banTime = 86400000 * 1; break;
		case "3�� ����Ʈ ���� ����": banTime = 86400000 * 3; break;
		case "5�� ����Ʈ ���� ����": banTime = 86400000 * 5; break; }
		banList.setReleaseTime(new Timestamp(System.currentTimeMillis() + banTime));
		
		/*actionCode�� �Ⱒ�� �ƴ� ���ٱ����� ���*/
		if(!actionCode.equals("�Ű�Ⱒ")){
			if(daoBL.getBanListByM_id(m_id) == null){
				/*���ٱ�����Ͽ� m_id�� �ش��ϴ� �����Ͱ� �������� ���� ��� : ���ٱ�����Ͽ� ���*/
				daoBL.registerBan(banList);
				
				/*ȸ������ ���ٱ����� ����*/
				daoM.updateM_status(m_id);
			}else{
				/*���ٱ�����Ͽ� m_id�� �ش��ϴ� �����Ͱ� ������ ��� : �߰����系�븸ŭ �Ⱓ ����*/
				BanList existingBanList = daoBL.getBanListByM_id(m_id);
				
				long timeMillis = existingBanList.getReleaseTime().getTime() + banTime;
				existingBanList.setReleaseTime(new Timestamp(timeMillis));
				
				daoBL.renewReleaseTime(existingBanList);
			}
		}
		
		/*m_report + 1*/
		daoM.updateM_report(m_id);
		
		/*rep_id�� �ش��ϴ� �Ű�� Checkó��*/
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("rep_id", rep_id);
		paramMap.put("actionCode", actionCode);
		paramMap.put("rep_checkTime", new Timestamp(System.currentTimeMillis()));
		daoBR.checkReportStatus(paramMap);
	}
}