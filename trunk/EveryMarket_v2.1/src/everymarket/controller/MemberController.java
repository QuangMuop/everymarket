package everymarket.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import everymarket.dao.BlogDao;
import everymarket.dao.DangolDao;
import everymarket.dao.MemberDao;
import everymarket.dao.ProductDao;
import everymarket.dao.ReviewDao;
import everymarket.model.Blog;
import everymarket.model.Member;
import everymarket.model.Product;

@Controller
public class MemberController {
	private BlogDao daoB;
	private DangolDao daoD;
	private MemberDao daoM;
	private ProductDao daoP;
	private ReviewDao daoR; 

	public void setDaoB(BlogDao daoB) {
		this.daoB = daoB;
	}
	public void setDaoD(DangolDao daoD) {
		this.daoD = daoD;
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
	
	@RequestMapping("/login.do")
	public ModelAndView login_sc(HttpServletRequest request, ModelAndView mav,
			@RequestParam("m_id")String m_id, 
			@RequestParam("m_pwd")String m_pwd){
		System.out.println("しししししし");
		HttpSession session = request.getSession();
		HashMap<String, String> member_map = new HashMap<String, String>();
		member_map.put("m_id", m_id);
		member_map.put("m_pwd", m_pwd);
		List<Blog> listBlog = daoB.getBlogList();
		
		Member member = daoM.loginMember(member_map);
		if(member != null){
			session.setAttribute("member", member);
			mav.setViewName("main");
			mav.addObject("blog",listBlog);
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
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("member");
		Member owner = daoM.getMemberByM_id(m_id);

		
		if(owner != null){
			if(member != null){
				if(!member.getM_id().equals(owner.getM_id())){
					daoB.countB_hit(m_id);
				}
			}
			
			List<Product> listProduct = daoP.getProductListById(m_id);
			Blog blog = daoB.getBlogByM_id(m_id);
			int count_dangol = daoD.countDangolByM_id(m_id);
			int count_review = daoR.countReviewByM_id(m_id);
			
			mav.addObject("listProduct", listProduct);
			mav.addObject("blog", blog);
			mav.addObject("count_dangol", count_dangol);
			mav.addObject("count_review", count_review);
			mav.addObject("owner", owner);
			mav.setViewName("indivMarket");
		}else{
			mav.addObject("error", "析帖馬澗 id 蒸製");
			mav.setViewName("main");
		}
		
		return mav;
	}
	
	@RequestMapping("/logout.do")
	public ModelAndView logout(HttpServletRequest request){
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		
		session.setAttribute("member", null);
		List<Blog> listBlog = daoB.getBlogList();
		
		mav.addObject("blog",listBlog);
		mav.setViewName("main");
		return mav;
	}
	
	/*getJSON*/
	@RequestMapping("/callMemberList.do")
	public ModelAndView callMemberList(){
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();

		List<Member> listMember = daoM.getMemberList();
		map.put("listMember", listMember);
		
		mav.addAllObjects(map);
		mav.setViewName("jsonView");
		return mav;
	}
	
	/*getJSON*/
	@RequestMapping("/checkSession.do")
	public ModelAndView checkSession(HttpServletRequest request,
			@RequestParam("owner_id")String owner_id){
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		Member member = (Member)session.getAttribute("member");
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		/*室芝葵戚 糎仙馬走 省聖 凶*/ int status = 0;
		
		if(member != null){
			/*室芝葵戚 糎仙拝 凶*/ status += 1;
			
			if(member.getM_id().equals(owner_id)){
				/*室芝葵引 原掴凪戚走 焼戚巨亜 析帖拝 凶*/ status += 1;
			}
		}
			
		resultMap.put("status", status);
		
		mav.addAllObjects(resultMap);
		mav.setViewName("jsonView");
		return mav;
	}
}
