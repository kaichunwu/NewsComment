package edu.neu.regist.domain;

import static javax.persistence.GenerationType.IDENTITY;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;

@Entity(name="comments")
@Table(name="comments")
@NamedQueries({
	@NamedQuery(name="Comments.findByTopic",
			query="select distinct c from comments c where c.topic = :topic"),
	@NamedQuery(name="Comments.findById",
			query="select distinct c from comments c where c.id = :id")
})
public class Comments implements Serializable{

	private long id;
	private Userinfo userinfo;
	private Date time;
	private String topic;
	private String comment;
	
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "ID")
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	@ManyToOne
	@JoinColumn(name = "userinfo_id")
	public Userinfo getUserinfo() {
		return userinfo;
	}
	public void setUserinfo(Userinfo userinfo) {
		this.userinfo = userinfo;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "ctime")
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	@Column(name = "topic")
	public String getTopic() {
		return topic;
	}
	public void setTopic(String topic) {
		this.topic = topic;
	}
	@Column(name = "comment")
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	
	@Override
	public String toString() {
//		return "Comment [username=" + userinfo.getUsername() + ", time=" + time + ", topic=" + topic + ", comment=" + comment + "]";
		return "Comment [id=" + id + ",time=" + time + 
				", topic=" + topic + ", comment=" + comment+ "]";
	}
	
	
}
