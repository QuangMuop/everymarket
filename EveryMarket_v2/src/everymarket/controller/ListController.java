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
	
	//ī�װ����� �˻��� �ϴ� �����ʴ� �̰����� ���ɴϴ�. 
	@RequestMapping(value="/list.do")
	public ModelAndView list(@RequestParam(value="category") String category,
			@RequestParam(value="searchtext", defaultValue="basic") String searchtext){		
		List<Product> listProduct = null;
		
        ModelAndView mav = new ModelAndView();
        
        //top�� ī�װ��� �̴� ����Ʈ �̰� ������ ī�װ����� ������ �ſ���
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