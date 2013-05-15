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

import everymarket.dao.JjimDao;
import everymarket.dao.MemberDao;
import everymarket.dao.ProductDao;
import everymarket.dao.TradeDao;

import everymarket.model.Member;
import everymarket.model.Product;
import everymarket.model.Trade;

@Controller
public class TradeController {

	private ProductDao daoP;
	private TradeDao daoT;
	private MemberDao daoM;
	private JjimDao daoJ;

	public void setDaoJ(JjimDao daoJ) {
		this.daoJ = daoJ;
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

	// �Ǹ�Ȯ�� ��ư�� ������ ���
	@RequestMapping(value = "/messageok.do", method = RequestMethod.POST)
	public ModelAndView trade_message_ok(HttpServletRequest request,
			@RequestParam(value = "p_id") int p_id) {
		ModelAndView mav = new ModelAndView();

		HashMap map = new HashMap();
		int status = 1;

		map.put("p_id", p_id);
		map.put("status", status);
		// trade���� �����Ű��
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

		// ���� �������� ��ǰ��
		List<Trade> buyingList = daoT.getBuyingTrade(m_id);

		// ���� �Ǹ����� ��ǰ��
		List<Trade> sellingList = daoT.getSellingTrade(m_id);

		// �ŷ� �Ϸ�� �� ��ǰ��
		List<Trade> completeBList = daoT.getBCompleteList(m_id);

		// �ŷ� �Ϸ�� �� ��ǰ��
		List<Trade> completeSList = daoT.getSCompleteList(m_id);

		// ���� ���ǵ�
		List<Product> jjimList = daoJ.getjjimList(m_id);

		int jjim_sum = 0;

		// ���� ���� �� ����
		if (daoJ.getjjim_sum(m_id) != null) {

			jjim_sum = (Integer) daoJ.getjjim_sum(m_id);
		}

		mav.addObject("buyingList", buyingList);
		mav.addObject("sellingList", sellingList);
		mav.addObject("completeBList", completeBList);
		mav.addObject("completeSList", completeSList);
		mav.addObject("jjimList", jjimList);
		mav.addObject("jjim_sum", jjim_sum);

		mav.setViewName("goMyPage");

		return mav;
	}

	@RequestMapping("/accept.do")
	public ModelAndView accept(@RequestParam("t_id") int t_id,
			HttpServletRequest request) {
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

		// �ŷ� �Ϸ� ����

		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("member");

		String m_id = member.getM_id();

		//
		// ���� �������� ��ǰ��
		List<Trade> buyingList = daoT.getBuyingTrade(m_id);

		// ���� �Ǹ����� ��ǰ��
		List<Trade> sellingList = daoT.getSellingTrade(m_id);

		// �ŷ� �Ϸ�� �� ��ǰ��
		List<Trade> completeBList = daoT.getBCompleteList(m_id);

		// �ŷ� �Ϸ�� �� ��ǰ��
		List<Trade> completeSList = daoT.getSCompleteList(m_id);

		// ���� ���ǵ�
		List<Product> jjimList = daoJ.getjjimList(m_id);

		int jjim_sum = 0;

		// ���� ���� �� ����
		if (daoJ.getjjim_sum(m_id) != null) {

			jjim_sum = (Integer) daoJ.getjjim_sum(m_id);
		}

		mav.addObject("buyingList", buyingList);
		mav.addObject("sellingList", sellingList);
		mav.addObject("completeBList", completeBList);
		mav.addObject("completeSList", completeSList);
		mav.addObject("jjimList", jjimList);
		mav.addObject("jjim_sum", jjim_sum);

		/* }catch (Exception e){ */
		/*
		 * mav.addObject("error", "�ŷ��� �Ϸ���� ���߽��ϴ�");
		 * mav.setViewName("errorPage"); return mav; }
		 */

		mav.setViewName("goMyPage");
		return mav;
	}

	@RequestMapping("cashConfirm.do")
	public ModelAndView cashConfirm(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		if (session.getAttribute("m_id") != null) {
			String m_id = (String) session.getAttribute("m_id");
			Member member = daoM.getMemberByM_id(m_id);

			mav.setViewName("jsonView");
			mav.addObject("m_cash", member.getM_cash());

		} else {
			mav.setViewName("redirect:enter.go");
		}

		return mav;

	}
}
