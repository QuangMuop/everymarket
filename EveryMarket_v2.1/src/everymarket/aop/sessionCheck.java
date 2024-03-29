package everymarket.aop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.web.servlet.ModelAndView;

import everymarket.model.Member;

@Aspect
public class sessionCheck {
	
	@After("execution(public * everymarket..*_sc(..))")
	public void sessionChecker(JoinPoint joinPoint){
		Object[] arguments = joinPoint.getArgs();
		
		HttpServletRequest request = (HttpServletRequest)arguments[0];
		ModelAndView mav = (ModelAndView)arguments[1];
		
		HttpSession session = request.getSession();
		Object member = session.getAttribute("member");
		
		if(member != null){
			System.out.println("技记 眉农");
			mav.addObject("member", (Member)member);
		}else{
			System.out.println("技记 固眉农");
			if(mav.getViewName() == null){
				mav.setViewName("main_template");
			}
		}
	}
}
