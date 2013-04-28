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
		
		//내가 산 목록
		ArrayList<JjimResult> listBuy = new ArrayList<JjimResult>();
		//내가 판 목록
		ArrayList<JjimResult> listSell = new ArrayList<JjimResult>();
		//내가 찜한 목록
		ArrayList<JjimResult> listJJim = new ArrayList<JjimResult>();
		
		//이거는 member를 세션으로 받아야하는데 아직 없어서 일단 만들었어요 세션받으면 지워도되요 ~
		Member member1 = new Member();
		member1.setM_id("gg");
		member1.setM_nick("럭키가이");
		member1.setM_name("유석");
		member1.setM_pwd("gg1234");
		member1.setM_pno("8908111214748");
		member1.setM_phone("01021207487");
		member1.setM_cash(6000);
		
		session.setAttribute("member", member1);
		//요기까지 지워도되요 
		
		Member member = (Member) session.getAttribute("member");
		
		//내가 산 목록
		listBuy = daoJ.buyList(member.getM_id());
		int size_JRListBuy = listBuy.size();
		//내가 판 목록
		listSell = daoJ.SellList(member.getM_id());
		int size_JRListSell = listSell.size();
		//내가 찜한 목록
		listJJim = daoJ.JjimList(member.getM_id());
		int size_JRListJJim = listJJim.size();
		
		//추가하기  jjimbasket.jsp파일에서 뿌려줄 것들이에요 jsp파일 구조는 전이랑 똑같습니다
		//css파일만 저번에 껄로 추가하면 똑같이 나올거같아요 
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
