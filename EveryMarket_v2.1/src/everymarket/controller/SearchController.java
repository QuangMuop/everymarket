package everymarket.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import everymarket.dao.SearchDao;
import everymarket.model.Product;
import everymarket.object4output.BlogProduct;

@Controller
public class SearchController {
	private SearchDao searchdao;

	public void setSearchdao(SearchDao searchdao) {
		this.searchdao = searchdao;
	}
	
	@RequestMapping(value="/search_result.do", method=RequestMethod.POST)
	public String search_result(Model model,@RequestParam("search_content") String search_content ){
		int product_count = searchdao.product_count(search_content);
		model.addAttribute("product_count", product_count);
		
		List<Product> searchProduct = searchdao.searchProduct(search_content);
		if(searchProduct.size() > 0){ model.addAttribute("searchProduct", searchProduct); }
		else{ model.addAttribute("searchProduct", null); }		
		
		int blog_count = searchdao.blog_count(search_content);
		model.addAttribute("blog_count", blog_count);
		
		List<BlogProduct> searchBlog = searchdao.searchBlog(search_content);
		if(searchBlog.size() > 0){ model.addAttribute("searchBlog", searchBlog); }
		else{ model.addAttribute("searchBlog", null); }
		
		return "search";
	}
	

}
