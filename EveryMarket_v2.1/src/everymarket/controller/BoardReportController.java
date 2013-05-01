package everymarket.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import everymarket.dao.BoardReportDao;
import everymarket.model.BoardReport;

@Controller
public class BoardReportController {
	private BoardReportDao daoBR;

	public void setDaoBR(BoardReportDao daoBR) {
		this.daoBR = daoBR;
	}
	
	/*getJSON*/
	@RequestMapping("/callReportedList.do")
	public ModelAndView callReportedProductList(){
		System.out.println("¿äÃ» µé¾î¿È");
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<BoardReport> listReportedProduct = daoBR.getReportedProduct();
		List<BoardReport> listReportedMember = daoBR.getReportedMember();
		
		map.put("listReportedProduct", listReportedProduct);
		map.put("listReportedMember", listReportedMember);
		
		mav.addAllObjects(map);
		mav.setViewName("jsonView");
		return mav;
	}
}
