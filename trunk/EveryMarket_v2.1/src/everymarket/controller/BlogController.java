package everymarket.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import everymarket.dao.BlogDao;
import everymarket.model.Blog;
import everymarket.model.Member;

@Controller
public class BlogController {
	private BlogDao daoB;

	public void setDaoB(BlogDao daoB) {
		this.daoB = daoB;
	}
	
	@RequestMapping("/updateBlog.do")
	public ModelAndView updateBlog(HttpServletRequest request, Blog blog){
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		Member member = (Member)session.getAttribute("member");
		Map<String, Object> paramMap = new HashMap<String, Object>();
		List<String> paramList = new ArrayList<String>();
		
		System.out.println(blog);
		
		if(blog.getB_main() != null){
			paramList.add(blog.getB_main());
		}
		if(blog.getB_thumb() != null){
			paramList.add(blog.getB_thumb());
		}
		if(blog.getB_map() != null){
			paramList.add(blog.getB_map());
		}
		if(blog.getB_content() != null){
			paramList.add(blog.getB_content());
		}
		
		paramMap.put("m_id", member.getM_id());
		paramMap.put("paramList", paramList);

		daoB.updateBlog(paramMap);

		mav.setViewName("redirect: goMarket.do?m_id=" + member.getM_id());
		return mav;
	}
	
//	메인블로그슬라이드
	@RequestMapping("/callBlogList.do")
	public ModelAndView callMemberList(){
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();

		List<Blog> listBlog = daoB.getBlogList();
		map.put("listMember", listBlog);
		
		mav.addAllObjects(map);
		mav.setViewName("jsonView");
		return mav;
	}
	
	
}
