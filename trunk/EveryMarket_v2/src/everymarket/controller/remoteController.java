package everymarket.controller;

import java.util.ArrayList;

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
	public ModelAndView RemoteList(HttpServletRequest request, @RequestParam ("p_id") int p_id){
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		
		ArrayList<Product> remote_list = new ArrayList<Product>();
		if(session.getAttribute("remote_list")!=null){
			remote_list = (ArrayList<Product>) session.getAttribute("remote_list");
			Product remote_p = daoP.getProductById(p_id);
			for(int i=remote_list.size(); i==0; i--){
				remote_list.add(i+1, remote_list.get(i));	 
			}
			
			
			
			remote_list.add(0, remote_p);
			session.setAttribute("remote_list", remote_list);
		
			
			if(remote_list.size() >5){
				remote_list = (ArrayList<Product>) remote_list.subList(1, 5);
			
			}
		}else{
			Product remote_p = daoP.getProductById(p_id);
			remote_list.add(0, remote_p);
			session.setAttribute("remote_list", remote_list);
			System.out.println("마시쓰면 또머거");
		}
		
		
		mav.setViewName("jsonView");
		mav.addObject("remote_list", remote_list);
		return mav;
		
	
	
	}
}
