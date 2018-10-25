package edu.neu.regist;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import edu.neu.regist.dao.UserinfoDao;
import edu.neu.regist.domain.Comments;
import edu.neu.regist.domain.Userinfo;
import edu.neu.regist.resources.DisplayUser;
import edu.neu.regist.resources.Topics;

@RestController
@RequestMapping("/ajax/*")
public class AjaxController {

	@GetMapping("test")
	public String testAjax() {
		return " Connection successful!";
	}
	
	@RequestMapping(value="topics/{topic}",method={RequestMethod.GET, RequestMethod.POST})
	public String topicsAjax(@PathVariable(value="topic") String topic) {
		String content = Topics.searchTopic(topic);
		List<Comments> comments = userinfodao.findByTopic(topic);
		if(comments.size()!=0) {
			content = content + "<div style='color:gray'><ul>Comments:";
			for(Comments c : comments) {
				content = content + "<li><p>" + c.getComment() + "</p>"
						+ "<p>Published Time:" + c.getTime() + "&ensp;&ensp;&ensp;"
						+ "Username:" + c.getUserinfo().getUsername() +"</p></li>";
			}
			content = content + "</ul></div>";
		}
		return content;
	}
	
	@Resource(name="userinfodao")
	private UserinfoDao userinfodao;
	
	@GetMapping("pic")
	private String picAjax() {
		String username = getPrincipal();
		if(username=="anonymousUser") {
			return "Not Been Authenticated";
		}
		Userinfo userinfo = userinfodao.findByUsername(username);
		String information = DisplayUser.display(userinfo);
		return information;
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
}
