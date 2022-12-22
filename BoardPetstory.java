package petcare.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.hibernate.annotations.CreationTimestamp;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
@Entity(name = "bPetstoryl")
public class BoardPetstory {
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long petstoryID;
	private String title;
	private String content;
	@Column(nullable=false)
	private String username;
	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP) // 교재 75페이지 참고
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date regdate;
	private Long hitcount;
	private Long replycnt;
	private Long likes;
	@PrePersist
	public void prePersist() {
		this.hitcount = this.hitcount==null?0:this.hitcount;
		this.replycnt = this.replycnt==null?0:this.replycnt;
		this.likes = this.likes==null? 0: this.likes;
	}

	
	@OneToMany(mappedBy = "bPetstoryl", cascade = CascadeType.REMOVE)
	@JsonIgnoreProperties("bPetstoryl")
	private List<CommentPetStory> comments;
	
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="userID")
	private User user;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="doctorID")
	private Doctor doctor;
	
	@Transient
	private MultipartFile uploadpetstory;
	private String petstoryimage;
}
