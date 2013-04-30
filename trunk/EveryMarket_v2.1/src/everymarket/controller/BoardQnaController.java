package everymarket.controller;

import org.springframework.stereotype.Controller;

import everymarket.dao.BoardQnaDao;

@Controller
public class BoardQnaController {
	private BoardQnaDao daoBQ;

	public void setDaoBQ(BoardQnaDao daoBQ) {
		this.daoBQ = daoBQ;
	}
	
	
	
}
