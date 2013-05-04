package everymarket.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import everymarket.dao.BlogDao;
import everymarket.dao.JjimDao;
import everymarket.dao.TradeDao;
import everymarket.model.Jjim;
import everymarket.model.Member;
import everymarket.object4output.JjimResult;

@Controller
public class JjimController {
	private BlogDao daoB;
	private JjimDao daoJ;

	public void setDaoB(BlogDao daoB) {
		this.daoB = daoB;
	}

	public void setDaoJ(JjimDao daoJ) {
		this.daoJ = daoJ;
	}

	@RequestMapping("/deleteJjim.do")
	public void deleteJjim(HttpServletRequest request,
			@RequestParam("p_id") int p_id) {
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		Map<String, Object> paramMap = new HashMap<String, Object>();

		paramMap.put("m_id", member.getM_id());
		paramMap.put("p_id", p_id);

		daoJ.deleteJjim(paramMap);
	}

	@RequestMapping("/registerJjim.do")
	public void registerJjim(HttpServletRequest request,
			@RequestParam("p_id") int p_id) {
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");

		Jjim jjim = new Jjim();
		jjim.setJ_id(daoJ.getMaxJ_id() + 1);
		jjim.setM_id(member.getM_id());
		jjim.setP_id(p_id);

		daoJ.registerJjim(jjim);
	}

	/* getJSON */
	@RequestMapping("/refreshJjim.do")
	public ModelAndView refreshJjim(@RequestParam("p_id") int p_id) {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();

		List<String> listB_thumb = daoJ.getB_thumbByP_id(p_id);

		map.put("listB_thumb", listB_thumb);

		mav.addAllObjects(map);
		mav.setViewName("jsonView");
		return mav;
	}

	@RequestMapping("/JJimbasket.do")
	public ModelAndView JjimList(HttpSession session) {

		ModelAndView mav = new ModelAndView();

		// ���� �� ���
		ArrayList<JjimResult> listBuy = new ArrayList<JjimResult>();
		// ���� �� ���
		ArrayList<JjimResult> listSell = new ArrayList<JjimResult>();
		// ���� ���� ���
		ArrayList<JjimResult> listJJim = new ArrayList<JjimResult>();

		Member member1 = new Member();

		member1.setM_id("gg");
		member1.setM_nick("��Ű����");
		member1.setM_name("����");
		member1.setM_pwd("gg1234");
		member1.setM_pno("8908111214748");
		member1.setM_phone("01021207487");
		member1.setM_cash(6000);

		session.setAttribute("member", member1);

		Member member = (Member) session.getAttribute("member");

		// ���� �� ���
		listBuy = daoJ.buyList(member.getM_id());
		int size_JRListBuy = listBuy.size();
		// ���� �� ���
		listSell = daoJ.SellList(member.getM_id());
		int size_JRListSell = listSell.size();
		// ���� ���� ���
		listJJim = daoJ.JjimList(member.getM_id());
		int size_JRListJJim = listJJim.size();

		// �߰��ϱ� jjimbasket.jsp���Ͽ��� �ѷ��� �͵��̿��� jsp���� ������ ���̶� �Ȱ����ϴ�
		// css���ϸ� ������ ���� �߰��ϸ� �Ȱ��� ���ðŰ��ƿ�
		mav.setViewName("JJimbasket");
		mav.addObject("listBuy", listBuy);
		mav.addObject("size_JRListBuy", size_JRListBuy);
		mav.addObject("listSell", listSell);
		mav.addObject("size_JRListSell", size_JRListSell);
		mav.addObject("listJJim", listJJim);
		mav.addObject("size_JRListJJim", size_JRListJJim);

		return mav;
	}
}
