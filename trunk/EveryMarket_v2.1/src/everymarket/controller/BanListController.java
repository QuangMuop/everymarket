package everymarket.controller;

import org.springframework.stereotype.Controller;

import everymarket.dao.BanListDao;

@Controller
public class BanListController {
	private BanListDao daoBL;

	public void setDaoBL(BanListDao daoBL) {
		this.daoBL = daoBL;
	}
	
	
}
