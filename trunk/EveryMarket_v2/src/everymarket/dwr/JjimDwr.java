package everymarket.dwr;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestParam;

import everymarket.dao.JjimDao;
import everymarket.model.Jjim;
import everymarket.model.Member;

public class JjimDwr {
	private JjimDao daoJ;

	public void setDaoJ(JjimDao daoJ) {
		this.daoJ = daoJ;
	}
	
	public boolean checkJjim(HttpServletRequest request, @RequestParam("p_id")int p_id){
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("member");
		boolean checkJjim = false;
		
		Jjim jjim = new Jjim();
		jjim.setP_id(p_id);
		jjim.setM_id(member.getM_id());
		
		if(daoJ.checkJjim(jjim) != 0){
			checkJjim = true;
		}
		
		return checkJjim;
	}
}
