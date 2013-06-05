package everymarket.mobile;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import everymarket.dao.ProductDao;
import everymarket.model.Product;

@Controller
public class MoBile_Product {
	private ProductDao daoP;

	public void setDaoP(ProductDao daoP) {
		this.daoP = daoP;
	}

	/*
	 * @RequestMapping("/m_getProductList.do") public void
	 * testAndroidd(HttpServletResponse response){
	 * System.out.println("[system] ��û����");
	 * 
	 * List<Product> listProduct = daoP.getProductListById("aa");
	 * 
	 * JSONObject jsonObject = new JSONObject(); jsonObject.put("listProduct",
	 * listProduct);
	 * 
	 * try{ response.setContentType("application/json");
	 * response.setCharacterEncoding("EUC-KR");
	 * response.getWriter().write(jsonObject.toString()); }catch(Exception e){
	 * e.printStackTrace(); } }
	 */

	@RequestMapping("/Main_ProductList.do")
	public void Main_ProductList(
			@RequestParam(value = "searchtext", required = false) String searchtext,
			@RequestParam(value = "category", required = false) String category,
			@RequestParam(value = "eventname", required = false) String eventname,
			HttpServletResponse response) {
		List<Product> listProduct = null;

		System.out.println(eventname + "���");		
		
		if(eventname.equals("category")){
			
			
			
		}
		
		
		if (category.equals("All") && (searchtext.equals(""))) {
			if (searchtext.equals("")) {
				System.out.println("all�̸鼭 �˻��������");
				listProduct = (ArrayList<Product>) daoP.M_Main_List();
				System.out.println(listProduct.get(0).getP_name() + "���");
			}

		} if (searchtext.equals("")) {

			System.out.println(searchtext);
			listProduct = daoP.M_Main_search("��Ʈ");
			System.out.println("����");

		}

		else {
			System.out.println("���");
			if (category.equals("Clothes")) {
				category = "�Ƿ�";
			} else if (category.equals("Sundries")) {
				category = "��ȭ";
			} else if (category.equals("Leisure")) {
				category = "����";
			} else if (category.equals("Electronic equipment")) {
				category = "�����а���";
			} else if (category.equals("Book/Music")) {
				category = "��������";
			} else if (category.equals("Furniture")) {
				category = "����";
			}

			listProduct = (ArrayList<Product>) daoP.M_Main_category(category);
		}

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("MainList", listProduct);

		try {
			response.setContentType("application/json");
			response.setCharacterEncoding("EUC-KR");
			response.getWriter().write(jsonObject.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
