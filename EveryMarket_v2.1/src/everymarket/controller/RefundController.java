package everymarket.controller;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import everymarket.dao.MemberDao;
import everymarket.dao.RefundDao;
import everymarket.model.Member;
import everymarket.model.Refund;

@Controller
public class RefundController {
	private MemberDao daoM;
	private RefundDao daoRef;

	public void setDaoM(MemberDao daoM) {
		this.daoM = daoM;
	}
	public void setDaoRef(RefundDao daoRef) {
		this.daoRef = daoRef;
	}
	
	@RequestMapping("/refundCash.do")
	public ModelAndView refundAmount(HttpServletRequest request,
			@RequestParam("refundAmount")int refundAmount,
			@RequestParam("bankName")String bankName,
			@RequestParam("refundAccount")String refundAccount,
			@RequestParam("refundName")String refundName){
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();

		Member member = (Member)session.getAttribute("member");
		member.setM_cash(member.getM_cash() - refundAmount);
		daoM.updateM_cash(member);
		
		int refundFeeRate = 0;
		
		switch (refundAmount) {
		case 1000: refundFeeRate = 10; break;
		case 5000: refundFeeRate = 8; break;
		case 10000: refundFeeRate = 6; break;
		case 50000: refundFeeRate = 5; break;
		case 100000: refundFeeRate = 4; break;
		case 500000: refundFeeRate = 3; break;
		case 1000000: refundFeeRate = 2; break;
		case 2000000: refundFeeRate = 1; break; }

		int refundFee = refundAmount * refundFeeRate / 100;

		Refund refund = new Refund();
		refund.setRef_id(daoRef.getMaxRef_id() + 1);
		refund.setM_id(member.getM_id());
		refund.setRef_refundAmount(refundAmount - refundFee);
		refund.setRef_refundFee(refundFee);
		refund.setRef_bankName(bankName);
		refund.setRef_account(refundAccount);
		refund.setRef_accountName(refundName);
		refund.setRef_requestDate(new Timestamp(System.currentTimeMillis()));
		
		try{
			daoRef.registerRefund(refund);
			mav.setViewName("redirect:enter.go");
		}catch(Exception e){
			mav.addObject("error", "문제가 발생하였습니다.");
			mav.setViewName("errorPage");
		}
		
		return mav;
	}
	
	/*getJSON*/
	@RequestMapping("/callListRefund.do")
	public ModelAndView callListRefund(){
		ModelAndView mav = new ModelAndView();
		Map<String, Object> resultMap = new HashMap<String, Object>();

		resultMap.put("totalFee", daoRef.getTotalFee());
		resultMap.put("uncheckedRefundList", daoRef.getUncheckedRefundList());
		resultMap.put("checkedRefundList", daoRef.getCheckedRefundList());

		mav.addAllObjects(resultMap);
		mav.setViewName("jsonView");
		return mav;
	}
}
