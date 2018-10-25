package edu.neu.regist.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import edu.neu.regist.domain.Comments;
import edu.neu.regist.domain.Userinfo;

@Repository("userinfodao")
@Transactional
public class UserinfoDao {

	private Log log = LogFactory.getLog(UserinfoDao.class);

	@Autowired
	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional(readOnly=true)
	public Userinfo findByUsername(String username) {
		return (Userinfo) sessionFactory.getCurrentSession().getNamedQuery("Userinfo.findByUsername").
				setParameter("username", username).uniqueResult();
	}
	
	public void save(Userinfo userinfo) {
		sessionFactory.getCurrentSession().saveOrUpdate(userinfo);
		log.info("userinfo saved with id: " + userinfo.getId());
	}
	
	public List<Comments> findByTopic(String topic) {
		return sessionFactory.getCurrentSession().getNamedQuery("Comments.findByTopic")
				.setParameter("topic", topic).list();
	}
	
	public void delete(long id) {
		Comments comments = (Comments) sessionFactory.getCurrentSession().getNamedQuery("Comments.findById").
				setParameter("id", id).uniqueResult();
		sessionFactory.getCurrentSession().delete(comments);
		log.info("Contact deleted with id: " + comments.getId());
	}
}
