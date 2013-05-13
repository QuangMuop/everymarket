package everymarket.dwr;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import everymarket.dao.MessageDao;
import everymarket.model.Member;

public class HeaderDwr {
	private MessageDao daoMsg;

	public void setDaoMsg(MessageDao daoMsg) {
		this.daoMsg = daoMsg;
	}
	
	public int getCount_unCheckedMessage(HttpServletRequest request){
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("member");

		if(member == null){
			return -1;
		}else{
			return daoMsg.getCount_unCheckedMessage(member.getM_id());
		}
	}
}
