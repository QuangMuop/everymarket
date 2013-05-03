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

import everymarket.dao.DangolDao;
import everymarket.dao.MemberDao;
import everymarket.model.Member;

@Controller
public class DangolController {
	private DangolDao daoD;
	private MemberDao daoM;

	public void setDaoD(DangolDao daoD) {
		this.daoD = daoD;
	}	
	public void setDaoM(MemberDao daoM) {
		this.daoM = daoM;
	}

	/*getJSON*/
	@RequestMapping("/getMyDangolList.do")
	public ModelAndView getMyDangolList(HttpServletRequest request){
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		Member member = (Member)session.getAttribute("member");
		Map<String, Object> resultmap = new HashMap<String, Object>();
		
		if(member != null){
			List<String> listDangolB_thumb = daoD.getDangolB_thumbByM_id(member.getM_id());
			
			resultmap.put("listDangolB_thumb", listDangolB_thumb);			
		}else{
			resultmap.put("error", "내 단골리스트를 확인하시려면 먼저 로그인을 해주세요! ^_^");
		}
		
		mav.addAllObjects(resultmap);
		mav.setViewName("jsonView");
		return mav;
	}
	
	/*getJSON*/
	@RequestMapping("/getOwnerDangolList.do")
	public ModelAndView getOwnerDangolList(@RequestParam("owner_id")String owner_id){
		ModelAndView mav = new ModelAndView();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		Member owner = daoM.getMemberByM_id(owner_id);
		List<String> listDangolB_thumb = daoD.getDangolB_thumbByM_id(owner_id);
		
		resultMap.put("owner", owner);
		resultMap.put("listDangolB_thumb", listDangolB_thumb);
		
		mav.addAllObjects(resultMap);
		mav.setViewName("jsonView");
		return mav;
	}
}
