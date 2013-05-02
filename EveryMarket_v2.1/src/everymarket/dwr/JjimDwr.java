package everymarket.dwr;

import everymarket.dao.JjimDao;

public class JjimDwr {
	private JjimDao daoJ;

	public void setDaoJ(JjimDao daoJ) {
		this.daoJ = daoJ;
	}
	
//	public boolean checkJjim(HttpServletRequest request, @RequestParam("p_id")int p_id){
//		HttpSession session = request.getSession();
//		Member member = (Member)session.getAttribute("member");
//		boolean checkJjim = false;
//		
//		Jjim jjim = new Jjim();
//		jjim.setP_id(p_id);
//		jjim.setM_id(member.getM_id());
//		
//		if(daoJ.checkJjim(jjim) != 0){
//			checkJjim = true;
//		}
//		
//		return checkJjim;
//	}
}
