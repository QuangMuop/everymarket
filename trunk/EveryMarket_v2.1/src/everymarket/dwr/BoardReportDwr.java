package everymarket.dwr;

import java.util.HashMap;
import java.util.Map;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import everymarket.dao.BanListDao;
import everymarket.dao.BoardReportDao;
import everymarket.dao.MemberDao;

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
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("m_id", m_id);
		paramMap.put("rep_id", rep_id);
		
		/*actionCode에 따른 접근금지 기간 설정*/
		switch (actionCode) {
		case "ban_1days": paramMap.put("banTime", 1); break;
		case "ban_3days": paramMap.put("banTime", 3); break;
		case "ban_5days": paramMap.put("banTime", 5); break; }
		
		/*접근금지목록에 등록*/
		daoBL.registerBan(paramMap);
		
		daoM.setStatus_ban(m_id);
		
		/*r_id에 해당하는 신고글 Check처리*/
		daoBR.checkReportStatus(rep_id);
	}
}