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

		/*actionCode에 따른 접근금지 기간 설정*/
		int banTime = 0;
		switch (actionCode) {
		case "테스트용 : 20초": banTime = 86400000 / 4320; break;
		case "1일 사이트 접근 불허": banTime = 86400000 * 1; break;
		case "3일 사이트 접근 불허": banTime = 86400000 * 3; break;
		case "5일 사이트 접근 불허": banTime = 86400000 * 5; break; }
		banList.setReleaseTime(new Timestamp(System.currentTimeMillis() + banTime));
		
		/*actionCode가 기각이 아닌 접근금지일 경우*/
		if(!actionCode.equals("신고기각")){
			if(daoBL.getBanListByM_id(m_id) == null){
				/*접근금지목록에 m_id에 해당하는 데이터가 존재하지 않을 경우 : 접근금지목록에 등록*/
				daoBL.registerBan(banList);
				
				/*회원상태 접근금지로 변경*/
				daoM.updateM_status(m_id);
			}else{
				/*접근금지목록에 m_id에 해당하는 데이터가 존재할 경우 : 추가제재내용만큼 기간 연장*/
				BanList existingBanList = daoBL.getBanListByM_id(m_id);
				
				long timeMillis = existingBanList.getReleaseTime().getTime() + banTime;
				existingBanList.setReleaseTime(new Timestamp(timeMillis));
				
				daoBL.renewReleaseTime(existingBanList);
			}
		}
		
		/*m_report + 1*/
		daoM.updateM_report(m_id);
		
		/*rep_id에 해당하는 신고글 Check처리*/
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("rep_id", rep_id);
		paramMap.put("actionCode", actionCode);
		paramMap.put("rep_checkTime", new Timestamp(System.currentTimeMillis()));
		daoBR.checkReportStatus(paramMap);
	}
}