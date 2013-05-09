package everymarket.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import everymarket.dao.BanListDao;
import everymarket.model.BanList;
import everymarket.model.Blog;
import everymarket.model.Product;
import everymarket.object4output.BannedMember;

@Controller
public class BanListController {
	private BanListDao daoBL;

	public void setDaoBL(BanListDao daoBL) {
		this.daoBL = daoBL;
	}
	
	/*getJSON*/
	@RequestMapping("/callListBannedMember.do")
	public ModelAndView callListBannedMember(){
		ModelAndView mav = new ModelAndView();
		Map<String, Object> resultMap = new HashMap<String, Object>();

		List<BannedMember> listBannedMemberList = daoBL.getListBannedMemberList();
		resultMap.put("listBannedMemberList", listBannedMemberList);

		mav.addAllObjects(resultMap);
		mav.setViewName("jsonView");
		return mav;
	}
}
