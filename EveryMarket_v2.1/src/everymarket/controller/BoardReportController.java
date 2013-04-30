package everymarket.controller;

import org.springframework.stereotype.Controller;

import everymarket.dao.BoardReportDao;

@Controller
public class BoardReportController {
	private BoardReportDao daoBR;

	public void setDaoBR(BoardReportDao daoBR) {
		this.daoBR = daoBR;
	}
	
	
}
