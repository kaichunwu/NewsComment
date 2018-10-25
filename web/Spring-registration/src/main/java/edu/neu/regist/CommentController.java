package edu.neu.regist;

import java.util.Date;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.neu.regist.dao.UserinfoDao;
import edu.neu.regist.domain.*;

@Controller
@RequestMapping("/views/*")
public class CommentController {
	private static final Logger logger = LoggerFactory.getLogger(CommentController.class);
	
	@Resource(name="userinfodao")
	private UserinfoDao userinfodao;
	
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
    
	@RequestMapping(value="comment/topic",method=RequestMethod.GET)
	public String createComments(Model model) {
		model.addAttribute("comments", new Comments());
		return "comment/topic";
	}
	
	@RequestMapping(value="addcomment",method=RequestMethod.POST)
	public String showComment(Model model,@Valid Comments comments, 
			BindingResult result) {
		if(result.hasErrors()) {
			return "comment/topic";
		}
		comments.setTime(new Date());
		model.addAttribute("comments", comments);
		Userinfo userinfo = userinfodao.findByUsername(getPrincipal());
		if(userinfo!=null) {
			userinfo.addComment(comments);
			userinfodao.save(userinfo);
			model.addAttribute("userinfo", userinfo);
		}
		return "views/show";
	}
	
	@RequestMapping("comment/home")
	public String supervisor(Model model) {
		model.addAttribute("username", getPrincipal());
		return "comment/home";
	}
	
}
