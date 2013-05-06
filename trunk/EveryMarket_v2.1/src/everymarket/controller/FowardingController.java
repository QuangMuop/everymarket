package everymarket.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import everymarket.dao.BlogDao;
import everymarket.dao.BoardQnaDao;
import everymarket.dao.ProductDao;
import everymarket.model.Blog;
import everymarket.model.BoardQna;
import everymarket.model.Product;
import everymarket.object4output.Object4Skitter;

@Controller
public class FowardingController {
	private BoardQnaDao daoBQ;
	private ProductDao daoP;
	private BlogDao daoB;

	public void setDaoB(BlogDao daoB) {
		this.daoB = daoB;
	}
	public void setDaoBQ(BoardQnaDao daoBQ) {
		this.daoBQ = daoBQ;
	}
	public void setDaoP(ProductDao daoP) {
		this.daoP = daoP;
	}
	
	@RequestMapping("/enter.go")
	public ModelAndView enter(){
		ModelAndView mav = new ModelAndView();
		
		String category = "All";
		String searchtext = "basic";
		
		List<Product> listProduct = daoP.ListProduct(category, 5, searchtext);
		List<Blog> listBlog = daoB.getBlogList();
		
 		mav.addObject("category", "All");
		mav.addObject("searchtext", "All");
		mav.addObject("listProduct", listProduct);
		mav.addObject("blog",listBlog);
		mav.setViewName("main");
		return mav;
	}
	
	@RequestMapping("/administer.go")
	public ModelAndView goAdminister(){

		return new ModelAndView("administer");
	}
	
	@RequestMapping("/qnaBoard.go")
	public ModelAndView goQnaBoard(){
		ModelAndView mav = new ModelAndView();
		List<BoardQna> listBoardQna = daoBQ.getQnaList();
		
		mav.addObject("listBoardQna", listBoardQna);
		mav.setViewName("qnaBoard");
		return mav;
	}
	
	/*getJSON*/
	@RequestMapping("/getDataForSkitter.do")
	public List<Object4Skitter> getDataForSkitter(){
		List<Object4Skitter> listSkitter = new ArrayList<Object4Skitter>();
		
		return listSkitter;
	}
}
