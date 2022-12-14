package petcare.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.hibernate.annotations.CreationTimestamp;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;


@Getter @Setter
@Entity
public class BoardQuestion {
		@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
		private Long question_id;
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
		@PrePersist
		public void prePersist() {
			this.hitcount = this.hitcount==null?0:this.hitcount;
			this.replycnt = this.replycnt==null?0:this.replycnt;
		}
		private Long likes;
		
		@ManyToOne(fetch = FetchType.LAZY)
		@JoinColumn(name="member_id")
		private Member member;
		
		@ManyToOne(fetch = FetchType.LAZY)
		@JoinColumn(name="doctor_id")
		private Doctor doctor;
		
		@Transient
		private MultipartFile uploadquestion;
		private String questionimage;
}
