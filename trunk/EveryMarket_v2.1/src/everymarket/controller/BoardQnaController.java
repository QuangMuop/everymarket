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
	
	@RequestMapping("/answerQna.do")
	public ModelAndView answerQna(HttpServletRequest request, BoardQna boardQna){
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		Member member = (Member)session.getAttribute("member");

		daoBQ.answerQna(boardQna);
		
		List<BoardQna> listBoardQna = daoBQ.getQnaList();
		
		mav.addObject("member", member);
		mav.addObject("listBoardQna", listBoardQna);
		mav.setViewName("qnaBoard");
		return mav;
	}
	
	@RequestMapping("/updateQna.do")
	public ModelAndView updateQna(HttpServletRequest request, BoardQna boardQna){
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		Member member = (Member)session.getAttribute("member");
		
		daoBQ.updateQna(boardQna);
		
		List<BoardQna> listBoardQna = daoBQ.getQnaList();
		
		mav.addObject("member", member);
		mav.addObject("listBoardQna", listBoardQna);
		mav.setViewName("qnaBoard");
		return mav;
	}
	
	@RequestMapping("/deleteQna.do")
	public ModelAndView deleteQna(HttpServletRequest request,
			@RequestParam("qna_id")int qna_id){
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		Member member = (Member)session.getAttribute("member");
		
		daoBQ.deleteQna(qna_id);
		
		List<BoardQna> listBoardQna = daoBQ.getQnaList();
		
		mav.addObject("member", member);
		mav.addObject("listBoardQna", listBoardQna);
		mav.setViewName("qnaBoard");
		return mav;
	}

}