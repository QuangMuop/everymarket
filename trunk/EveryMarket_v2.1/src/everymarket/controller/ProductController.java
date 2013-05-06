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
import everymarket.dao.JjimDao;
import everymarket.dao.ProductDao;
import everymarket.model.Blog;
import everymarket.model.Category;
import everymarket.model.Member;
import everymarket.model.Product;

@Controller
public class ProductController {
	private BlogDao daoB;
	private CategoryDao daoC;
	private JjimDao daoJ;
	private ProductDao daoP;
	
	public void setDaoB(BlogDao daoB) {
		this.daoB = daoB;
	}
	public void setDaoC(CategoryDao daoC) {
		this.daoC = daoC;
	}
	public void setDaoJ(JjimDao daoJ) {
		this.daoJ = daoJ;
	}
	public void setDaoP(ProductDao daoP) {
		this.daoP = daoP;
	}

	@RequestMapping("/registerProduct.do")
	public ModelAndView registerProduct_sc(
			HttpServletRequest request, ModelAndView mav, Product product,
			@RequestParam(value = "uploadFile", required = false) MultipartFile uploadFile) {
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		String uploadDir = request.getServletContext().getRealPath("image_product");

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
	
	@RequestMapping("/modifyProduct.do")
	public ModelAndView modifyProduct(HttpServletRequest request, Product product){
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("member");
		ModelAndView mav = new ModelAndView();

		daoP.modifyProduct(product);
		
		mav.setViewName("redirect: goMarket.do?m_id=" + member.getM_id());
		return mav;
	}
	
	@RequestMapping("/purchaseProduct.do")
	public ModelAndView purchaseProduct(HttpServletRequest request,
			@RequestParam("waitingTime") int waitingTime,
			@RequestParam("p_id") int p_id){
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}

	/* getJSON */
	@RequestMapping("/getProductInfo.do")
	public ModelAndView getProductInfo(@RequestParam("p_id") int p_id) {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();

		Blog blog = daoB.getBlogByP_id(p_id);
		Product product = daoP.getProductByP_id(p_id);
		List<Product> randomProducts = daoP.getRandomProductByP_id(p_id);

		map.put("blog", blog);
		map.put("product", product);
		map.put("randomProducts", randomProducts);

		mav.addAllObjects(map);
		mav.setViewName("jsonView");
		return mav;
	}
	
	/*getJSON*/
	@RequestMapping("/getProductByP_id.do")
	public ModelAndView getProductByP_id(@RequestParam("p_id") int p_id){
		ModelAndView mav = new ModelAndView();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		Product product = daoP.getProductByP_id(p_id);
		
		resultMap.put("product", product);
		
		mav.addAllObjects(resultMap);
		mav.setViewName("jsonView");
		return mav;
	}
	
	/*getJSON*/
	@RequestMapping("/checkStatus.do")
	public ModelAndView checkStatus(HttpServletRequest request,
			@RequestParam("p_id") int p_id){
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("member");
		ModelAndView mav = new ModelAndView();
		Map<String, Object> resultmap = new HashMap<String, Object>();
		
		if(member != null){
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("m_id", member.getM_id());
			paramMap.put("p_id", p_id);
			
			resultmap.put("member", true);
			resultmap.put("jjim", daoJ.checkJjim(paramMap));
			resultmap.put("own", daoP.checkOwn(paramMap));
		}else{
			resultmap.put("member", false);
		}
		
		mav.addAllObjects(resultmap);
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
}
