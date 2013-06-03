package everymarket.mobile;

import org.springframework.stereotype.Controller;

import everymarket.dao.MemberDao;

@Controller
public class Mobile_Member {
	private MemberDao daoM;

	public void setDaoM(MemberDao daoM) {
		this.daoM = daoM;
	}
	
	
}
