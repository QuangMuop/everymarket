package everymarket.controller;

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
import everymarket.model.Jjim;
import everymarket.model.Member;

@Controller
public class JjimController {
	private BlogDao daoB;
	private JjimDao daoJ;

	public void setDaoB(BlogDao daoB) {
		this.daoB = daoB;
	}
	public void setDaoJ(JjimDao daoJ) {
		this.daoJ = daoJ;
	}
	
	@RequestMapping("/registerJjim.do")
	public ModelAndView registerJjim(HttpServletRequest request, @RequestParam("p_id")int p_id){
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("member");
		
		Jjim jjim = new Jjim();
		jjim.setJ_id(daoJ.getMaxJ_id() + 1);
		jjim.setM_id(member.getM_id());
		jjim.setP_id(p_id);
		jjim.setB_thumb(daoB.getB_thumbByM_id("aa"));
		
		daoJ.registerJjim(jjim);
		
		return null;
	}
	
	/*getJSON*/
	@RequestMapping("/refreshJjim.do")
	public ModelAndView refreshJjim(@RequestParam("p_id")int p_id){
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<Jjim> listJjim = daoJ.getJjimByP_id(p_id);
		
		map.put("listJjim", listJjim);
		
		mav.addAllObjects(map);
		mav.setViewName("jsonView");
		return mav;
	}
}
