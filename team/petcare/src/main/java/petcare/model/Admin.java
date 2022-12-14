package petcare.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Admin {
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long admin_id;
	private String username;
	private String password;
}
