package co.mini.soyg.adminUsers.vo;

public class UserVO {

	// DB Member
	
	private String userID;
	private String password;
	private String address;
	private String email;
	private String gender;
	private String phone;
	private String birth;
	private String name;
	
	// 페이징을 위해 임의 추가
	private int firstCnt;
	private int lastCnt;
	private int totalCnt;
	
	//////////////////////////////////////////////////
	
	public int getFirstCnt() {
		return firstCnt;
	}
	public void setFirstCnt(int firstCnt) {
		this.firstCnt = firstCnt;
	}
	public int getLastCnt() {
		return lastCnt;
	}
	public void setLastCnt(int lastCnt) {
		this.lastCnt = lastCnt;
	}
	public int getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}

	
	////////////////////////////////////////////////////
	
	@Override
	public String toString() {
		return "UserVO [userID=" + userID + ", password=" + password + ", address=" + address + ", email=" + email
				+ ", gender=" + gender + ", phone=" + phone + ", birth=" + birth + ", name=" + name + ", firstCnt="
				+ firstCnt + ", lastCnt=" + lastCnt + ", totalCnt=" + totalCnt + "]";
	}
	
	
}
