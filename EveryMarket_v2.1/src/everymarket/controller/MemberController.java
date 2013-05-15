package everymarket.controller;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import everymarket.dao.BanListDao;
import everymarket.dao.BlogDao;
import everymarket.dao.BoardReportDao;
import everymarket.dao.DangolDao;
import everymarket.dao.MemberDao;
import everymarket.dao.ProductDao;
import everymarket.dao.ReviewDao;
import everymarket.dao.TradeDao;
import everymarket.model.BanList;
import everymarket.model.Blog;
import everymarket.model.Member;
import everymarket.model.Product;

@Controller
public class MemberController {
	private BlogDao daoB;
	private BanListDao daoBL;
	private BoardReportDao daoBR;
	private DangolDao daoD;
	private MemberDao daoM;
	private ProductDao daoP;
	private ReviewDao daoR; 
	private TradeDao daoT;
	

	public void setDaoT(TradeDao daoT) {
		this.daoT = daoT;
	}
	public void setDaoB(BlogDao daoB) {
		this.daoB = daoB;
	}
	public void setDaoBL(BanListDao daoBL) {
		this.daoBL = daoBL;
	}
	public void setDaoBR(BoardReportDao daoBR) {
		this.daoBR = daoBR;
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
		daoBL.deleteExpiredBanList();
		HttpSession session = request.getSession();
		HashMap<String, String> member_map = new HashMap<String, String>();
		member_map.put("m_id", m_id);
		member_map.put("m_pwd", m_pwd);
		
		Member member = daoM.loginMember(member_map);
		BanList banList = daoBL.getBanListByM_id(m_id);

		if(member != null){
			if(banList != null){
				String banReason = daoBR.getRep_reasonByRep_id(banList.getRep_id());
				long remainingTime = getRemainingTime(m_id);
				
				mav.addObject("banReason", banReason);
				mav.addObject("tempMember", member);
				mav.addObject("remainingTime", remainingTime);
				mav.setViewName("noticeBan");
				return mav;
			}
			session.setAttribute("member", member);

			session.setAttribute("m_id", m_id);
			mav.setViewName("redirect:enter.go");



			return mav;
		}else{
			mav.addObject("error", "로그인에 실패하였습니다.");
			return mav;
		}
	}
	
	//아이디 찾기
	@RequestMapping("/find_ID.do")
	public ModelAndView findID(@RequestParam("m_name") String m_name, @RequestParam("m_email") String m_email){
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("m_name", m_name);
		map.put("m_email", m_email);
		
		String m_id = daoM.find_ID(map);
		
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("m_id", m_id);
		
		mav.addAllObjects(map2);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	//회원정보 수정
	@RequestMapping("/memberinfo_change.do")
	public ModelAndView memberinfo_change(@RequestParam("m_id") String m_id, @RequestParam("re_password") String re_password,
			@RequestParam("m_email") String m_email, @RequestParam("m_phone") String m_phone){
		ModelAndView mav = new ModelAndView();

		HashMap map = new HashMap<>();
		map.put("m_id", m_id);
		map.put("re_password", re_password);
		map.put("m_email", m_email);
		map.put("m_phone", m_phone);
		
		daoM.memberinfo_change(map);
		
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping("/restPoint.do")
	public ModelAndView rest_Point(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("member");
		String m_id = member.getM_id();
		
		int member_point = daoT.member_point(m_id);
		int trade_point = daoT.trade_point(m_id);

		int rest_point = (member_point)-(trade_point);
		
		HashMap map = new HashMap<>();
		map.put("rest_point", rest_point);
		
		mav.addAllObjects(map);
		
		mav.setViewName("jsonView");
		return mav;
	}
	
	/*getJSON*/
	/*회원가입Form Validation Check*/
	@RequestMapping("/tryRegister.do")
	public ModelAndView tryRegister( 
		@RequestParam("input") String input, 
		@RequestParam("value") String value){
		ModelAndView mav = new ModelAndView();
		
		if(input.equals("m_id")){		
			if(value.length()<2 || value.length()>8){
				mav.addObject("errorId", 1);
				mav.addObject("error_reid", "아이디는 2자 이상 8자 이하");
			}if(daoM.idConfirm(value) != null){
				mav.addObject("errorId", 1);
				mav.addObject("error_reid", "중복된 아이디 입니다");
			}
		}
		
		if(input.equals("m_nick")){
			if(value.length()<2	 || value.length()>10){
				mav.addObject("errorNick", 2);
				mav.addObject("error_renick", "닉네임은 2자 이상 10자 이하");
			}
		}
				
		if(input.equals("m_pwd")){
			if(value.length() < 4 || value.length()>10){
				mav.addObject("errorPwd", 3); 
				mav.addObject("error_repwd", "비밀번호는 4자 이상 10자 이하");
			}
		}

		mav.setViewName("jsonView");
		return mav;
	}
	
	/*getJSON*/
	/*회원가입Form 비밀번호 Check*/
	@RequestMapping("/confirmPwd.do")
	public ModelAndView confirmPwd(
			@RequestParam("input")String input, 
			@RequestParam("value")String value, 
			@RequestParam("con_value")String con_value){
		ModelAndView mav = new ModelAndView();
		
		if(input.equals("m_pwdConfirm")){
			if(!value.equals(con_value)){
				mav.addObject("errorConPwd",4);
				mav.addObject("error_reconpwd", "비밀번호가 일치하지 않습니다");
			}
		}
		
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="/registerMember.do", method=RequestMethod.POST)
	public ModelAndView registerMember(HttpServletRequest request, Member member){
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();

		if(daoM.idConfirm(member.getM_id()) != null){
			mav.addObject("error", "아이디가 중복되었습니다.");
			mav.setViewName("errorPage");
			return mav;
		}
		
		try{
			daoM.registerMember(member);
			session.setAttribute("member", member);
			mav.setViewName("redirect:enter.go");
			
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
			mav.setViewName("redirect:enter.go");
		}catch(Exception e){
			mav.addObject("error", "문제가 발생하였습니다.");
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
			mav.addObject("error", "일치하는 id 없음");
			mav.setViewName("main");
		}
		
		return mav;
	}
	
	@RequestMapping("/logout.do")
	public ModelAndView logout(HttpServletRequest request){
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		session.setAttribute("list", null);
		session.setAttribute("member", null);
		List<Blog> listBlog = daoB.getBlogList();
		
		mav.addObject("blog",listBlog);
		mav.setViewName("redirect:enter.go");
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
		
		/*세션값이 존재하지 않을 때*/ int status = 0;
		
		if(member != null){
			/*세션값이 존재할 때*/ status += 1;
			
			if(member.getM_id().equals(owner_id)){
				/*세션값과 마켓페이지 아이디가 일치할 때*/ status += 1;
			}
		}
			
		resultMap.put("status", status);
		
		mav.addAllObjects(resultMap);
		mav.setViewName("jsonView");
		return mav;
	}

	/*getJSON*/
	@RequestMapping("getChargeDate.do")
	public ModelAndView getChargeDate(){
		ModelAndView mav = new ModelAndView();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		Timestamp chargeDate = new Timestamp(System.currentTimeMillis());
		resultMap.put("chargeDate", chargeDate);
		
		mav.addAllObjects(resultMap);
		mav.setViewName("jsonView");
		return mav;
	}
	
	/*getJSON*/
	@RequestMapping("getExpirationDate.do")
	public ModelAndView getExpirationDate(){
		ModelAndView mav = new ModelAndView();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		Timestamp expirationDate = new Timestamp(System.currentTimeMillis() + 432000000);
		resultMap.put("expirationDate", expirationDate);
		
		mav.addAllObjects(resultMap);
		mav.setViewName("jsonView");
		return mav;
	}
	
	/*getJSON*/
	@RequestMapping("getRandomKey.do")
	public ModelAndView getRandomKey(){
		ModelAndView mav = new ModelAndView();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		Random random = new Random();
		int randomKey = random.nextInt(999999);
		resultMap.put("randomKey", randomKey);
		
		System.out.println("발송된 인증번호: " + randomKey);
		
		mav.addAllObjects(resultMap);
		mav.setViewName("jsonView");
		return mav;
	}

	public int getRemainingTime(String m_id){
		Timestamp currentTime = new Timestamp(System.currentTimeMillis());
		Timestamp releaseTime = daoBL.getBanListByM_id(m_id).getReleaseTime();
		
		int remainingTime = (int)((releaseTime.getTime() - currentTime.getTime()) / 1000);

		return remainingTime; 
	}
}
