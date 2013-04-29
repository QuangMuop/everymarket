package everymarket.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import everymarket.dao.CategoryDao;
import everymarket.model.Category;

@Controller
public class CategoryController {
	private CategoryDao daoCt;

	public void setDaoCt(CategoryDao daoCt) {
		this.daoCt = daoCt;
	}
	
	/*getJSON*/
	@RequestMapping("/getCategoryList.do")
	public ModelAndView getCategoryList(){
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<Category> listCategory = daoCt.getCategoryList();
		map.put("listCategory", listCategory);

		mav.addAllObjects(map);
		mav.setViewName("jsonView");
		return mav;
	}
}
