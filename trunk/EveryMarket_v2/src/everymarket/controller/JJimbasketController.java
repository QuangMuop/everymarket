package everymarket.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import everymarket.dao.JjimbasketDao;
import everymarket.model.Member;
import everymarket.object4output.JjimResult;

@Controller
public class JJimbasketController {
	private JjimbasketDao daoJ;

	public void setDaoJ(JjimbasketDao daoJ) {
		this.daoJ = daoJ;
	}

	@RequestMapping("/JJimbasket.do")
	public ModelAndView sessioncheck(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		//���� �� ���
		ArrayList<JjimResult> listBuy = new ArrayList<JjimResult>();
		//���� �� ���
		ArrayList<JjimResult> listSell = new ArrayList<JjimResult>();
		//���� ���� ���
		ArrayList<JjimResult> listJJim = new ArrayList<JjimResult>();
		
		//�̰Ŵ� member�� �������� �޾ƾ��ϴµ� ���� ��� �ϴ� �������� ���ǹ����� �������ǿ� ~
		Member member1 = new Member();
		member1.setM_id("gg");
		member1.setM_nick("��Ű����");
		member1.setM_name("����");
		member1.setM_pwd("gg1234");
		member1.setM_pno("8908111214748");
		member1.setM_phone("01021207487");
		member1.setM_cash(6000);
		
		session.setAttribute("member", member1);
		//������ �������ǿ� 
		
		Member member = (Member) session.getAttribute("member");
		
		//���� �� ���
		listBuy = daoJ.buyList(member.getM_id());
		int size_JRListBuy = listBuy.size();
		//���� �� ���
		listSell = daoJ.SellList(member.getM_id());
		int size_JRListSell = listSell.size();
		//���� ���� ���
		listJJim = daoJ.JjimList(member.getM_id());
		int size_JRListJJim = listJJim.size();
		
		//�߰��ϱ�  jjimbasket.jsp���Ͽ��� �ѷ��� �͵��̿��� jsp���� ������ ���̶� �Ȱ����ϴ�
		//css���ϸ� ������ ���� �߰��ϸ� �Ȱ��� ���ðŰ��ƿ� 
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
