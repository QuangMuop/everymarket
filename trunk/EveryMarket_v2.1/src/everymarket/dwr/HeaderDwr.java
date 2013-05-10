package everymarket.dwr;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import everymarket.dao.MemberDao;
import everymarket.dao.MessageDao;
import everymarket.model.Member;

public class HeaderDwr {
	private MemberDao daoM;
	private MessageDao daoMsg;

	public void setDaoM(MemberDao daoM) {
		this.daoM = daoM;
	}
	public void setDaoMsg(MessageDao daoMsg) {
		this.daoMsg = daoMsg;
	}

	public int getCount_unCheckedMessage(HttpServletRequest request){
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("member");
	 
		return daoMsg.getCount_unCheckedMessage(member.getM_id());
	}
}
