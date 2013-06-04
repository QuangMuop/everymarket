package everymarket.mobile;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import everymarket.dao.TradeDao;
import everymarket.model.Product;
import everymarket.model.Trade;

@Controller
public class Mobile_Trade {
	private TradeDao daoT;

	public void setDaoT(TradeDao daoT) {
		this.daoT = daoT;
	}
	
	@RequestMapping("/m_getBuyList.do")
	public void m_getBuyList(
			HttpServletResponse response,
			@RequestParam("m_id") String m_id){
		System.out.println("[system] ¿äÃ»µé¾î¿È");
		
		List<Trade> listBuy = daoT.getBuyingTrade(m_id);
				
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("listTrade", listBuy);
		
		try{
			response.setContentType("application/json");
			response.setCharacterEncoding("EUC-KR");
			response.getWriter().write(jsonObject.toString());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/m_getSellList.do")
	public void m_getSellList(
			HttpServletResponse response,
			@RequestParam("m_id") String m_id){
		System.out.println("[system] ¿äÃ»µé¾î¿È");
		
		List<Trade> listSell = daoT.getSellingTrade(m_id);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("listTrade", listSell);
		
		try{
			response.setContentType("application/json");
			response.setCharacterEncoding("EUC-KR");
			response.getWriter().write(jsonObject.toString());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
