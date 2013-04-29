package everymarket.controller;

import org.springframework.stereotype.Controller;

import everymarket.dao.BlogDao;

@Controller
public class BlogController {
	private BlogDao daoB;

	public void setDaoB(BlogDao daoB) {
		this.daoB = daoB;
	}
	
	
}
