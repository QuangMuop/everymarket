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
		switch (actionCode) {
		case "테스트용 : 20초": banList.setReleaseTime(new Timestamp(System.currentTimeMillis() + 86400000 / 4320)); break;
		case "1일 사이트 접근 불허": banList.setReleaseTime(new Timestamp(System.currentTimeMillis() + 86400000 * 1)); break;
		case "3일 사이트 접근 불허": banList.setReleaseTime(new Timestamp(System.currentTimeMillis() + 86400000 * 3)); break;
		case "5일 사이트 접근 불허": banList.setReleaseTime(new Timestamp(System.currentTimeMillis() + 86400000 * 5)); break; }

		/*접근금지목록에 등록*/
		daoBL.registerBan(banList);
		
		/*회원상태 접근금지로 변경*/
		daoM.setStatus_ban(m_id);

		/*r_id에 해당하는 신고글 Check처리*/
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("rep_id", rep_id);
		paramMap.put("actionCode", actionCode);
		daoBR.checkReportStatus(paramMap);
	}
}