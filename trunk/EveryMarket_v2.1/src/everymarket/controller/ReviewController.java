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
import everymarket.model.BoardReport;
import everymarket.model.Review;

@Controller
public class ReviewController {
	private ReviewDao daoR;

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
		System.out.println(review.getP_id() + "물건 아이디");
		System.out.println(review.getR_score() + "점수");
		System.out.println(review.getR_content() + "내용");
				
		System.out.println(daoR.get_Review_MaxID() + "리뷰아이디");
		
		
		review.setR_id(daoR.get_Review_MaxID() + 1);		
		review.setR_date(new Timestamp(System.currentTimeMillis()));
					
		daoR.Insert_review(review);	

		//물건과 트레이드 업데이트
			
		

		mav.setViewName("trade_list.do");
		return mav;
	}
}
