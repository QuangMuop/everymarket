package everymarket.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import everymarket.dao.ProductDao;
import everymarket.model.Product;

@Controller
public class remoteController {
	private ProductDao daoP;

	public void setDaoP(ProductDao daoP) {
		this.daoP = daoP;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/remote.do")
	public ModelAndView RemoteList(HttpServletRequest request, @RequestParam (value = "p_id") int p_id){
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();

		List<Product> remote_list = new ArrayList<Product>();
		
		
		if(session.getAttribute("remote_list")!=null){
			remote_list = (ArrayList<Product>) session.getAttribute("remote_list");
		
			Product remote_p = daoP.getProductByP_id(p_id);
			
			for(int i=remote_list.size(); i==0; i--){
				remote_list.add(i+1, remote_list.get(i));	 
				
			}
			
			remote_list.add(0, remote_p);
			session.setAttribute("remote_list", remote_list);

		}else{
			Product remote_p = daoP.getProductByP_id(p_id);
			remote_list.add(0, remote_p);
			session.setAttribute("remote_list", remote_list);
		}int value = 0;
		mav.setViewName("redirect:/remotePage.do");
		
		mav.addObject("value", value);
		return mav;
	}
	
	@RequestMapping("/remotePage.do")
	public ModelAndView remotePage(HttpServletRequest request, @RequestParam (value="value", defaultValue="0") int value){
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		int sizeNum = 0;
	
		@SuppressWarnings("unchecked")
		List<Product> list = (List<Product>) session.getAttribute("remote_list");
		
		if(list.size()>5){
			sizeNum = list.size();
			if(value+4 < sizeNum){
			
			list = list.subList(value, value+5);
		
			
			}
			
			else if(value != 0 && value+4 >= list.size()){
				
				list = list.subList(value, list.size());
				
			}
		}
		
		mav.addObject("value", value);
		mav.addObject("sizeNum", sizeNum);
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
}
