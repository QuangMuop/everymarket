package everymarket.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import everymarket.dao.ReviewDao;
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
}
