package everymarket.mobile;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import everymarket.dao.MemberDao;
import everymarket.model.Member;

@Controller
public class Mobile_Member {
	private MemberDao daoM;

	public void setDaoM(MemberDao daoM) {
		this.daoM = daoM;
	}
	
	@RequestMapping("/Member_login.do")
	public void find_member(HttpServletResponse response,@RequestParam("id") String id,@RequestParam("pwd") String pwd){
		
		Member member = daoM.getMember(id);
		String blank = null;
		if(member!=null){
			if(member.getM_pwd().equals(pwd)){
				JSONObject jsonObject = new JSONObject();
				
				jsonObject.put("result", 1);
				jsonObject.put("member", member);
				
				System.out.println(member+"1");
				try{
					response.setContentType("application/json");
					response.setCharacterEncoding("EUC-KR");
					response.getWriter().write(jsonObject.toString());
					
					
				}catch(Exception e){
					e.printStackTrace();
				}
		
			}else{
				JSONObject jsonObject = new JSONObject();
				jsonObject.put("result", 2);
				System.out.println(member+"2");
				try{
					response.setContentType("application/json");
					response.setCharacterEncoding("EUC-KR");
					response.getWriter().write(jsonObject.toString());
					
				}catch(Exception e){
					e.printStackTrace();
				}
		
			}
		}else{
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("result", 3);
			System.out.println(member+"3");
			try{
				response.setContentType("application/json");
				response.setCharacterEncoding("EUC-KR");
				response.getWriter().write(jsonObject.toString());
				
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		
		
		
		
	}
}
