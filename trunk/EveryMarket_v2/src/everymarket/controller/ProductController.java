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
import everymarket.dao.ProductDao;
import everymarket.model.Blog;
import everymarket.model.Member;
import everymarket.model.Product;

@Controller
public class ProductController {
	private BlogDao daoB;
	private ProductDao daoP;
	private String uploadDir = "F:/kosta-47/source/BOM/EveryMarket_v2/WebContent/image_product/";
	
	public void setDaoB(BlogDao daoB) {
		this.daoB = daoB;
	}
	public void setDaoP(ProductDao daoP) {
		this.daoP = daoP;
	}

	@RequestMapping("/registerProduct.do")
	public ModelAndView registerProduct_sc(HttpServletRequest request, ModelAndView mav, Product product, 
			@RequestParam(value="uploadFile", required=false)MultipartFile uploadFile){
		HttpSession session = request.getSession(); 		
		Member member = (Member)session.getAttribute("member");
		
		try{
				/*Spring 파일업로드 구현*/
				String fileName = uploadFile.getOriginalFilename();
				uploadFile.transferTo(new File(uploadDir, fileName));
				product.setP_img(fileName);
		
			product.setP_id(daoP.getMaxP_id() + 1);
			product.setP_date(new Timestamp(System.currentTimeMillis()));
			product.setM_id(member.getM_id());

			daoP.registerProduct(product);
		}catch(IOException ioE){
			ioE.printStackTrace();
		}catch(Exception E){
			E.printStackTrace();
		}
		
		List<Product> listProduct = daoP.getProductListById(member.getM_id());
		mav.addObject("listProduct", listProduct);
		mav.setViewName("indivMarket");
		return mav;
	}
	
	/*getJSON*/
	@RequestMapping("/getProductInfo.do")
	public ModelAndView getProductInfo(@RequestParam("p_id")int p_id){
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
}
