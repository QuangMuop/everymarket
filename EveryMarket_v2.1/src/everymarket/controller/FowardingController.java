package everymarket.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import everymarket.dao.BlogDao;
import everymarket.dao.BoardQnaDao;
import everymarket.dao.MemberDao;
import everymarket.dao.ProductDao;
import everymarket.dao.ReviewDao;
import everymarket.model.Blog;
import everymarket.model.BoardQna;
import everymarket.model.Product;
import everymarket.object4output.BlogProduct;
import everymarket.object4output.Object4Skitter;

@Controller
public class FowardingController {
	private BlogDao daoB;
	private BoardQnaDao daoBQ;
	private MemberDao daoM;
	private ProductDao daoP;
	private ReviewDao daoR;

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
	public ModelAndView enter(){
		ModelAndView mav = new ModelAndView();
		
		String category = "All";
		String searchtext = "basic";
		
		List<Object4Skitter> listSkitter = getDataForSkitter();
		List<Product> listProduct = daoP.ListProduct(category, 5, searchtext);
		
 		mav.addObject("category", "All");
		mav.addObject("searchtext", "All");
		mav.addObject("listSkitter", listSkitter);
		mav.addObject("listProduct", listProduct);
		mav.setViewName("main");
		return mav;
	}
	
	@RequestMapping("/administer.go")
	public ModelAndView goAdminister(){

		return new ModelAndView("administer");
	}
	
	@RequestMapping("/qnaBoard.go")
	public ModelAndView goQnaBoard(){
		ModelAndView mav = new ModelAndView();
		List<BoardQna> listBoardQna = daoBQ.getQnaList();
		
		mav.addObject("listBoardQna", listBoardQna);
		mav.setViewName("qnaBoard");
		return mav;
	}
	
	public List<Object4Skitter> getDataForSkitter(){
		List<Object4Skitter> listSkitter = new ArrayList<Object4Skitter>();
		Object4Skitter o4s = null;
		
		int numberOfSkitter = 10;
		List<BlogProduct> listRandomM_id = daoM.getRandomM_idM_nameB_main(numberOfSkitter);
		
		for(int i=0; i<numberOfSkitter; i++){
			o4s = new Object4Skitter();
			
			BlogProduct randomMember = listRandomM_id.get(i); 
			o4s.setOwner_m_id(randomMember.getM_id());
			o4s.setOwner_m_nick(randomMember.getM_nick());
			o4s.setOwner_b_main(randomMember.getB_main());
			
			o4s.setListRecentProduct(daoP.getRecentProductByM_id(randomMember.getM_id()));
			o4s.setListRandomDangol(daoB.getRandomBlogByM_id(randomMember.getM_id()));
			o4s.setListRecentReview(daoR.getRecentReviewByM_id(randomMember.getM_id()));
			System.out.println(o4s);
			listSkitter.add(o4s);
		}
				
		return listSkitter;
	}
}
