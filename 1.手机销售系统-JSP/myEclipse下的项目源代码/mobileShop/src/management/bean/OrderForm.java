package management.bean;

public class OrderForm {
	Integer id;
	String logname;
	String mess;
	Float sum;
	Integer status;
	
	public OrderForm() {
		
	}
	
	public OrderForm(Integer id,String logname,String mess,Float sum,Integer status) {
		this.id = id;
		this.logname = logname;
		this.mess = mess;
		this.sum = sum;
		this.status = status;
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getLogname() {
		return logname;
	}

	public void setLogname(String logname) {
		this.logname = logname;
	}

	public String getMess() {
		return mess;
	}

	public void setMess(String mess) {
		this.mess = mess;
	}

	public Float getSum() {
		return sum;
	}

	public void setSum(Float sum) {
		this.sum = sum;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

}
