package everymarket.controller;

import java.util.HashMap;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.activation.*;


import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.ModelAndView;

import com.sun.org.apache.xpath.internal.operations.Mod;
import com.sun.xml.internal.bind.v2.schemagen.xmlschema.Appinfo;

import everymarket.dao.MemberDao;
import everymarket.mailsender.MimeMailSender;



@Controller
public class MailController {
	MimeMailSender sender;
	private MemberDao daoM;
	
	public void setDaoM(MemberDao daoM) {
		this.daoM = daoM;
	}

	public void setSender(MimeMailSender sender) {
		this.sender = sender;
	}



	@RequestMapping("/mailsend.do")
	public ModelAndView mailsend(@RequestParam ("m_email") String m_email ) {
		ModelAndView mav = new ModelAndView();
		Random random = new Random();
		int num = random.nextInt(999999);
		String text = num+"";
		try{
			sender.sendMail(m_email, "kpj5427@gmail.com", "[everymarket 인증메일]", text);
		}catch(Exception e){
			e.printStackTrace();
		}
		mav.addObject("text", text);
		mav.setViewName("jsonView");
		return mav;
	
	}
	
	@RequestMapping("/regConfirm.do")
	public ModelAndView regConfirm(@RequestParam ("connum1") String connum1, @RequestParam ("connum2") String connum2){
		ModelAndView mav = new ModelAndView();
		System.out.println(connum1);
		System.out.println(connum2);
		if(connum1.equals(connum2)){
			mav.addObject("ConfirmOk", "인증번호 일치");
			mav.setViewName("jsonView");
		}else{
			mav.addObject("error", "인증번호 불일치");
			mav.setViewName("jsonView");
		}
		return mav;
	}
	
	//비밀번호 찾기
	@RequestMapping("/find_pwd.do")
	public ModelAndView find_pwd(@RequestParam("m_id") String m_id, @RequestParam("m_name") String m_name,
			@RequestParam("m_email") String m_email ){
		ModelAndView mav = new ModelAndView();
		

		Random random = new Random();
		int num = random.nextInt(999999);
		String text = "새 비밀번호 : " + num;
		try{
			sender.sendMail(m_email, "kpj5427@gmail.com", "[everymarket 비밀번호 찾기]", text);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		HashMap map = new HashMap<>();
		map.put("m_id", m_id);
		map.put("m_name", m_name);
		map.put("m_email", m_email);
		map.put("num", num);
		
		daoM.new_pwd(map);
		mav.addAllObjects(map);
		
		mav.setViewName("jsonView");
		
		
		return mav;
	}
	
	
}
