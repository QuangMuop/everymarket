package everymarket.mobile;

import org.springframework.stereotype.Controller;

import everymarket.dao.JjimDao;

@Controller
public class Mobile_Jjim {
	private JjimDao daoJ;

	public void setDaoJ(JjimDao daoJ) {
		this.daoJ = daoJ;
	}
	
	
	
}
