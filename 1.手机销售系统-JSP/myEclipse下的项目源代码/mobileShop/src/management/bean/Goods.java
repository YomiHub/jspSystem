package management.bean;

public class Goods {
	private String mobile_version;
	private String mobile_name;
	private String mobile_made;
	private float mobile_price;
	private String mobile_mess;
	private String mobile_pic;
	private Integer id;
	public String getMobile_version() {
		return mobile_version;
	}

	public void setMobile_version(String mobile_version) {
		this.mobile_version = mobile_version;
	}

	public String getMobile_name() {
		return mobile_name;
	}

	public void setMobile_name(String mobile_name) {
		this.mobile_name = mobile_name;
	}

	public String getMobile_made() {
		return mobile_made;
	}

	public void setMobile_made(String mobile_made) {
		this.mobile_made = mobile_made;
	}

	public float getMobile_price() {
		return mobile_price;
	}

	public void setMobile_price(float mobile_price) {
		this.mobile_price = mobile_price;
	}

	public String getMobile_mess() {
		return mobile_mess;
	}

	public void setMobile_mess(String mobile_mess) {
		this.mobile_mess = mobile_mess;
	}

	public String getMobile_pic() {
		return mobile_pic;
	}

	public void setMobile_pic(String mobile_pic) {
		this.mobile_pic = mobile_pic;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Goods(String mobile_version, String mobile_name,String mobile_made,float mobile_price,String mobile_mess, String mobile_pic,
			Integer id) {
		this.mobile_version = mobile_version;
		this.mobile_name = mobile_name;
		this.mobile_made = mobile_made;
		this.mobile_price =mobile_price;
		this.mobile_mess = mobile_mess;
		this.mobile_pic = mobile_pic;
		this.id = id;
	}
	
}
