package everymarket.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import everymarket.dao.BlogDao;
import everymarket.dao.CategoryDao;
import everymarket.dao.ProductDao;
import everymarket.model.Blog;
import everymarket.model.Category;
import everymarket.model.Member;
import everymarket.model.Product;

@Controller
public class ProductController {
	private BlogDao daoB;
	private ProductDao daoP;
	private CategoryDao daoC;

	public void setDaoB(BlogDao daoB) {
		this.daoB = daoB;
	}

	public void setDaoP(ProductDao daoP) {
		this.daoP = daoP;
	}

	public void setDaoC(CategoryDao daoC) {
		this.daoC = daoC;
	}

	@RequestMapping("/registerProduct.do")
	public ModelAndView registerProduct_sc(
			HttpServletRequest request,
			ModelAndView mav,
			Product product,
			@RequestParam(value = "uploadFile", required = false) MultipartFile uploadFile) {
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		String uploadDir = request.getServletContext().getRealPath(
				"image_product");
		System.out.println(uploadDir);

		try {
			/* Spring 파일업로드 구현 */
			String fileName = uploadFile.getOriginalFilename();
			uploadFile.transferTo(new File(uploadDir, fileName));
			product.setP_img(fileName);

			product.setP_id(daoP.getMaxP_id() + 1);
			product.setP_date(new Timestamp(System.currentTimeMillis()));
			product.setM_id(member.getM_id());

			daoP.registerProduct(product);
		} catch (IOException ioE) {
			ioE.printStackTrace();
		} catch (Exception E) {
			E.printStackTrace();
		}

		List<Product> listProduct = daoP.getProductListById(member.getM_id());
		mav.addObject("listProduct", listProduct);
		mav.setViewName("indivMarket");
		return mav;
	}

	/* getJSON */
	@RequestMapping("/getProductInfo.do")
	public ModelAndView getProductInfo(@RequestParam("p_id") int p_id) {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();

		Blog blog = daoB.getBlogByP_id(p_id);
		Product product = daoP.getProductById(p_id);
		List<Product> randomProducts = daoP.getRandomProductByP_id(p_id);

		map.put("blog", blog);
		map.put("product", product);
		map.put("randomProducts", randomProducts);

		mav.addAllObjects(map);
		mav.setViewName("jsonView");
		return mav;
	}

	// 카테고리내에 검색을 하던 하지않던 이곳으로 들어옵니다.
	@RequestMapping(value = "/list.do")
	public ModelAndView list(
			@RequestParam(value = "category", defaultValue = "All") String category,
			@RequestParam(value = "searchtext", defaultValue = "basic") String searchtext) {
		List<Product> listProduct = null;

		ModelAndView mav = new ModelAndView();

		// top의 카테고리를 뽑는 리스트 이건 맨위의 카테고리들이 나오는 거에요
		List<Category> catelist = daoC.CateList(category);

		listProduct = daoP.ListProduct(category, 5, searchtext);

		mav.setViewName("list");

		mav.setViewName("list");
		mav.addObject("category", category);
		mav.addObject("listProduct", listProduct);
		mav.addObject("catelist", catelist);
		mav.addObject("searchtext", searchtext);

		return mav;
	}

	// 메인에서 리스트를 뿌려줄때 사용합니다.
	@RequestMapping(value = "/main_list.do")
	public ModelAndView list2(
			@RequestParam(value = "category", defaultValue = "All") String category,
			@RequestParam(value = "searchtext", defaultValue = "basic") String searchtext) {
		List<Product> listProduct = null;

		ModelAndView mav = new ModelAndView();

		listProduct = daoP.ListProduct(category, 5, searchtext);
		System.out.println(listProduct.get(0).getP_id() + "1d");
		System.out.println(listProduct.get(2).getP_id() + "2d");

		mav.setViewName("main_list");
		
		mav.addObject("category", "All");
		mav.addObject("searchtext", "All");
		mav.addObject("listProduct", listProduct);

		return mav;
	}
}
