package ${packageName}.entity;

import java.sql.Date;
import java.time.LocalDateTime;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "xpm_user")
@Getter
@Setter
public class UserEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;

	@Column(name = "display_name", nullable = false, unique = true, length = 64)
	private String displayName;

	@Column(name = "login_name", nullable = false, unique = true, length = 64)
	private String loginName;

	@Column(name = "email", nullable = false, unique = true, length = 64)
	private String email;

	@Column(name = "gender", length = 1)
	private Character gender;

	@Column(name = "dob")
	private Date dob;

	@Column(name = "first_name", length = 64)
	private String firstName;

	@Column(name = "last_name", length = 64)
	private String lastName;

	@Column(name = "user_type", nullable = false)
	private Integer userType;

	@Column(name = "phone_number", length = 64)
	private String phoneNumber;

	@Column(name = "address", length = 255)
	private String address;

	@Column(name = "random", length = 128)
	private String random;

	@Column(name = "salt", length = 128)
	private String password;

	@Column(name = "created_by", nullable = false, length = 128)
	private String createdBy;

	@Column(name = "created_on", nullable = false)
	private LocalDateTime createdOn;

	@Column(name = "last_upd_by", length = 128)
	private String lastUpdatedBy;

	@Column(name = "last_upd_on")
	private LocalDateTime lastUpdatedOn;

}