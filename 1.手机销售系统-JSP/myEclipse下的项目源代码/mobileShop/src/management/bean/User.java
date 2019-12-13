package management.bean;

public class User {
	String logname;
	String phone;
	String address;
	String realname;
	String password;

	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public User() {
		
	}
	
	public User(String name, String phone, String address,String realname) {
		this.logname = name;
		this.phone = phone;
		this.address = address;
		this.realname = realname;
	}


   
	public User(String name, String phone, String address,String realname, String password) {
		this.logname = name;
		this.phone = phone;
		this.address = address;
		this.realname = realname;
		this.password = password;
	}
	
	
	public User(String name,String realname) {
		this.logname = name;
		this.realname = realname;
	}
	

	public String getLogname() {
		return logname;
	}



	public void setLogname(String logname) {
		this.logname = logname;
	}



	public String getPhone() {
		return phone;
	}



	public void setPhone(String phone) {
		this.phone = phone;
	}



	public String getAddress() {
		return address;
	}



	public void setAddress(String address) {
		this.address = address;
	}



	public String getRealname() {
		return realname;
	}



	public void setRealname(String realname) {
		this.realname = realname;
	}



}

