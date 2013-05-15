package everymarket.dwr;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import everymarket.dao.MemberDao;
import everymarket.model.Member;

public class MemberDwr {
	private MemberDao daoM;

	public void setDaoM(MemberDao daoM) {
		this.daoM = daoM;
	}
	
	public int getM_cashByM_id(HttpServletRequest request){
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("member");
		
		if(member == null){
			return 0;
		}else{
			return daoM.getM_cashByM_id(member.getM_id());
		}
	}
}
