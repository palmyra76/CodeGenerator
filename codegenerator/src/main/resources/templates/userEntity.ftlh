package ${packageName}.entity;


import ${packageName}.config.Auditable;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Embedded;
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
public class UserEntity implements Auditable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;

	@Column(name = "organization_id")
	private Integer organizationId;

	@Column(name = "name")
	private String name;
	
	@Column(name = "first_name")
	private String firstName;
	
	@Column(name = "last_name")
	private String lastName;

	@Column(name = "user_name")
	private String loginName;

	@Column(name = "email")
	private String email;

	@Column(name = "phone_number")
	private String phoneNumber;
	
	@Column(name = "parent_phone_number")
	private String parentPhoneNumber;
	
	@Column(name = "marital_status")
	private String maritalStatus;

	@Column(name = "account_number")
	private String accountNumber;
	
	@Column(name = "bank_name")
	private String bankName;

	@Column(name = "ifsc_code")
	private String ifscCode;

	@Column(name = "account_holder_name")
	private String accountHolderName;
	
	@Column(name = "address")
	private String address;

	@Column(name = "random")
	private String random;

	@Column(name = "salt")
	private String password;
	
	@Embedded
	private Timestamps timestamps;
}