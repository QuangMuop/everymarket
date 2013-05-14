package everymarket.dwr;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import everymarket.dao.BoardReportDao;
import everymarket.dao.DangolDao;
import everymarket.dao.MemberDao;
import everymarket.dao.ProductDao;
import everymarket.dao.TradeDao;
import everymarket.model.BoardReport;
import everymarket.model.Dangol;
import everymarket.model.Member;

public class IndivMarketDwr {
	private BoardReportDao daoBR;
	private DangolDao daoD;
	private MemberDao daoM;
	private ProductDao daoP;
	private TradeDao daoT;

	public void setDaoBR(BoardReportDao daoBR) {
		this.daoBR = daoBR;
	}
	public void setDaoD(DangolDao daoD) {
		this.daoD = daoD;
	}
	public void setDaoM(MemberDao daoM) {
		this.daoM = daoM;
	}
	public void setDaoP(ProductDao daoP) {
		this.daoP = daoP;
	}
	public void setDaoT(TradeDao daoT) {
		this.daoT = daoT;
	}
	
	public Member getMemberByB_thumb(String b_thumb) {
		return daoM.getMemberByB_thumb(b_thumb);
	}
	
	public Member getMemberByM_id(String m_id){
		return daoM.getMemberByM_id(m_id);
	}
	
	public String getP_nameByP_id(int p_id){
		return daoP.getP_nameByP_id(p_id);
	}
	
	public String getM_nameByP_id(int p_id){
		return daoT.getM_nameByP_id(p_id);
	}
	
	public BoardReport checkAlreadyReported(String m_id, HttpServletRequest request){
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("member");
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("rep_writer", member.getM_id());
		paramMap.put("rep_memberId", m_id);
		
		return daoBR.checkAlreadyReported(paramMap);
	}
	
	public int updateEventCash(int eventCash, HttpServletRequest request){
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("member");
		
		int m_cash = member.getM_cash() + eventCash;
		member.setM_cash(m_cash);

		daoM.updateEventCash(member);
		return m_cash;
	}
	
	public int checkDangol(String owner_id, HttpServletRequest request){
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("member");
		
		Dangol dangol = new Dangol();
		dangol.setM_id(member.getM_id());
		dangol.setDg_id(owner_id);
		
		int result = 0; 
		
		if(daoD.checkDangol(dangol) != null){ result = 1; }
		if(owner_id.equals(member.getM_id())){ result = -1; }

		return result;
	}
	
	public void registerDangol(String owner_id, HttpServletRequest request){
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("member");
		
		Dangol dangol = new Dangol();
		dangol.setD_id(daoD.getMaxD_id() + 1);
		dangol.setM_id(member.getM_id());
		dangol.setDg_id(owner_id);
		
		daoD.registerDangol(dangol);
	}
	
	public void deleteDangol(String owner_id, HttpServletRequest request){
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("member");
		
		Dangol dangol = new Dangol();
		dangol.setM_id(member.getM_id());
		dangol.setDg_id(owner_id);
		
		daoD.deleteDangol(dangol);
	}
}
