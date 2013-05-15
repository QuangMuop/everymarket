package everymarket.controller;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import everymarket.dao.ReviewDao;
import everymarket.dao.TradeDao;
import everymarket.model.BoardReport;
import everymarket.model.Review;

@Controller
public class ReviewController {
	private ReviewDao daoR;
	private TradeDao daoT;
	


	public void setDaoT(TradeDao daoT) {
		this.daoT = daoT;
	}

	public void setDaoR(ReviewDao daoR) {
		this.daoR = daoR;
	}
	
	/*getJSON*/
	@RequestMapping("/getReviewList.do")
	public ModelAndView getReviewList(@RequestParam("m_id") String m_id){
		ModelAndView mav = new ModelAndView();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		int scoreSum = daoR.getScoreSumByM_id(m_id);
		int countReview = daoR.countReviewByM_id(m_id);
		List<Review> listReview = daoR.getReviewListByM_id(m_id);
		
		resultMap.put("scoreSum", scoreSum);
		resultMap.put("countReview", countReview);
		resultMap.put("listReview", listReview);
		
		mav.addAllObjects(resultMap);
		mav.setViewName("jsonView");
		return mav;
	}
	
	
	@RequestMapping(value = "/reviewAction.do", method = RequestMethod.POST)
	public ModelAndView report(Review review) {

		ModelAndView mav = new ModelAndView();

		
		review.setR_id(daoR.get_Review_MaxID() + 1);		
		review.setR_date(new Timestamp(System.currentTimeMillis()));
		
		
	/*	daoR.Insert_review(review);	*/
	    daoT.update_status_review(review.getP_id());

			
		

		mav.setViewName("trade_list.do");
		return mav;
		
	}
}
