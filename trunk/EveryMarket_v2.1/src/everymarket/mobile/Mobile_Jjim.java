package everymarket.mobile;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import everymarket.dao.JjimDao;
import everymarket.model.Product;
import everymarket.object4output.JjimResult;

@Controller
public class Mobile_Jjim {
	private JjimDao daoJ;

	public void setDaoJ(JjimDao daoJ) {
		this.daoJ = daoJ;
	}
	
	@RequestMapping("/m_getJjimList.do")
	public void m_getJjimList(HttpServletResponse response){
		System.out.println("[system] Âò¸ñ·Ï ¿äÃ»µé¾î¿È");
		
		List<Product> listJjim = daoJ.getjjimList("aa");
				
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("listJjim", listJjim);
		
		try{
			response.setContentType("application/json");
			response.setCharacterEncoding("EUC-KR");
			response.getWriter().write(jsonObject.toString());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
}
