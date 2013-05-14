package everymarket.controller;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import everymarket.dao.BoardReportDao;
import everymarket.dao.MemberDao;
import everymarket.dao.ProductDao;
import everymarket.model.BoardReport;
import everymarket.model.Member;

@Controller
public class BoardReportController {
	private BoardReportDao daoBR;
	private MemberDao daoM;
	private ProductDao daoP;

	public ProductDao getDaoP() {
		return daoP;
	}

	public void setDaoP(ProductDao daoP) {
		this.daoP = daoP;
	}

	public void setDaoBR(BoardReportDao daoBR) {
		this.daoBR = daoBR;
	}

	public void setDaoM(MemberDao daoM) {
		this.daoM = daoM;
	}

	@RequestMapping("/reportMember.do")
	public ModelAndView reportMember(HttpServletRequest request,
			BoardReport boardReport) {
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		Member member = (Member) session.getAttribute("member");

		boardReport.setRep_id(daoBR.getMaxRep_id() + 1);
		boardReport.setRep_writer(member.getM_id());
		boardReport.setRep_regdate(new Timestamp(System.currentTimeMillis()));
		boardReport.setRep_productId(-1);
		boardReport.setRep_check("n");

		daoBR.registerReport(boardReport);

		mav.setViewName("redirect:goMarket.do?m_id="
				+ boardReport.getRep_memberId());
		return mav;
	}

	@RequestMapping("/reportProduct.do")
	public ModelAndView reportProduct(HttpServletRequest request,
			BoardReport boardReport) {
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		Member member = (Member) session.getAttribute("member");

		boardReport.setRep_id(daoBR.getMaxRep_id() + 1);
		boardReport.setRep_writer(member.getM_id());
		boardReport.setRep_regdate(new Timestamp(System.currentTimeMillis()));
		boardReport.setRep_memberId(daoM.getM_idByP_id(boardReport
				.getRep_productId()));
		boardReport.setRep_check("n");

		daoBR.registerReport(boardReport);

		mav.setViewName("redirect:goMarket.do?m_id="
				+ daoM.getM_idByP_id(boardReport.getRep_productId()));
		return mav;
	}

	/* getJSON */
	@RequestMapping("/callReportedList.do")
	public ModelAndView callReportedProductList() {
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

	/* getJSON */
	@RequestMapping("/callCheckedReportList.do")
	public ModelAndView callCheckedReportList() {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> resultMap = new HashMap<String, Object>();

		List<BoardReport> listCheckedReportList = daoBR.getCheckedReportList();
		resultMap.put("listCheckedReportList", listCheckedReportList);

		mav.addAllObjects(resultMap);
		mav.setViewName("jsonView");
		return mav;
	}

	// 거래 후 리폿하기
	@RequestMapping(value = "/reportAction.do", method = RequestMethod.POST)
	public ModelAndView report(HttpServletRequest request,
			BoardReport boardReport) {

		ModelAndView mav = new ModelAndView();
		
		System.out.println(boardReport.getRep_productId() + "하하");

		boardReport.setRep_id(daoBR.getMaxRep_id() + 1);

		boardReport.setRep_regdate(new Timestamp(System.currentTimeMillis()));
		boardReport.setRep_check("n");
		boardReport.setRep_type("t");
       
		
		
		daoBR.registerReport(boardReport);

		//물건과 트레이드 업데이트
		daoP.update_product_report(boardReport.getRep_productId());

		
		

		mav.setViewName("trade_list.do");
		return mav;
	}
}
