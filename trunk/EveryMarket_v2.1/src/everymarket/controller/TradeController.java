package everymarket.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import everymarket.dao.ProductDao;
import everymarket.dao.TradeDao;


import everymarket.model.Member;
import everymarket.model.Trade;

@Controller
public class TradeController {

	private ProductDao daoP;
	private TradeDao daoT;

	public void setDaoP(ProductDao daoP) {
		this.daoP = daoP;
	}

	public void setDaoT(TradeDao daoT) {
		this.daoT = daoT;
	}
	

	// 판매확인 버튼을 눌렀을 경우
	@RequestMapping(value = "/messageok.do", method = RequestMethod.POST)
	public ModelAndView trade_message_ok(HttpServletRequest request,
			@RequestParam(value = "p_id") int p_id) {
		ModelAndView mav = new ModelAndView();

		HashMap map = new HashMap();
		int status = 1;

		map.put("p_id", p_id);
		map.put("status", status);
		// trade상태 변경시키기
		daoP.trade_status_update(map);

		mav.setViewName("trade_list");

		return null;
	}

	@RequestMapping(value = "/trade_list.do", method = RequestMethod.GET)
	public ModelAndView trade_list(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();
		/* Member member = (Member) request.getSession(); */
		Member member = new Member();
		member.setM_id("ee");
		String m_id = member.getM_id();
		
		//나에 구매중인 물품들
		List<Trade> buyingList = daoT.getBuyingTrade(m_id);
		
		//나에 판매중인 물품들 
		List<Trade> sellingList = daoT.getSellingTrade(m_id);
		
	
		mav.addObject("buyingList", buyingList);
		mav.addObject("sellingList", sellingList);
		mav.setViewName("trade_list");

		return mav;
	}
	
/*	@RequestMapping(value ="/deliver_number.do")
	public ModelAndView 
*/
}
