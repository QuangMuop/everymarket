package everymarket.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import everymarket.dao.ListDao;
import everymarket.model.Category;
import everymarket.model.Product;

@Controller
public class ListController {
	private ListDao daoL;

	public void setDaoL(ListDao daoL) {
		this.daoL = daoL;
	}
	
	//카테고리내에 검색을 하던 하지않던 이곳으로 들어옵니다. 
	@RequestMapping(value="/list.do")
	public ModelAndView list(@RequestParam(value="category") String category,
			@RequestParam(value="searchtext", defaultValue="basic") String searchtext){		
		List<Product> listProduct = null;
		
        ModelAndView mav = new ModelAndView();
        
        //top의 카테고리를 뽑는 리스트 이건 맨위의 카테고리들이 나오는 거에요
        List<Category> catelist = daoL.CateList(category);
              
        listProduct = daoL.ListProduct(category, 5, searchtext);
                   
        mav.setViewName("list");
        mav.addObject("category", category);
        mav.addObject("listProduct", listProduct);
        mav.addObject("catelist", catelist);
        mav.addObject("searchtext", searchtext);

        return mav;
	}
}