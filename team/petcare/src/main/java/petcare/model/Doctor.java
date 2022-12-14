package petcare.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
@Entity
public class Doctor {
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long doctor_id;
	private String username;
	private String password;
	private String doccareer;
	private String doclicensenum;
	private String dochospital;
	private String dochospitaltel;
	private String dochospitaladdr;
	private String dochospitalpostal;
	
	@Transient
	private MultipartFile uploadlicense;
	private String licenseimage;
	
	@Transient
	private MultipartFile uploadprofile;
	private String profileimage;
	
	private boolean approval; // char의 Y/N로 바꾸는게 나을수도? (12/13 민지)
	private Date approvaldate;
}
