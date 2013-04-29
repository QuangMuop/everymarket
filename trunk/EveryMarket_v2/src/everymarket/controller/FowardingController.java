package everymarket.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import everymarket.dao.ProductDao;
import everymarket.model.Product;

@Controller
public class FowardingController {
	private ProductDao daoP;

	public void setDaoP(ProductDao daoP) {
		this.daoP = daoP;
	}
	
	@RequestMapping("/enter.go")
	public ModelAndView enter(){
		ModelAndView mav = new ModelAndView();
		
		String category = "All";
		String searchtext = "basic";
		
		List<Product> listProduct = daoP.ListProduct(category, 5, searchtext);
		
		mav.addObject("category", "All");
		mav.addObject("searchtext", "All");
		mav.addObject("listProduct", listProduct);
		mav.setViewName("main");
		return mav;
	}
	
	@RequestMapping("/administer.go")
	public ModelAndView goAdminister(){
		return new ModelAndView("administer");
	}
	
	@RequestMapping("/qnaBoard.go")
	public ModelAndView goQnaBoard(){
		return new ModelAndView("qnaBoard");
	}
}
