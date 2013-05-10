package everymarket.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.jws.WebParam.Mode;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import everymarket.dao.MemberDao;
import everymarket.dao.ProductDao;
import everymarket.dao.TradeDao;

import everymarket.model.Member;
import everymarket.model.Trade;

@Controller
public class TradeController {

	private ProductDao daoP;
	private TradeDao daoT;
	private MemberDao daoM;

	public void setDaoM(MemberDao daoM) {
		this.daoM = daoM;
	}

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

	@RequestMapping(value = "/trade_list.do")
	public ModelAndView trade_list(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");

		String m_id = member.getM_id();

		// 나에 구매중인 물품들
		List<Trade> buyingList = daoT.getBuyingTrade(m_id);

		// 나에 판매중인 물품들
		List<Trade> sellingList = daoT.getSellingTrade(m_id);

		// 거래 완료된 산 물품들
		List<Trade> completeBList = daoT.getBCompleteList(m_id);
	

		// 거래 완료된 판 물품들
		List<Trade> completeSList = daoT.getSCompleteList(m_id);

		mav.addObject("buyingList", buyingList);
		mav.addObject("sellingList", sellingList);
		mav.addObject("completeBList", completeBList);		
		mav.addObject("completeSList", completeSList);

		mav.setViewName("trade_list");

		return mav;
	}

	@RequestMapping("/accept.do")
	public ModelAndView accept(@RequestParam("t_id") int t_id) {
		ModelAndView mav = new ModelAndView();
		Trade trade = daoT.getTrade(t_id);

		HashMap<String, Object> add_cash = new HashMap<>();
		/* try{ */
		add_cash.put("m_id", trade.getT_seller());
		add_cash.put("m_cash", trade.getP_price());

		int p_id = daoP.get_p_id(t_id);

		daoP.update_product_st(p_id);

		daoM.chargeCash(add_cash);

		HashMap<String, Object> sub_cash = new HashMap<>();
		sub_cash.put("m_id", trade.getT_buyer());
		sub_cash.put("p_price", trade.getP_price());
		daoM.subCash(sub_cash);

		int status = 4;

		daoT.update_status(trade.getT_id(), status);

		/* }catch (Exception e){ */
		/*
		 * mav.addObject("error", "거래가 완료되지 못했습니다");
		 * mav.setViewName("errorPage"); return mav; }
		 */
		mav.setViewName("trade_list");
		return mav;
	}

}
