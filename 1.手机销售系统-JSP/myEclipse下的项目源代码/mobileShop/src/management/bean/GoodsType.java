package management.bean;


public class GoodsType {
	
	private Integer gtId;
	private String name;
	
	public GoodsType() {
		
	}
	public GoodsType(Integer gtId, String name) {
		this.gtId = gtId;
		this.name = name;
	}
	
	public GoodsType(String name) {
		this.name = name;
	}
	public Integer getGtId() {
		return gtId;
	}
	public void setGtId(Integer gtId) {
		this.gtId = gtId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}

