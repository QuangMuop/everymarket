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
import everymarket.dao.MemberDao;
import everymarket.dao.ProductDao;
import everymarket.model.Blog;
import everymarket.model.Member;
import everymarket.model.Product;

@Controller
public class MemberController {
	private BlogDao daoB;
	private MemberDao daoM;
	private ProductDao daoP; 

	public void setDaoB(BlogDao daoB) {
		this.daoB = daoB;
	}
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
		System.out.println("������������");
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
			mav.addObject("error", "�α��ο� �����Ͽ����ϴ�.");
			return mav;
		}
	}
	
	/*getJSON*/
	/*ȸ������Form Validation Check*/
	@RequestMapping("/tryRegister.do")
	public ModelAndView tryRegister( 
		@RequestParam("input") String input, 
		@RequestParam("value") String value){
		ModelAndView mav = new ModelAndView();
		
		if(input.equals("m_id")){		
			if(value.length()<4 || value.length()>8){
				mav.addObject("errorId", 1);
				mav.addObject("error_reid", "���̵�� 4�� �̻� 8�� ����");
			}if(daoM.idConfirm(value) != null){
				mav.addObject("errorId", 1);
				mav.addObject("error_reid", "�ߺ��� ���̵� �Դϴ�");
			}
		}
		
		if(input.equals("m_nick")){
			if(value.length()<2	 || value.length()>10){
				mav.addObject("errorNick", 2);
				mav.addObject("error_renick", "�г����� 2�� �̻� 10�� ����");
			}
		}
				
		if(input.equals("m_pwd")){
			if(value.length() < 4 || value.length()>10){
				mav.addObject("errorPwd", 3); 
				mav.addObject("error_repwd", "��й�ȣ�� 4�� �̻� 10�� ����");
			}
		}

		mav.setViewName("jsonView");
		return mav;
	}
	
	/*getJSON*/
	/*ȸ������Form ��й�ȣ Check*/
	@RequestMapping("/confirmPwd.do")
	public ModelAndView confirmPwd(
			@RequestParam("input")String input, 
			@RequestParam("value")String value, 
			@RequestParam("con_value")String con_value){
		ModelAndView mav = new ModelAndView();
		
		if(input.equals("m_pwdConfirm")){
			if(!value.equals(con_value)){
				mav.addObject("errorConPwd",4);
				mav.addObject("error_reconpwd", "��й�ȣ�� ��ġ���� �ʽ��ϴ�");
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
			mav.addObject("error", "���̵� �ߺ��Ǿ����ϴ�.");
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
			mav.addObject("error", "������ �߻��Ͽ����ϴ�.");
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
			
			mav.addObject("listProduct", listProduct);
			mav.addObject("blog", blog);
			mav.addObject("owner", owner);
			mav.setViewName("indivMarket");
		}else{
			mav.addObject("error", "��ġ�ϴ� id ����");
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
		
		/*���ǰ��� �������� ���� ��*/ int status = 0;
		
		if(member != null){
			/*���ǰ��� ������ ��*/ status += 1;
			
			if(member.getM_id().equals(owner_id)){
				/*���ǰ��� ���������� ���̵� ��ġ�� ��*/ status += 1;
			}
		}
			
		resultMap.put("status", status);
		
		mav.addAllObjects(resultMap);
		mav.setViewName("jsonView");
		return mav;
	}
}