package everymarket.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@RequestMapping("/login.do")
	public ModelAndView login_sc(HttpServletRequest request, ModelAndView mav,
			@RequestParam("m_id")String m_id, 
			@RequestParam("m_pwd")String m_pwd){
		System.out.println("しししししし");
		HttpSession session = request.getSession();
		HashMap<String, String> member_map = new HashMap<String, String>();
		member_map.put("m_id", m_id);
		member_map.put("m_pwd", m_pwd);
		
		Member member = daoM.loginMember(member_map);
		if(member != null){
			session.setAttribute("member", member);
			mav.setViewName("main");
			return mav;
		}else{
			mav.addObject("error", "稽益昔拭 叔鳶馬心柔艦陥.");
			return mav;
		}
	}
	
	/*getJSON*/
	/*噺据亜脊Form Validation Check*/
	@RequestMapping("/tryRegister.do")
	public ModelAndView tryRegister( 
		@RequestParam("input") String input, 
		@RequestParam("value") String value){
		ModelAndView mav = new ModelAndView();
		
		if(input.equals("m_id")){		
			if(value.length()<4 || value.length()>8){
				mav.addObject("errorId", 1);
				mav.addObject("error_reid", "焼戚巨澗 4切 戚雌 8切 戚馬");
			}if(daoM.idConfirm(value) != null){
				mav.addObject("errorId", 1);
				mav.addObject("error_reid", "掻差吉 焼戚巨 脊艦陥");
			}
		}
		
		if(input.equals("m_nick")){
			if(value.length()<2	 || value.length()>10){
				mav.addObject("errorNick", 2);
				mav.addObject("error_renick", "莞革績精 2切 戚雌 10切 戚馬");
			}
		}
				
		if(input.equals("m_pwd")){
			if(value.length() < 4 || value.length()>10){
				mav.addObject("errorPwd", 3); 
				mav.addObject("error_repwd", "搾腔腰硲澗 4切 戚雌 10切 戚馬");
			}
		}

		mav.setViewName("jsonView");
		return mav;
	}
	
	/*getJSON*/
	/*噺据亜脊Form 搾腔腰硲 Check*/
	@RequestMapping("/confirmPwd.do")
	public ModelAndView confirmPwd(
			@RequestParam("input")String input, 
			@RequestParam("value")String value, 
			@RequestParam("con_value")String con_value){
		ModelAndView mav = new ModelAndView();
		
		if(input.equals("m_pwdConfirm")){
			if(!value.equals(con_value)){
				mav.addObject("errorConPwd",4);
				mav.addObject("error_reconpwd", "搾腔腰硲亜 析帖馬走 省柔艦陥");
			}
		}
		
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="/registerMember.do", method=RequestMethod.POST)
	public ModelAndView registerMember(HttpServletRequest request, Member member){
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		System.out.println("1234141");
		if(daoM.idConfirm(member.getM_id()) != null){
			mav.addObject("error", "焼戚巨亜 掻差鞠醸柔艦陥.");
			mav.setViewName("errorPage");
			return mav;
		}
		
		try{
			daoM.registerMember(member);
			session.setAttribute("member", member);
			mav.setViewName("main");
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		return mav;
	}
	
	@RequestMapping("/chargeCash.do")
	public ModelAndView chargeCash(HttpServletRequest request,
			@RequestParam("m_cash")String m_cash){
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("member");
	
		int cash = Integer.parseInt(m_cash);
	
		HashMap<String, Object> cash_map = new HashMap<String, Object>();
		cash_map.put("m_id", member.getM_id());
		cash_map.put("m_cash", cash);
		
		try{
			daoM.chargeCash(cash_map);
			mav.setViewName("main");
		}catch(Exception e){
			mav.addObject("error", "庚薦亜 降持馬心柔艦陥.");
			mav.setViewName("errorPage");
		}
		
		return mav;	
	}
	
	@RequestMapping("/goMarket.do")
	public ModelAndView goMarket(HttpServletRequest request, ModelAndView mav, 
			@RequestParam("m_id")String m_id){
		Member owner = daoM.getMemberByM_id(m_id);
		if(owner != null){
			List<Product> listProduct = daoP.getProductListById(m_id);
			
			mav.addObject("listProduct", listProduct);
			mav.addObject("owner", owner);
			mav.setViewName("indivMarket");
		}else{
			mav.addObject("error", "析帖馬澗 id 蒸製");
		}
		
		return mav;
	}
	
	@RequestMapping("/logout.do")
	public ModelAndView logout(HttpServletRequest request){
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		
		session.setAttribute("member", null);
		
		mav.setViewName("main");
		return mav;
	}
}
