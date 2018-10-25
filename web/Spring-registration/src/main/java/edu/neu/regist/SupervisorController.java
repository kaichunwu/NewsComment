package edu.neu.regist;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import edu.neu.regist.dao.UserinfoDao;
import edu.neu.regist.domain.Comments;
import edu.neu.regist.resources.Topics;

@RestController
@RequestMapping("/super/*")
public class SupervisorController {

	@Resource(name="userinfodao")
	private UserinfoDao userinfodao;
	
	@RequestMapping(value="topics/{topic}",method={RequestMethod.GET, RequestMethod.POST})
	public String deleteAjax(@PathVariable(value="topic") String topic, HttpServletRequest request) {
		String content = Topics.searchTopic(topic);
		List<Comments> comments = userinfodao.findByTopic(topic);
		if(comments.size()!=0) {
			content = content + "<div style='color:gray'><ul>Comments:";
			for(Comments c : comments) {
				content = content + "<li><p>" + c.getComment() + "</p>"
						+ "<p>Published Time:" + c.getTime() + "&ensp;&ensp;&ensp;"
						+ "Username:" + c.getUserinfo().getUsername() +"&ensp;&ensp;&ensp;</p>"
						+ "<a class='delete' "
						+ "href=\""+request.getContextPath()+("/super/delete/"+c.getId())
						+ "\">Delete</a></li>";
			}
			content = content + "</ul></div>";
		}
		return content;
	}
	
	@RequestMapping(value="delete/{id}",method={RequestMethod.GET, RequestMethod.POST})
	public String deleteComment(@PathVariable(value="id") long id) {
		userinfodao.delete(id);
		return "Delete Successful";
	}
	
}
