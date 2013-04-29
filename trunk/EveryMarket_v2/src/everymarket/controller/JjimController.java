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
	private TradeDao daoT;

	public void setDaoB(BlogDao daoB) {
		this.daoB = daoB;
	}

	public void setDaoJ(JjimDao daoJ) {
		this.daoJ = daoJ;
	}

	public void setDaoT(TradeDao daoT) {
		this.daoT = daoT;
	}

	@RequestMapping("/registerJjim.do")
	public ModelAndView registerJjim(HttpServletRequest request,
			@RequestParam("p_id") int p_id) {
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");

		Jjim jjim = new Jjim();
		jjim.setJ_id(daoJ.getMaxJ_id() + 1);
		jjim.setM_id(member.getM_id());
		jjim.setP_id(p_id);
		jjim.setB_thumb(daoB.getB_thumbByM_id("aa"));

		daoJ.registerJjim(jjim);

		return null;
	}

	/* getJSON */
	@RequestMapping("/refreshJjim.do")
	public ModelAndView refreshJjim(@RequestParam("p_id") int p_id) {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();

		List<Jjim> listJjim = daoJ.getJjimByP_id(p_id);

		map.put("listJjim", listJjim);

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
		listBuy = daoT.buyList(member.getM_id());
		int size_JRListBuy = listBuy.size();
		// ���� �� ���
		listSell = daoT.SellList(member.getM_id());
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
