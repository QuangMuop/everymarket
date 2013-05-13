package everymarket.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
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
	public ModelAndView updateBlog(HttpServletRequest request, Blog blog,
			@RequestParam(value="uploadFile", required=false) MultipartFile uploadFile,
			@RequestParam(value="latitude", required=false) String latitude,
			@RequestParam(value="longitude", required=false) String longitude,
			@RequestParam("updateKey") String updateKey){
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		Member member = (Member)session.getAttribute("member");
		String uploadDir = request.getServletContext().getRealPath("image_blog");
		String fileName = "";
		
		blog.setM_id(member.getM_id());
		
		try{
			switch (updateKey) {
			case "b_main":
				fileName = uploadFile.getOriginalFilename();
				uploadFile.transferTo(new File(uploadDir, fileName));
				blog.setB_main(fileName);
				daoB.updateB_main(blog);
				break;
			case "b_thumb":
				fileName = uploadFile.getOriginalFilename();
				uploadFile.transferTo(new File(uploadDir, fileName));
				blog.setB_thumb(fileName);
				daoB.updateB_thumb(blog);
				break;
			case "b_map":
				String b_map = generatingUrl(latitude, longitude);
				blog.setB_map(b_map);
				daoB.updateB_map(blog);
				break;
			case "b_content":
				daoB.updateB_content(blog);
				break;
			}
		}catch(IOException ioE){
			ioE.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		mav.setViewName("redirect: goMarket.do?m_id=" + member.getM_id());
		return mav;
	}

	public String generatingUrl(String latitude, String longitude){
		String url = "";
		
		url += "http://maps.google.com/maps/api/staticmap?";
		url += "center=" + latitude + "," + longitude + "&";
		url += "zoom=16&";
		url += "markers="+ latitude + "," + longitude + "&";
		url += "path=color:0x0000FF80|weight:5|";
		url += latitude + "|" + longitude + "&";
		url += "size=500x500&sensor=false";
		
		System.out.println("다음의 주소로 GoogleMap설정 변경 요청: " + url);
		return url;
	}

	
	/*메인블로그슬라이드*/
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
