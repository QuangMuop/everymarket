package everymarket.controller;

import java.sql.Timestamp;
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
import everymarket.dao.CommentsDao;
import everymarket.model.Comments;
import everymarket.model.Member;

@Controller
public class CommentsController {
	private BlogDao daoB;
	private CommentsDao daoC;

	public void setDaoB(BlogDao daoB) {
		this.daoB = daoB;
	}
	public void setDaoC(CommentsDao daoC) {
		this.daoC = daoC;
	}
	
	/*AjaxForm*/
	@RequestMapping("/registerComments.do")
	public String registerComment(HttpServletRequest request, Comments comments){
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("member");

		comments.setC_id(daoC.getMaxC_id() + 1);
		comments.setC_thumb(daoB.getBlogByM_id(member.getM_id()).getB_thumb());
		comments.setC_name(member.getM_name());
		comments.setC_date(new Timestamp(System.currentTimeMillis()));
		comments.setP_id((Integer)comments.getP_id());
		comments.setM_id(member.getM_id());
		
		daoC.registerComments(comments);
		
		return "전송완료!";
	}
	
	/*getJSON*/
	@RequestMapping("/refreshComments.do")
	public ModelAndView refreshComments(@RequestParam("p_id")int p_id){
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<Comments> listComments = daoC.getCommentsByP_id(p_id);
		map.put("listComments", listComments);

		mav.addAllObjects(map);
		mav.setViewName("jsonView");
		return mav;
	}
}
