package everymarket.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import everymarket.dao.BlogDao;
import everymarket.dao.BoardQnaDao;
import everymarket.dao.JjimDao;
import everymarket.dao.MemberDao;
import everymarket.dao.ProductDao;
import everymarket.dao.ReviewDao;
import everymarket.dao.TradeDao;
import everymarket.model.BoardQna;
import everymarket.model.Member;
import everymarket.model.Product;
import everymarket.model.Trade;
import everymarket.object4output.BlogProduct;
import everymarket.object4output.Object4Skitter;

@Controller
public class FowardingController {
	private BlogDao daoB;
	private BoardQnaDao daoBQ;
	private MemberDao daoM;
	private ProductDao daoP;
	private ReviewDao daoR;
	private TradeDao daoT;
	private JjimDao daoJ;
	
	public void setDaoT(TradeDao daoT) {
		this.daoT = daoT;
	}

	public void setDaoJ(JjimDao daoJ) {
		this.daoJ = daoJ;
	}

	public void setDaoB(BlogDao daoB) {
		this.daoB = daoB;
	}

	public void setDaoBQ(BoardQnaDao daoBQ) {
		this.daoBQ = daoBQ;
	}

	public void setDaoM(MemberDao daoM) {
		this.daoM = daoM;
	}

	public void setDaoP(ProductDao daoP) {
		this.daoP = daoP;
	}

	public void setDaoR(ReviewDao daoR) {
		this.daoR = daoR;
	}

	@RequestMapping("/enter.go")
	public ModelAndView goMain() {
		ModelAndView mav = new ModelAndView();

		String category = "All";
		String searchtext = "basic";

		List<Object4Skitter> listSkitter = getDataForSkitter();
		List<Product> listProduct = daoP.ListProduct(category, 5, searchtext);

		//최저가 상품 
		Product product_min = daoP.getProduct_min();
	    //그 상품을 가진 멤버
		Member member_min = daoM.getProduct_min_nick(product_min.getM_id());
		String member_min_nick = member_min.getM_nick();

		mav.addObject("category", "All");
		mav.addObject("searchtext", "All");
		mav.addObject("listSkitter", listSkitter);
		mav.addObject("listProduct", listProduct);
		mav.addObject("member_min_nick", member_min_nick);

		//최저가 상품
		mav.addObject("product_min", product_min);

		mav.setViewName("main");
		return mav;
	}

	@RequestMapping("/goMyMarket.go")
	public ModelAndView goMyMarket(HttpServletRequest request) {
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		Member member = (Member) session.getAttribute("member");

		mav.setViewName("redirect:goMarket.do?m_id=" + member.getM_id());
		return mav;
	}
	
	
	//마이페이지 수정
	@RequestMapping("/goMyPage.go")
	public ModelAndView goMyPage(HttpServletRequest request) {
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		Member member = (Member) session.getAttribute("member");
		
		mav.setViewName("goMyPage");
		mav.addObject("member", member);
		
		////////////////////////////////////
		
		String m_id = member.getM_id();

		// 나에 구매중인 물품들
		List<Trade> buyingList = daoT.getBuyingTrade(m_id);

		// 나에 판매중인 물품들
		List<Trade> sellingList = daoT.getSellingTrade(m_id);

		// 거래 완료된 산 물품들
		List<Trade> completeBList = daoT.getBCompleteList(m_id);

		// 거래 완료된 판 물품들
		List<Trade> completeSList = daoT.getSCompleteList(m_id);

		// 찜한 물건들
		List<Product> jjimList = daoJ.getjjimList(m_id);

		int jjim_sum = 0;

		// 찜한 물건 총 가격
		if (daoJ.getjjim_sum(m_id) != null) {

			jjim_sum = (Integer) daoJ.getjjim_sum(m_id);
		}

		mav.addObject("buyingList", buyingList);
		mav.addObject("sellingList", sellingList);
		mav.addObject("completeBList", completeBList);
		mav.addObject("completeSList", completeSList);
		mav.addObject("jjimList", jjimList);
		mav.addObject("jjim_sum", jjim_sum);
		
		
		return mav;
	}

	@RequestMapping("/administer.go")
	public ModelAndView goAdminister() {

		return new ModelAndView("administer");
	}

	@RequestMapping("/qnaBoard.go")
	public ModelAndView goQnaBoard() {
		ModelAndView mav = new ModelAndView();
		List<BoardQna> listBoardQna = daoBQ.getQnaList();

		mav.addObject("listBoardQna", listBoardQna);
		mav.setViewName("qnaBoard");
		return mav;
	}

	public List<Object4Skitter> getDataForSkitter() {
		List<Object4Skitter> listSkitter = new ArrayList<Object4Skitter>();
		Object4Skitter o4s = null;

		int numberOfSkitter = 10;
		List<BlogProduct> listRandomM_id = daoM
				.getRandomM_idM_nameB_main(numberOfSkitter);

		for (int i = 0; i < numberOfSkitter; i++) {
			o4s = new Object4Skitter();

			BlogProduct randomMember = listRandomM_id.get(i);
			o4s.setOwner_m_id(randomMember.getM_id());
			o4s.setOwner_m_nick(randomMember.getM_nick());
			o4s.setOwner_b_main(randomMember.getB_main());

			o4s.setListRecentProduct(daoP.getRecentProductByM_id(randomMember
					.getM_id()));
			o4s.setListRandomDangol(daoB.getRandomBlogByM_id(randomMember
					.getM_id()));
			o4s.setListRecentReview(daoR.getRecentReviewByM_id(randomMember
					.getM_id()));

			listSkitter.add(o4s);
		}

		return listSkitter;
	}
	
}
