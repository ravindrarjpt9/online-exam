package co.edureka.quiz;

public class Users {

	private String id;
	private String username;
	private String email;
	private String mobile;
	private String address;
	
	
	public Users(String id, String username, String email, String mobile,
			String address) {
		
		this.id = id;
		this.username = username;
		this.email = email;
		this.mobile = mobile;
		this.address = address;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
}
