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

import everymarket.dao.BoardQnaDao;
import everymarket.model.BoardQna;
import everymarket.model.Member;

@Controller
public class BoardQnaController {
	private BoardQnaDao daoBQ;

	public void setDaoBQ(BoardQnaDao daoBQ) {
		this.daoBQ = daoBQ;
	}
	
	@RequestMapping("/insertQna.do")
	public ModelAndView insertQna(HttpServletRequest request, BoardQna boardQna){
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		Member member = (Member)session.getAttribute("member");
		
		boardQna.setQna_id(daoBQ.getMaxQna_id() + 1);
		boardQna.setQna_writer(member.getM_id());
		boardQna.setQna_regdate(new Timestamp(System.currentTimeMillis()));
		daoBQ.insertQna(boardQna);
		
		List<BoardQna> listBoardQna = daoBQ.getQnaList();
		
		mav.addObject("member", member);
		mav.addObject("listBoardQna", listBoardQna);
		mav.setViewName("qnaBoard");
		return mav;
	}
	
	@RequestMapping("/insertQnaAnswer.do")
	public ModelAndView insertQnaAnswer(BoardQna boardQna){
		ModelAndView mav = new ModelAndView();
		
		daoBQ.insertQnaAnswer(boardQna);
		
		mav.setViewName("qnaBoard");
		return mav;
	}
	
	@RequestMapping("/updateQna.do")
	public ModelAndView updateQna(BoardQna boardQna){
		ModelAndView mav = new ModelAndView();
		
		daoBQ.updateQna(boardQna);
		
		mav.setViewName("qnaBoard");
		return mav;
	}
	
	@RequestMapping("/deleteQna.do")
	public ModelAndView deleteQna(@RequestParam("qna_id")int qna_id){
		ModelAndView mav = new ModelAndView();
		
		daoBQ.deleteQna(qna_id);
		
		mav.setViewName("qnaBoard");
		return mav;
	}
	
//	/*getJSON*/
//	@RequestMapping("/refreshQna.do")
//	public ModelAndView refreshBoardQnaList(HttpServletRequest request){
//		HttpSession session = request.getSession();
//		ModelAndView mav = new ModelAndView();
//		
//		List<BoardQna> listBoardQna = daoBQ.getQnaList();
//		Member member = (Member)session.getAttribute("member");
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("listBoardQna", listBoardQna);
//		map.put("member", member);
//		
//		mav.addAllObjects(map);
//		mav.setViewName("jsonView");
//		return mav;
//	}
}
