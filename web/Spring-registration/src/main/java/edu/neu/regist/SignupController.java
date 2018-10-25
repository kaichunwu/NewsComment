package edu.neu.regist;

import javax.annotation.Resource;
import javax.sql.DataSource;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import edu.neu.regist.dao.UserDao;
import edu.neu.regist.dao.UserinfoDao;
import edu.neu.regist.domain.User;
import edu.neu.regist.domain.Userinfo;
import edu.neu.regist.domain.Verify;

@Controller
@RequestMapping("/views/*")
public class SignupController {
	
	private static final Logger logger = LoggerFactory.getLogger(SignupController.class);
	
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

	@RequestMapping(value="signup",method=RequestMethod.GET)
	public String createUser(Model model) {
		model.addAttribute("user", new User());
		return "signup";
	}
	
	@Resource(name="securityDataSource")
	private DataSource dataSource;
	
	@Resource(name="userinfodao")
	private UserinfoDao userinfodao;
	
	@RequestMapping(value="users",method=RequestMethod.POST)
	public String showUser(Model model,@Valid User user, BindingResult result) {
		if(result.hasErrors()) {
			return "signup";
		}
		if(user.getRole().equals("supervisor")) {
			Verify verify = new Verify();
			verify.setUsername(user.getUsername());
			verify.setPassword(user.getPassword());
			System.out.println("verify");
			model.addAttribute("verify", verify);
			return "verify";
		}
		UserDao userdao = new UserDao();
		String s = userdao.addUser(user,dataSource);
		model.addAttribute("user", user);
		model.addAttribute("status", s);
		return "views/createuser";
	}
	
	@RequestMapping(value="verifies",method=RequestMethod.POST)
	public String verifySuperUser(Model model,@Valid Verify verify,BindingResult result) {
		User user = new User();
		user.setUsername(verify.getUsername());
		user.setPassword(verify.getPassword());
		user.setRole("supervisor");
		UserDao userdao = new UserDao();
		String s = userdao.addUser(user,dataSource);
		model.addAttribute("user", user);
		model.addAttribute("status", s);
		return "views/createuser";
	}
	
	@RequestMapping(value="info",method=RequestMethod.GET)
	public String createUserinfo(Model model) {
		Userinfo userinfo = userinfodao.findByUsername(getPrincipal());
		if(userinfo==null) {
			model.addAttribute("userinfo", new Userinfo());
		}else {
			model.addAttribute("userinfo", userinfo);
		}
		return "views/info";
	}
	
	@RequestMapping(value="usersinfo",method=RequestMethod.POST)
	public String showUsersinfo(Model model,@Valid Userinfo userinfo, BindingResult result) {
		if(result.hasErrors()) {
			return "views/info";
		}
		userinfodao.save(userinfo);
		model.addAttribute("userinfo", userinfo);
		return "views/show";
	}
	@RequestMapping(value="show/shows",method= {RequestMethod.GET,RequestMethod.POST})
	public String show(Model model) {
		Userinfo userinfo = userinfodao.findByUsername(getPrincipal());
		if(userinfo==null) {
			userinfo = new Userinfo();
			userinfo.setUsername(getPrincipal());
			model.addAttribute("userinfo", userinfo);
		}else {
			model.addAttribute("userinfo", userinfo);
		}
		return "views/show";
	}
}
