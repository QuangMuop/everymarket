package everymarket.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import everymarket.dao.MemberDao;
import everymarket.dao.ProductDao;
import everymarket.model.Member;
import everymarket.model.Product;

@Controller
public class MemberController {
	private MemberDao daoM;
	private ProductDao daoP; 

	public void setDaoM(MemberDao daoM) {
		this.daoM = daoM;
	}
	public void setDaoP(ProductDao daoP) {
		this.daoP = daoP;
	}
	
	@RequestMapping("/enter.do")
	public ModelAndView tempGo(){
		return new ModelAndView("main_template");
	}
	
	@RequestMapping("/goMarket.do")
	public ModelAndView goMarket_sc(HttpServletRequest request, ModelAndView mav, Member memberInput){
		HttpSession session = request.getSession();
		Member member = daoM.getMemberByM_id(memberInput.getM_id());
		if(member != null){
			List<Product> listProduct = daoP.getProductListById(memberInput.getM_id());
			
			session.setAttribute("member", member);
			mav.addObject("listProduct", listProduct);
			mav.setViewName("indivMarket");
		}else{
			mav.addObject("error", "일치하는 id 없음");
		}
		
		return mav;
	}
}
