package everymarket.mobile;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import everymarket.dao.JjimDao;
import everymarket.model.Jjim;
import everymarket.model.Product;

@Controller
public class Mobile_Jjim {
	private JjimDao daoJ;

	public void setDaoJ(JjimDao daoJ) {
		this.daoJ = daoJ;
	}
	
	@RequestMapping("/m_getJjimList.do")
	public void m_getJjimList(HttpServletResponse response){
		System.out.println("[system] ���� ��û����");
		
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
	
	@RequestMapping("/m_registerJjim.do")
	public void registerJjim(HttpServletResponse response,
			@RequestParam("m_id") String m_id,
			@RequestParam("p_id") int p_id) {
		System.out.println("[system] m_id = " + m_id 
				+ ", p_id = " + p_id + " ���û ����");		
		
		Jjim jjim = new Jjim();
		jjim.setJ_id(daoJ.getMaxJ_id() + 1);
		jjim.setM_id(m_id);
		jjim.setP_id(p_id);
		
		daoJ.registerJjim(jjim);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "ok");
		
		try{
			response.setContentType("application/json");
			response.setCharacterEncoding("EUC-KR");
			response.getWriter().write(jsonObject.toString());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
}
