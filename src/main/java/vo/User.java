package vo;

public class User {
	private Integer id;
	private String username;
	private String password;
	private String idcard;
	private String email;
	private String phone;
	private String birthday;
	private String address;
	private String permission;
	public User(Integer id, String username, String password,String idnum,String email,String phone,String birthday,String address,String permission) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.idcard=idnum;
		this.email=email;
		this.phone=phone;
		this.birthday=birthday;
		this.address=address;
		this.permission=permission;
	}
	public User() {
		super();
	}
	public String getPermission() {
		return permission;
	}
	public void setPermission(String permission) {
		this.permission = permission;
	}

	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Integer getId() {
		return id;
	}
	public String getUsername() {
		return username;
	}
	public String getIdcard() {
		return idcard;
	}

}