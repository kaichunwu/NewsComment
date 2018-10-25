package edu.neu.regist;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/views/*")
public class LogController {

	private static final Logger logger = LoggerFactory.getLogger(LogController.class);
	
	@GetMapping("html")
	public String userdisplay(Model model,HttpServletRequest request) {
//		SecurityContextImpl securityContextImpl = (SecurityContextImpl) request  
//				 .getSession().getAttribute("SPRING_SECURITY_CONTEXT");
//		String username = securityContextImpl.getAuthentication().getName();
		String username = getPrincipal();
		model.addAttribute("username", username);
		return "views/html";
	}
	
    private String getPrincipal(){  
        String userName = null;  
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();  
   
        if (principal instanceof UserDetails) {  
            userName = ((UserDetails)principal).getUsername();  
        } else {  
            userName = principal.toString();  
        }  
        return userName;  
    }
    
    @GetMapping("logout")
    private String logout(Model model,HttpServletRequest request, HttpServletResponse response) {  
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();  
        if (auth != null){      
            new SecurityContextLogoutHandler().logout(request, response, auth);  
        }
        model.addAttribute("logout", "You are successfully logout.");
//    	return "redirect:/";
        return "logout";
    }
}
