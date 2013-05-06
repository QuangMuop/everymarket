package everymarket.controller;

import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import everymarket.dao.MessageDao;
import everymarket.dao.TradeDao;
import everymarket.model.Member;
import everymarket.model.Message;

@Controller
public class MessageController {
	private MessageDao messageDao;
	private TradeDao daoT;

	public void setDaoT(TradeDao daoT) {
		this.daoT = daoT;
	}

	public void setMessageDao(MessageDao messageDao) {
		this.messageDao = messageDao;
	}
	
	///////////////////구매요청///////////////////////
	
	@RequestMapping("/purchaseProduct.do")
	public ModelAndView purchaseProduct(HttpServletRequest request,
			@RequestParam("waitingTime") int waitingTime,
			@RequestParam("p_id") int p_id){
		ModelAndView mav = new ModelAndView();
		
	    HttpSession session = request.getSession();
	    Member member = (Member)session.getAttribute("member");
	    String m_id = member.getM_id();
	    
	    HashMap map = new HashMap<>();
	    map.put("m_id", m_id);
	    map.put("p_id", p_id);
		
	    HashMap map2 = messageDao.insert(map);

		messageDao.update_nick(m_id);
		messageDao.update_pname(p_id);
		
		int msg_id = (int) map2.get("msg_id");
	
		Date msg_date = (Date)map2.get("msg_date");
		
		HashMap map3 = new HashMap<>();
		map3.put("msg_id", msg_id);
		map3.put("msg_date", msg_date);
		map3.put("waitingTime", waitingTime);
		
		messageDao.updateMessage(map3);
		messageDao.update_p_status(p_id);
		
		daoT.insertTrade(map);
		daoT.update_t_seller(p_id);
		
	
		return mav;
	}
	

}
